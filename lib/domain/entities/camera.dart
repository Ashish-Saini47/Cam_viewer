import 'package:uuid/uuid.dart';

class Camera {
  final String id;
  final String name;
  final String host;
  final int port;
  final String username;
  final String password; // Should be handled securely, maybe only DB id stored, or fully encrypted

  // Capability flags
  final bool hasPtz;
  final bool hasProfileG;
  final bool hasSnapshot;

  Camera({
    String? id,
    required this.name,
    required this.host,
    this.port = 80,
    required this.username,
    required this.password,
    this.hasPtz = false,
    this.hasProfileG = false,
    this.hasSnapshot = false,
  }) : id = id ?? const Uuid().v4();

  Camera copyWith({
    String? id,
    String? name,
    String? host,
    int? port,
    String? username,
    String? password,
    bool? hasPtz,
    bool? hasProfileG,
    bool? hasSnapshot,
  }) {
    return Camera(
      id: id ?? this.id,
      name: name ?? this.name,
      host: host ?? this.host,
      port: port ?? this.port,
      username: username ?? this.username,
      password: password ?? this.password,
      hasPtz: hasPtz ?? this.hasPtz,
      hasProfileG: hasProfileG ?? this.hasProfileG,
      hasSnapshot: hasSnapshot ?? this.hasSnapshot,
    );
  }
}
