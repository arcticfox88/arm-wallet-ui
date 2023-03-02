import 'package:amax_wallet/config/dev_config.dart';
import 'package:flutter/foundation.dart';

import 'prod_config.dart';

abstract class AppConfig {
  factory AppConfig({bool? isProduction}) =>
      (isProduction ?? kReleaseMode) ? ProdConfig() : DevConfig();

  String baseUrl();
}
