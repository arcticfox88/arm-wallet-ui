import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppStateRepo {
  void dispose() {}
}

final appStateProvider = Provider<AppStateRepo>((ref) {
  final app = AppStateRepo();
  ref.onDispose(() => app.dispose());
  return app;
});
