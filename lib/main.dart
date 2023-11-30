import 'package:flutter/material.dart';
import 'package:new_app/bootstrap.dart';
import 'package:new_app/features/app/app.dart';

void main() async {
  await bootstrap(
    () => const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: App(),
    ),
  );
}