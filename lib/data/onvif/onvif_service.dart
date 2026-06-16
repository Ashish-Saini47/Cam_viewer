import 'package:easy_onvif/onvif.dart';
import '../../domain/entities/camera.dart';

class OnvifService {
  Future<Camera> connectAndDetectCapabilities(Camera camera) async {
    try {
      final onvif = await Onvif.connect(
        host: camera.host,
        username: camera.username,
        password: camera.password,
      );

      final device = onvif.deviceManagement;
      final capabilities = await device.getCapabilities();

      bool hasPtz = capabilities.ptz != null;
      bool hasProfileG = false;
      bool hasSnapshot = false;

      // Checking for Search / Replay (Profile G)
      try {
        final search = onvif.search;
        final replay = onvif.replay;
        if (search.runtimeType != Null && replay.runtimeType != Null) {
            hasProfileG = true;
        }
      } catch (e) {
        hasProfileG = false;
      }

      // Checking for snapshot support
      try {
        final media = onvif.media;
        final profiles = await media.getProfiles();
        if (profiles.isNotEmpty) {
           hasSnapshot = true;
        }
      } catch (e) {
         hasSnapshot = false;
      }


      return camera.copyWith(
        hasPtz: hasPtz,
        hasProfileG: hasProfileG,
        hasSnapshot: hasSnapshot,
      );

    } catch (e) {
      throw Exception('Failed to connect to ONVIF camera: $e');
    }
  }

  Future<List<Camera>> discoverCameras() async {
    // easy_onvif WS-Discovery
    // Note: Web might not support this, need to handle appropriately
    return [];
  }
}
