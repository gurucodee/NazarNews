import 'dart:io';
import 'app.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(App());
  HttpOverrides.global = new MyHttpOverrides();
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
