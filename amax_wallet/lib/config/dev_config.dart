

import 'package:amax_wallet/config/app_config.dart';

class DevConfig implements AppConfig{
  static final DevConfig _ins = DevConfig._();

  DevConfig._();

  factory DevConfig() => _ins;

  @override
  String baseUrl() => "https://m-ap.ambt.art/";

}