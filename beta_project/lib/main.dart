import 'package:beta_project/app/app.dart';
import 'package:beta_project/core/injection/service_locator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  // Ensure widgets binding
  WidgetsFlutterBinding.ensureInitialized();

  // inject here
  await registerServices();

  // Set orientation
  if (defaultTargetPlatform == TargetPlatform.android ||
      defaultTargetPlatform == TargetPlatform.iOS) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));
    SystemChrome.setEnabledSystemUIOverlays([
      SystemUiOverlay.bottom,
      SystemUiOverlay.top,
    ]);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  // run application
  runApp(HomeSysApp());
}
