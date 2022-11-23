import 'package:flutter/material.dart';
import 'package:mvvm_project/app/di.dart';
import 'app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initAppModule();
  runApp(App());
}
