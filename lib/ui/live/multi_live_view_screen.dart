import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../domain/entities/camera.dart';
import '../../state/cameras_provider.dart';
import 'package:easy_onvif/onvif.dart';
import '../../state/settings_provider.dart';
import 'package:flutter/foundation.dart';
import 'live_view_player_factory.dart';

class MultiLiveViewScreen extends HookConsumerWidget {
  const MultiLiveViewScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final camerasAsync = ref.watch(camerasProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Multi-Camera Live View')),
      body: camerasAsync.when(
        data: (cameras) {
          if (cameras.isEmpty) {
            return const Center(child: Text('No cameras available for live view.'));
          }

          int crossAxisCount = 2;
          if (cameras.length > 4) crossAxisCount = 3;

          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              childAspectRatio: 16 / 9,
            ),
            itemCount: cameras.length,
            itemBuilder: (context, index) {
              return _GridTile(camera: cameras[index]);
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, st) => Center(child: Text('Error: $e')),
      ),
    );
  }
}

class _GridTile extends HookConsumerWidget {
  final Camera camera;

  const _GridTile({required this.camera});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder<String>(
      future: _getStreamUrl(camera, ref),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
            color: Colors.black,
            child: const Center(child: CircularProgressIndicator()),
          );
        }
        if (snapshot.hasError) {
          return Container(
            color: Colors.black87,
            child: Center(child: Text('Error: ${snapshot.error}', style: const TextStyle(color: Colors.red))),
          );
        }
        final url = snapshot.data;
        if (url == null || url.isEmpty) {
          return Container(color: Colors.black);
        }

        return Stack(
          children: [
            Positioned.fill(
              child: CrossPlatformLivePlayer(
                camera: camera,
                uri: url,
                isGrid: true,
              ),
            ),
            Positioned(
              bottom: 4,
              left: 4,
              child: Container(
                color: Colors.black54,
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                child: Text(
                  camera.name,
                  style: const TextStyle(color: Colors.white, fontSize: 10),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Future<String> _getStreamUrl(Camera camera, WidgetRef ref) async {
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
    if (profiles.isEmpty) throw Exception('No profiles');

    // Try lower res profile
    final token = profiles.length > 1 ? profiles[1].token : profiles[0].token;
    final streamUri = await media.getStreamUri(token);

    String uriString = streamUri.toString();
    try { uriString = (streamUri as dynamic).uri; } catch (_) {}

    final uri = Uri.parse(uriString);
    if (uri.userInfo.isEmpty) {
      uriString = uri.replace(userInfo: '${camera.username}:${camera.password}').toString();
    }
    return uriString;
  }
}
