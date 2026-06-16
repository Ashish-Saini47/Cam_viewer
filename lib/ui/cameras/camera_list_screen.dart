import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../domain/entities/camera.dart';
import '../../state/cameras_provider.dart';
import '../live/single_live_view_screen.dart';
import '../live/multi_live_view_screen.dart';
import '../recordings/recordings_browse_screen.dart';
import '../downloads/downloads_manager_screen.dart';
import '../settings/settings_screen.dart';

class CameraListScreen extends HookConsumerWidget {
  const CameraListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final camerasAsync = ref.watch(camerasProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cameras'),
        actions: [
          IconButton(
            icon: const Icon(Icons.grid_view),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const MultiLiveViewScreen()),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.download),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const DownloadsManagerScreen()),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const SettingsScreen()),
              );
            },
          ),
        ],
      ),
      body: camerasAsync.when(
        data: (cameras) {
          if (cameras.isEmpty) {
            return const Center(child: Text('No cameras added yet.'));
          }
          return ListView.builder(
            itemCount: cameras.length,
            itemBuilder: (context, index) {
              final camera = cameras[index];
              return ListTile(
                title: Text(camera.name),
                subtitle: Text('${camera.host}:${camera.port}'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (camera.hasProfileG) const Icon(Icons.sd_storage, size: 16),
                    if (camera.hasPtz) const Icon(Icons.gamepad, size: 16),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        ref.read(camerasProvider.notifier).removeCamera(camera.id);
                      },
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => SingleLiveViewScreen(camera: camera),
                    ),
                  );
                },
                onLongPress: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => RecordingsBrowseScreen(camera: camera),
                    ),
                  );
                },
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (_) => const AddCameraScreen()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class AddCameraScreen extends HookConsumerWidget {
  const AddCameraScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nameController = TextEditingController();
    final hostController = TextEditingController();
    final portController = TextEditingController(text: '80');
    final usernameController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Add Camera')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: nameController, decoration: const InputDecoration(labelText: 'Name')),
            TextField(controller: hostController, decoration: const InputDecoration(labelText: 'Host/IP')),
            TextField(controller: portController, decoration: const InputDecoration(labelText: 'Port')),
            TextField(controller: usernameController, decoration: const InputDecoration(labelText: 'Username')),
            TextField(controller: passwordController, decoration: const InputDecoration(labelText: 'Password'), obscureText: true),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                final port = int.tryParse(portController.text) ?? 80;
                final camera = Camera(
                  name: nameController.text,
                  host: hostController.text,
                  port: port,
                  username: usernameController.text,
                  password: passwordController.text,
                );

                try {
                  await ref.read(camerasProvider.notifier).addCamera(camera);
                  if (context.mounted) Navigator.of(context).pop();
                } catch (e) {
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: $e')));
                  }
                }
              },
              child: const Text('Add & Connect'),
            )
          ],
        ),
      ),
    );
  }
}
