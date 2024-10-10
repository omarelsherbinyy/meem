import 'package:hive_flutter/hive_flutter.dart';
import 'package:meem/core/utils/constant.dart';

saveDataLocally({required String key, required String? value}) async {
  Hive.box(Constants.tokenBox).put(key, value);
}
