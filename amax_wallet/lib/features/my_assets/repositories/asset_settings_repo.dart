

import 'package:flutter_riverpod/flutter_riverpod.dart';

class AssetSettingsRepo {
  void dispose() {}
}

final assetSettingsProvider = Provider<AssetSettingsRepo>((ref) {
  final app = AssetSettingsRepo();
  ref.onDispose(() => app.dispose());
  return app;
});
