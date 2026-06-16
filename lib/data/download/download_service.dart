import 'package:flutter/foundation.dart';
import 'package:ffmpeg_kit_flutter_min/ffmpeg_kit.dart';
import 'package:ffmpeg_kit_flutter_min/return_code.dart';

class DownloadService {
  Future<bool> startDownload({
    required String uri,
    required String outputPath,
    DateTime? clipStart,
    DateTime? clipEnd,
    Function(double progress)? onProgress,
  }) async {
    if (kIsWeb) {
      throw Exception('Direct RTSP downloading is not supported on Web. Please use the MediaMTX bridge server path or Native apps.');
    }

    String command = '-i "$uri"';

    if (clipStart != null && clipEnd != null) {
      final duration = clipEnd.difference(clipStart).inSeconds;
      command = '-i "$uri" -t $duration';
    }

    // copy codec to avoid re-encoding
    command += ' -c copy "$outputPath"';

    await FFmpegKit.executeAsync(
      command,
      (session) async {
        final returnCode = await session.getReturnCode();
        if (ReturnCode.isSuccess(returnCode)) {
          debugPrint('Download completed successfully.');
        } else if (ReturnCode.isCancel(returnCode)) {
          debugPrint('Download canceled.');
        } else {
          debugPrint('Download failed with return code $returnCode.');
        }
      },
      (log) {},
      (statistics) {},
    );

    return true;
  }
}
