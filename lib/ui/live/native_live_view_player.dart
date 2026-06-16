import 'package:flutter/material.dart';
import '../../domain/entities/camera.dart';
import 'package:media_kit/media_kit.dart' as mk;
import 'package:media_kit_video/media_kit_video.dart';

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
  late final mk.Player player;
  late final VideoController controller;

  @override
  void initState() {
    super.initState();
    player = mk.Player();
    controller = VideoController(player);
    player.open(mk.Media(widget.uri), play: true);
    if (widget.isGrid) {
      player.setVolume(0.0);
    }
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Video(
      controller: controller,
      controls: widget.isGrid ? NoVideoControls : AdaptiveVideoControls,
    );
  }
}
