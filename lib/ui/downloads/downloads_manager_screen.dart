import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:drift/drift.dart' as drift;
import '../../domain/entities/download_job.dart';
import '../../data/persistence/database.dart';
import '../../data/download/download_service.dart';
import '../../state/cameras_provider.dart';

// Provide DownloadService
final downloadServiceProvider = Provider<DownloadService>((ref) {
  return DownloadService();
});

final downloadsProvider = AsyncNotifierProvider<DownloadsNotifier, List<DownloadJob>>(() {
  return DownloadsNotifier();
});

class DownloadsNotifier extends AsyncNotifier<List<DownloadJob>> {
  @override
  Future<List<DownloadJob>> build() async {
    return _loadDownloads();
  }

  Future<List<DownloadJob>> _loadDownloads() async {
    final db = ref.read(databaseProvider);
    final downloadsData = await db.select(db.downloadsTable).get();

    return downloadsData.map((row) => DownloadJob(
      id: row.id,
      cameraId: row.cameraId,
      sourceUri: row.sourceUri,
      outputPath: row.outputPath,
      startTime: row.startTime,
      endTime: row.endTime,
      progress: row.progress,
      status: DownloadJobStatus.values[row.status],
      errorMessage: row.errorMessage,
    )).toList();
  }

  Future<void> addDownloadJob(DownloadJob job) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final db = ref.read(databaseProvider);

      await db.into(db.downloadsTable).insert(DownloadsTableCompanion.insert(
        id: job.id,
        cameraId: job.cameraId,
        sourceUri: job.sourceUri,
        outputPath: job.outputPath,
        startTime: job.startTime,
        endTime: job.endTime,
        progress: const drift.Value(0.0),
        status: drift.Value(job.status.index),
      ));

      final downloadService = ref.read(downloadServiceProvider);
      // Start download but don't await blocking completion.
      // In a real app we might want to update DB with progress here or listen to events
      downloadService.startDownload(
        uri: job.sourceUri,
        outputPath: job.outputPath,
      ).catchError((e) {
        // handle failure
        debugPrint('Download error: $e');
        return false;
      });

      return _loadDownloads();
    });
  }

  Future<void> cancelJob(String jobId) async {
      // In a real app we'd cancel the FFmpeg session here
      final db = ref.read(databaseProvider);
      await (db.delete(db.downloadsTable)..where((tbl) => tbl.id.equals(jobId))).go();

      state = await AsyncValue.guard(() async {
        return _loadDownloads();
      });
  }
}

class DownloadsManagerScreen extends HookConsumerWidget {
  const DownloadsManagerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final downloadsAsync = ref.watch(downloadsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Downloads')),
      body: downloadsAsync.when(
        data: (downloads) {
          if (downloads.isEmpty) {
            return const Center(child: Text('No active or completed downloads.'));
          }

          return ListView.builder(
            itemCount: downloads.length,
            itemBuilder: (context, index) {
              final job = downloads[index];
              return ListTile(
                title: Text('Download: ${job.cameraId}'),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Status: ${job.status.name}'),
                    LinearProgressIndicator(value: job.progress),
                  ],
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.cancel),
                  onPressed: () {
                    ref.read(downloadsProvider.notifier).cancelJob(job.id);
                  },
                ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, st) => Center(child: Text('Error: $e')),
      ),
    );
  }
}
