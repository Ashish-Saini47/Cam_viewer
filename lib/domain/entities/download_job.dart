import 'package:uuid/uuid.dart';

enum DownloadJobStatus {
  pending,
  downloading,
  completed,
  failed,
  canceled,
}

class DownloadJob {
  final String id;
  final String cameraId;
  final String sourceUri;
  final String outputPath;
  final DateTime startTime;
  final DateTime endTime;
  final double progress;
  final DownloadJobStatus status;
  final String? errorMessage;

  DownloadJob({
    String? id,
    required this.cameraId,
    required this.sourceUri,
    required this.outputPath,
    required this.startTime,
    required this.endTime,
    this.progress = 0.0,
    this.status = DownloadJobStatus.pending,
    this.errorMessage,
  }) : id = id ?? const Uuid().v4();

  DownloadJob copyWith({
    String? id,
    String? cameraId,
    String? sourceUri,
    String? outputPath,
    DateTime? startTime,
    DateTime? endTime,
    double? progress,
    DownloadJobStatus? status,
    String? errorMessage,
  }) {
    return DownloadJob(
      id: id ?? this.id,
      cameraId: cameraId ?? this.cameraId,
      sourceUri: sourceUri ?? this.sourceUri,
      outputPath: outputPath ?? this.outputPath,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      progress: progress ?? this.progress,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
