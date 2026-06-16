import 'package:flutter_test/flutter_test.dart';
import 'package:app/domain/entities/camera.dart';

void main() {
  test('Camera entity instantiates properly', () {
    final camera = Camera(
      name: 'Test Cam',
      host: '192.168.1.1',
      username: 'admin',
      password: 'password',
    );

    expect(camera.name, 'Test Cam');
    expect(camera.host, '192.168.1.1');
    expect(camera.username, 'admin');
    expect(camera.password, 'password');
    expect(camera.port, 80);
    expect(camera.hasPtz, isFalse);
    expect(camera.hasProfileG, isFalse);
    expect(camera.hasSnapshot, isFalse);
    expect(camera.id, isNotEmpty);
  });

  test('Camera copyWith updates specified fields', () {
    final camera = Camera(
      name: 'Test Cam',
      host: '192.168.1.1',
      username: 'admin',
      password: 'password',
    );

    final updated = camera.copyWith(name: 'Updated Cam', hasPtz: true);

    expect(updated.name, 'Updated Cam');
    expect(updated.hasPtz, isTrue);
    expect(updated.host, '192.168.1.1');
    expect(updated.id, camera.id);
  });
}
