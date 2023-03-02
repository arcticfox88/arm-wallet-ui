import 'app_config.dart';

class ProdConfig implements AppConfig {
  static final ProdConfig _ins = ProdConfig._();

  ProdConfig._();

  factory ProdConfig() => _ins;

  @override
  String baseUrl() => "https://m.aplink.app/";
}
