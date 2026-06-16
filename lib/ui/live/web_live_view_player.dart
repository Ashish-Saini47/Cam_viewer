import 'package:flutter/material.dart';
import '../../domain/entities/camera.dart';

class CrossPlatformLivePlayer extends StatefulWidget {
  final Camera camera;
  final String uri;
  final bool isGrid;

  const CrossPlatformLivePlayer({
    super.key,
    required this.camera,
    required this.uri,
    this.isGrid = false,
  });

  @override
  State<CrossPlatformLivePlayer> createState() => _CrossPlatformLivePlayerState();
}

class _CrossPlatformLivePlayerState extends State<CrossPlatformLivePlayer> {
  // In a full implementation, here we would initialize flutter_webrtc with WHEP signaling
  // For the sake of this test/scaffold, we show a placeholder indicating WebRTC/HLS playback
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black87,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.public, color: Colors.white54, size: 48),
            const SizedBox(height: 8),
            Text(
              'WebRTC / HLS Bridge\n${widget.camera.name}\nURI: ${widget.uri}',
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
