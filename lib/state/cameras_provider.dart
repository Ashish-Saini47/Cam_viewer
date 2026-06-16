import 'package:drift/drift.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../domain/entities/camera.dart';
import '../data/persistence/database.dart';
import '../data/onvif/onvif_service.dart';

final databaseProvider = Provider<AppDatabase>((ref) {
  return AppDatabase();
});

final onvifServiceProvider = Provider<OnvifService>((ref) {
  return OnvifService();
});

final camerasProvider = AsyncNotifierProvider<CamerasNotifier, List<Camera>>(() {
  return CamerasNotifier();
});

class CamerasNotifier extends AsyncNotifier<List<Camera>> {
  @override
  Future<List<Camera>> build() async {
    return _loadCameras();
  }

  Future<List<Camera>> _loadCameras() async {
    final db = ref.read(databaseProvider);
    final camerasData = await db.select(db.camerasTable).get();
    return camerasData.map((row) => Camera(
      id: row.id,
      name: row.name,
      host: row.host,
      port: row.port,
      username: row.username,
      password: row.password,
      hasPtz: row.hasPtz,
      hasProfileG: row.hasProfileG,
      hasSnapshot: row.hasSnapshot,
    )).toList();
  }

  Future<void> addCamera(Camera camera) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final db = ref.read(databaseProvider);
      final onvifService = ref.read(onvifServiceProvider);

      // 1. Connect and detect capabilities
      final connectedCamera = await onvifService.connectAndDetectCapabilities(camera);

      // 2. Save to DB
      await db.into(db.camerasTable).insert(CamerasTableCompanion.insert(
        id: connectedCamera.id,
        name: connectedCamera.name,
        host: connectedCamera.host,
        port: connectedCamera.port,
        username: connectedCamera.username,
        password: connectedCamera.password, // Should be encrypted in real app using flutter_secure_storage
        hasPtz: Value(connectedCamera.hasPtz),
        hasProfileG: Value(connectedCamera.hasProfileG),
        hasSnapshot: Value(connectedCamera.hasSnapshot),
      ));

      // 3. Reload
      return _loadCameras();
    });
  }

  Future<void> removeCamera(String id) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final db = ref.read(databaseProvider);
      await (db.delete(db.camerasTable)..where((t) => t.id.equals(id))).go();
      return _loadCameras();
    });
  }
}
