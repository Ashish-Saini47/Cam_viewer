import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../state/settings_provider.dart';
import '../../domain/entities/app_settings.dart';

class SettingsScreen extends HookConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        children: [
          ListTile(
            title: const Text('MediaMTX Bridge URL'),
            subtitle: Text(settings.mediaMtxBaseUrl),
            onTap: () {
              // TODO: Show dialog to edit
            },
          ),
          SwitchListTile(
            title: const Text('Force Bridge on Native'),
            subtitle: const Text('Use WebRTC/HLS even on Android/Windows'),
            value: settings.enableWebBridgeOnNative,
            onChanged: (val) {
              ref.read(settingsProvider.notifier).updateSettings(AppSettings(
                mediaMtxBaseUrl: settings.mediaMtxBaseUrl,
                enableWebBridgeOnNative: val,
              ));
            },
          )
        ],
      ),
    );
  }
}
