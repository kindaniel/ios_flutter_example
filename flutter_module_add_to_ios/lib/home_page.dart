import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_module_add_to_ios/header_req.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const platform = MethodChannel('samples.flutter.dev/cookies');

  String _cookies = 'Unknown cookies.';

  Future<void> _getCookies() async {
    String cookies;
    try {
      final dynamic result = await platform.invokeMethod('getCookies');
      final headerReq = HeaderReq(
        name: result['name'] ?? '',
        value: result['value'] ?? '',
        deviceId: result['deviceId'] ?? '',
      );
      cookies = headerReq.toString();
    } catch (e) {
      cookies = e.toString();
    }

    setState(() {
      _cookies = cookies;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Text(_cookies),
            ),
            OutlinedButton(
              onPressed: () => _getCookies(),
              child: const Text('Get Cookies'),
            )
          ],
        ),
      ),
    );
  }
}
