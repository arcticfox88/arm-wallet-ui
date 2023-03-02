import 'package:amax_wallet/config/app_config.dart';
import 'package:amax_wallet/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gio/gio.dart';

void main() {
  Gio.option = GioOption(
    enableLog: true,
      basePath: AppConfig(isProduction: true).baseUrl());
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context,ref) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerConfig: ref.watch(routerProvider),
    );
  }
}
