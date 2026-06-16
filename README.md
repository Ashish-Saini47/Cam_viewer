# Cross-Platform ONVIF Camera Client

A Flutter application that connects to ONVIF-enabled IP cameras. It allows you to:
- View live footage from multiple cameras simultaneously.
- Browse recordings stored on the camera's SD card.
- Download full recordings or specific time-range clips.

## Supported Platforms
- Android
- Windows
- Web

## Technical Constraints & Limitations
### Web Platform & RTSP
RTSP cannot be played natively in web browsers. For web builds, this app consumes WebRTC or HLS/LL-HLS by connecting to a media-server bridge (MediaMTX) that republishes each camera's RTSP stream. Direct recording downloads (muxing RTSP directly via FFmpeg) are also unsupported in the browser; these actions are gracefully disabled with an explanatory note when running on the web. Native targets (Android/Windows) handle RTSP natively using `media_kit` and `ffmpeg_kit_flutter`.

### ONVIF Profile G (Recordings)
Many lower-cost cameras have partial or non-existent support for ONVIF Profile G (Search/Replay). This app detects camera capabilities at runtime. If a camera lacks support, the app gracefully degrades, explicitly noting that recording browse/download features are unsupported for that device.

## Setup Instructions

1. Ensure Flutter is installed and configured for Android, Windows, and Web.
2. Clone the repository.
3. Run `flutter pub get` to install dependencies.
4. Run `dart run build_runner build` to generate the Drift database and ONVIF files.

### MediaMTX Setup (Required for Web Live View)
If you intend to use the web build (or force bridging on native targets), you must have MediaMTX running.

Example `mediamtx.yml`:
```yaml
paths:
  cam1:
    source: rtsp://username:password@192.168.1.100:554/stream1
```

In the app Settings, configure the MediaMTX base URL (e.g., `http://192.168.1.50:8889`).

## Building & Running
```bash
# Android
flutter run -d android

# Windows
flutter run -d windows

# Web
flutter run -d chrome
```

## Architecture
- **State Management**: Riverpod (`hooks_riverpod`, `flutter_riverpod`)
- **Persistence**: Drift (SQLite on native, IndexedDB on web via `drift_web`)
- **ONVIF**: `easy_onvif` wrapper handling capabilities detection and WS-Discovery.
- **Playback**: `media_kit` (native RTSP) and `video_player`/custom WebRTC placeholders (web).
- **Downloading**: `ffmpeg_kit_flutter` (native).
