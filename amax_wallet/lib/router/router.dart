import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../app/application.dart';
import '../features/create_account/presentation/create_account_page.dart';
import '../features/my_assets/presentation/my_assets_page.dart';
import '../features/splash/splash.dart';

final routerProvider = Provider((ref) => GoRouter(
      navigatorKey: ref.watch(navigatorProvider),
      routes: <GoRoute>[
        GoRoute(
            builder: (c, _) => const Splash(),
            path: '/',
            redirect: (ctx, _) async {
              return '/create';
            }),
        GoRoute(
          path: '/create',
          builder: (context, state) {
            return CreateAccountPage();
          },
        ),
        GoRoute(
          path: '/assets',
          builder: (context, state) {
            return MyAssetsPage();
          },
        ),
      ],
    ));
