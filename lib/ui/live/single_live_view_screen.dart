import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../domain/entities/camera.dart';
import 'package:easy_onvif/onvif.dart';
import 'package:easy_onvif/shared.dart' as onvif_shared;
import '../../state/settings_provider.dart';
import 'package:flutter/foundation.dart';
import 'live_view_player_factory.dart';

class SingleLiveViewScreen extends HookConsumerWidget {
  final Camera camera;

  const SingleLiveViewScreen({super.key, required this.camera});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text('${camera.name} Live View')),
      body: FutureBuilder<String>(
        future: _getRTSPUrl(camera, ref),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final rtspUrl = snapshot.data;
          if (rtspUrl == null || rtspUrl.isEmpty) {
            return const Center(child: Text('Could not obtain RTSP stream'));
          }

          return Column(
            children: [
              Expanded(
                child: CrossPlatformLivePlayer(
                  camera: camera,
                  uri: rtspUrl,
                  isGrid: false,
                ),
              ),
              if (camera.hasPtz) _PtzControls(camera: camera),
            ],
          );
        },
      ),
    );
  }

  Future<String> _getRTSPUrl(Camera camera, WidgetRef ref) async {
    final settings = ref.read(settingsProvider);
    final bridgeUrl = settings.getStreamUrl(camera.name, kIsWeb);
    if (bridgeUrl.isNotEmpty) {
      return bridgeUrl;
    }

    final onvif = await Onvif.connect(
      host: camera.host,
      username: camera.username,
      password: camera.password,
    );
    final media = onvif.media;
    final profiles = await media.getProfiles();
    if (profiles.isNotEmpty) {
      final streamUri = await media.getStreamUri(profiles.first.token);

      String uriString = streamUri.toString();
      try {
        uriString = (streamUri as dynamic).uri;
      } catch (e) {
        // fallback
      }

      final uri = Uri.parse(uriString);
      if (uri.userInfo.isEmpty) {
         final newUri = uri.replace(userInfo: '${camera.username}:${camera.password}');
         return newUri.toString();
      }
      return uriString;
    }
    throw Exception('No media profiles found');
  }
}

class _PtzControls extends StatelessWidget {
  final Camera camera;

  const _PtzControls({required this.camera});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(icon: const Icon(Icons.arrow_upward), onPressed: () => _movePtz(0, 1)),
          IconButton(icon: const Icon(Icons.arrow_downward), onPressed: () => _movePtz(0, -1)),
          IconButton(icon: const Icon(Icons.arrow_left), onPressed: () => _movePtz(-1, 0)),
          IconButton(icon: const Icon(Icons.arrow_right), onPressed: () => _movePtz(1, 0)),
        ],
      ),
    );
  }

  Future<void> _movePtz(double pan, double tilt) async {
    try {
      final onvif = await Onvif.connect(
        host: camera.host,
        username: camera.username,
        password: camera.password,
      );
      final ptz = onvif.ptz;
      final media = onvif.media;
      final profiles = await media.getProfiles();

      if (profiles.isNotEmpty) {
        await ptz.continuousMove(
           profiles.first.token,
           velocity: onvif_shared.PtzSpeed(
             panTilt: onvif_shared.Vector2D(x: pan, y: tilt),
           )
        );

        await Future.delayed(const Duration(milliseconds: 500));
        await ptz.stop(profiles.first.token, panTilt: true, zoom: false);
      }
    } catch (e) {
      debugPrint('PTZ Error: $e');
    }
  }
}
