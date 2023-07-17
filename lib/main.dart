import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gozel_islam/screens/splash_screen/splash_screen.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'Constants.dart';
import 'firebase_options.dart';
Future <void> main() async{
  try {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  }catch (e) {}

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: appBarColor,
    statusBarColor: Colors.transparent,
  ));
  SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual, overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top]);

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  static FirebaseAnalyticsObserver observer =
  FirebaseAnalyticsObserver(analytics: analytics);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
        Provider<FirebaseAnalytics>.value(value: analytics),
        Provider<FirebaseAnalyticsObserver>.value(value: observer),],
      child: GetMaterialApp(
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
        navigatorObservers: <NavigatorObserver>[observer],
        home: SplashScreen(),
      ),
    );
  }
}

