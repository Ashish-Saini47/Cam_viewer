import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../domain/entities/camera.dart';
import '../../domain/entities/recording.dart';
import 'package:easy_onvif/onvif.dart';
import 'package:easy_onvif/media1.dart' as media1;
import '../live/live_view_player_factory.dart';
import 'package:flutter/foundation.dart';
import '../../state/settings_provider.dart';
import '../downloads/downloads_manager_screen.dart';
import '../../domain/entities/download_job.dart';

class RecordingsBrowseScreen extends HookConsumerWidget {
  final Camera camera;

  const RecordingsBrowseScreen({super.key, required this.camera});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (!camera.hasProfileG) {
      return Scaffold(
        appBar: AppBar(title: Text('${camera.name} Recordings')),
        body: const Center(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Recording browse (Profile G) is not supported by this camera over ONVIF.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text('${camera.name} Recordings')),
      body: FutureBuilder<List<Recording>>(
        future: _fetchRecordings(camera),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final recordings = snapshot.data ?? [];
          if (recordings.isEmpty) {
            return const Center(child: Text('No recordings found.'));
          }

          return ListView.builder(
            itemCount: recordings.length,
            itemBuilder: (context, index) {
              final rec = recordings[index];
              return ListTile(
                leading: const Icon(Icons.video_file),
                title: Text('Recording: ${rec.startTime.toLocal()}'),
                subtitle: Text('End: ${rec.endTime.toLocal()}'),
                onTap: () {
                   Navigator.of(context).push(
                     MaterialPageRoute(
                       builder: (_) => RecordingPlaybackScreen(
                         camera: camera,
                         recording: rec,
                       ),
                     ),
                   );
                },
              );
            },
          );
        },
      ),
    );
  }

  Future<List<Recording>> _fetchRecordings(Camera camera) async {
    final onvif = await Onvif.connect(
      host: camera.host,
      username: camera.username,
      password: camera.password,
    );

    try {
      final search = onvif.search;
      final recordings = await search.getRecordingSummary();
      return [
        Recording(
          recordingToken: 'recording_1',
          trackToken: 'track_1',
          startTime: recordings.dataFrom ?? DateTime.now().subtract(const Duration(hours: 1)),
          endTime: recordings.dataUntil ?? DateTime.now(),
        )
      ];
    } catch (e) {
      debugPrint('Error searching recordings: $e');
      return [];
    }
  }
}

class RecordingPlaybackScreen extends HookConsumerWidget {
  final Camera camera;
  final Recording recording;

  const RecordingPlaybackScreen({super.key, required this.camera, required this.recording});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Playback')),
      body: FutureBuilder<String>(
        future: _getReplayUri(camera, recording, ref),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final uri = snapshot.data;
          if (uri == null || uri.isEmpty) {
            return const Center(child: Text('Could not obtain Replay stream'));
          }

          return Column(
            children: [
              Expanded(
                child: CrossPlatformLivePlayer(
                  camera: camera,
                  uri: uri,
                  isGrid: false,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text('Start: ${recording.startTime.toLocal()}\nEnd: ${recording.endTime.toLocal()}'),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  final job = DownloadJob(
                    cameraId: camera.id,
                    sourceUri: uri,
                    outputPath: '/storage/emulated/0/Download/${camera.name}_${recording.recordingToken}.mp4', // Example path
                    startTime: recording.startTime,
                    endTime: recording.endTime,
                  );
                  ref.read(downloadsProvider.notifier).addDownloadJob(job);

                  ScaffoldMessenger.of(context).showSnackBar(
                     const SnackBar(content: Text('Download started (Check Downloads Manager)'))
                  );
                },
                icon: const Icon(Icons.download),
                label: const Text('Download Full Clip'),
              ),
              const SizedBox(height: 16),
            ],
          );
        },
      ),
    );
  }

  Future<String> _getReplayUri(Camera camera, Recording recording, WidgetRef ref) async {
    final settings = ref.read(settingsProvider);

    if (kIsWeb || settings.enableWebBridgeOnNative) {
       return '${settings.mediaMtxBaseUrl}/${camera.name}/replay/${recording.recordingToken}';
    }

    final onvif = await Onvif.connect(
      host: camera.host,
      username: camera.username,
      password: camera.password,
    );

    try {
      final replay = onvif.replay;

      final uriResponse = await replay.getReplayUri(
         recording.recordingToken,
         streamSetup: media1.StreamSetup(
            stream: 'RTP-Unicast', // according to typical StreamType enum string representation if it's enum or string
            transport: media1.Transport(
              protocol: 'RTSP', // string representation
            )
         )
      );

      String uriString = uriResponse;
      final uri = Uri.parse(uriString);
      if (uri.userInfo.isEmpty) {
        uriString = uri.replace(userInfo: '${camera.username}:${camera.password}').toString();
      }
      return uriString;
    } catch (e) {
      throw Exception('Failed to get Replay URI: $e');
    }
  }
}
