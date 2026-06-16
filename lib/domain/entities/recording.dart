class Recording {
  final String recordingToken;
  final String trackToken;
  final DateTime startTime;
  final DateTime endTime;

  Recording({
    required this.recordingToken,
    required this.trackToken,
    required this.startTime,
    required this.endTime,
  });
}
