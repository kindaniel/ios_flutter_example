import 'package:flutter/material.dart';
import 'package:flutter_module_add_to_ios/flutter_bridge.dart';
import 'package:flutter_module_add_to_ios/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  FlutterBridge.instance.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage());
  }
}
