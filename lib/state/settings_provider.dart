import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../domain/entities/app_settings.dart';

class SettingsNotifier extends Notifier<AppSettings> {
  @override
  AppSettings build() {
    return AppSettings(
      mediaMtxBaseUrl: 'http://localhost:8889',
      enableWebBridgeOnNative: false,
    );
  }

  void updateSettings(AppSettings newSettings) {
    state = newSettings;
  }
}

final settingsProvider = NotifierProvider<SettingsNotifier, AppSettings>(() {
  return SettingsNotifier();
});
