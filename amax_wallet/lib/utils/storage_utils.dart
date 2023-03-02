

import 'package:amax_wallet/utils/hash_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

Future<Box> getAppStorage()async{
  var path = await compute(doMd5,"app_settings");
  return Hive.openBox(path);
}
