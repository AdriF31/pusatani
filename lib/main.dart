import 'package:flutter/material.dart';
import 'package:pusatani/bindings/global_bindings.dart';
import 'package:pusatani/pusatani.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // HttpOverrides.global = MyHttpOverrides();
  GlobalBindings().dependencies();
  runApp(const Pusatani());
}
