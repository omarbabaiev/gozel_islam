import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gozel_islam/screens/splash_screen/splash_screen.dart';
import 'package:get/get.dart';

import 'Constants.dart';
Future <void> main() async{
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: appBarColor,
    statusBarColor: Colors.transparent,
  ));
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual, overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top]);

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 0.8),
          child: child ?? Container(),
        );
      },
      debugShowCheckedModeBanner: false,
      title: 'Gözəl İslam',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.amber.shade100,
        appBarTheme: AppBarTheme(iconTheme: IconThemeData(color: Colors.amber.shade100)),
        colorScheme: ColorScheme.fromSeed(seedColor: appBarColor),
        useMaterial3: true,
      ),
      home: SplashScreen(),
    );
  }
}

