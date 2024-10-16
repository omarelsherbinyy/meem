import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meem/core/utils/constant.dart';
import 'package:meem/core/utils/di/di.dart';
import 'package:meem/meem_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox(Constants.tokenBox);
  setUp();
  runApp(const MeemApp());
}