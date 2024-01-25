import 'package:flutter/material.dart';

import 'app.dart';
import 'domain/di/di.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const App(title: "Weather",));
}
