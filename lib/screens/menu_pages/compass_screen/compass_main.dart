import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:gozel_islam/screens/menu_pages/compass_screen/qiblah_compass.dart';
import 'loading_indicator.dart';



class CompassMain extends StatefulWidget {
  @override
  _CompassMainState createState() => _CompassMainState();
}

class _CompassMainState extends State<CompassMain> {
  final _deviceSupport = FlutterQiblah.androidDeviceSensorSupport();

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        body: FutureBuilder(
          future: _deviceSupport,
          builder: (_, AsyncSnapshot<bool?> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting)
              return LoadingIndicator();
            if (snapshot.hasError)
              return Center(
                child: Text("Xəta: ${snapshot.error.toString()}"),
              );

            if (snapshot.data!)
              return QiblahCompass();
            else return Center(
              child: Text("Xəta: ${snapshot.error.toString()}"),
            );

          },
        ),

    );
  }
}

