import 'package:flutter/material.dart';
import '../../domain/entities/camera.dart';

abstract class LiveViewPlayer extends Widget {
  const LiveViewPlayer({super.key});

  factory LiveViewPlayer.create({
    Key? key,
    required Camera camera,
    required String uri,
    bool isGrid = false,
  }) {
    throw UnimplementedError('Cannot instantiate abstract class');
  }
}
