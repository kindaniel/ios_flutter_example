import 'package:flutter/services.dart';

class FlutterBridge {
  static const channel = MethodChannel('flutter_to_native');

  FlutterBridge._privateConstructor();
  static final FlutterBridge instance = FlutterBridge._privateConstructor();

  Future<void> initialize() async {
    channel.setMethodCallHandler((call) async {
      switch (call.method) {
        case "someMethod":
          return someMethod();
        default:
          throw MissingPluginException();
      }
    });
  }

  String someMethod() {
    return "Felipe Bastos";
  }
}
