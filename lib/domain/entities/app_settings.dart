import 'package:flutter/foundation.dart';

class AppSettings {
  final String mediaMtxBaseUrl;
  final bool enableWebBridgeOnNative;

  AppSettings({
    required this.mediaMtxBaseUrl,
    required this.enableWebBridgeOnNative,
  });

  String getStreamUrl(String cameraName, bool isWeb) {
    // If we're on web, we *must* use the bridge.
    // If native, only use it if forced, otherwise we would use RTSP directly.
    if (kIsWeb || enableWebBridgeOnNative) {
      // Return WHEP or HLS url
      // Assuming MediaMTX WHEP endpoint format:
      return '$mediaMtxBaseUrl/$cameraName/whep';
    }
    return ''; // empty means use native RTSP logic
  }
}
