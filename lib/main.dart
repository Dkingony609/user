import 'package:flutter/material.dart';
import 'package:user/pages/loading.dart';
import 'package:user/pages/home.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => Loading(),
      '/home': (context) => Home(),
    },
  ));
}