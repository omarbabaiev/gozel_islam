import 'dart:async';
import 'dart:math' show pi;
import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geolocator/geolocator.dart';
import '../../../Constants.dart';
import 'loading_indicator.dart';
import 'location_error_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class QiblahCompass extends StatefulWidget {
  @override
  _QiblahCompassState createState() => _QiblahCompassState();
}

class _QiblahCompassState extends State<QiblahCompass> {
  final _locationStreamController =
  StreamController<LocationStatus>.broadcast();

  get stream => _locationStreamController.stream;

  @override
  void initState() {
    _checkLocationStatus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,

      appBar: AppBar(
        actions:
        [],
        scrolledUnderElevation: 3,
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        backgroundColor: appBarColor,
        title: Text("Qiblə", style: GoogleFonts.arimaMadurai(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),),

      ),
      body: Container(

    width: double.infinity,
    height: double.infinity,
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8.0),
        child: StreamBuilder(
          stream: stream,
          builder: (context, AsyncSnapshot<LocationStatus> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting)
              return LoadingIndicator();
            if (snapshot.data!.enabled == true) {
              switch (snapshot.data!.status) {
                case LocationPermission.always:
                case LocationPermission.whileInUse:
                  return Center(child: QiblahCompassWidget());

                case LocationPermission.denied:
                  return LocationErrorWidget(
                    error: "GPS aktiv olunmasına icazə verilmədi",
                    callback: _checkLocationStatus,
                  );
                case LocationPermission.deniedForever:
                  return LocationErrorWidget(
                    error: "Location service Denied Forever !",
                    callback: _checkLocationStatus,
                  );
              // case GeolocationStatus.unknown:
              //   return LocationErrorWidget(
              //     error: "Unknown Location service error",
              //     callback: _checkLocationStatus,
              //   );
                default:
                  return Container();
              }
            } else {
              return LocationErrorWidget(
                error: "Zəhmət olmasa GPS-i açın",
                callback: _checkLocationStatus,
              );
            }
          },
        ),
      ),
    );
  }

  Future<void> _checkLocationStatus() async {
    final locationStatus = await FlutterQiblah.checkLocationStatus();
    if (locationStatus.enabled &&
        locationStatus.status == LocationPermission.denied) {
      await FlutterQiblah.requestPermissions();
      final s = await FlutterQiblah.checkLocationStatus();
      _locationStreamController.sink.add(s);
    } else
      _locationStreamController.sink.add(locationStatus);
  }

  @override
  void dispose() {
    super.dispose();
    _locationStreamController.close();
    FlutterQiblah().dispose();
  }
}

class QiblahCompassWidget extends StatelessWidget {
  final _kaabaSvg = SvgPicture.asset('assets/4.svg', height: 300,);

  final _compassSvg = SvgPicture.asset('assets/5.svg', color: appBarColor.shade300,);
  final _needleSvg = SvgPicture.asset(
    'assets/3.svg',
    fit: BoxFit.contain,
    height: 300,
    alignment: Alignment.center,
    color: appBarColor.shade200,
  );


  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FlutterQiblah.qiblahStream,
      builder: (_, AsyncSnapshot<QiblahDirection> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting)
          return LoadingIndicator();

        final qiblahDirection = snapshot.data!;

        return Padding(
          padding: const EdgeInsets.all(15.0),
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Transform.rotate(
                filterQuality: FilterQuality.high,
                angle: (qiblahDirection.qiblah * (pi / 180) * -1),
                child: SvgPicture.asset('assets/5.svg',
                  color: qiblahDirection.qiblah.toInt() > -2 && qiblahDirection.qiblah.toInt() < 2 ? Colors.green : appBarColor.shade400,
                )
              ),
              _kaabaSvg,
              SvgPicture.asset(
                'assets/3.svg',
                fit: BoxFit.contain,
                height: 300,
                alignment: Alignment.center,
                color: qiblahDirection.qiblah.toInt() > -2 && qiblahDirection.qiblah.toInt() < 2 ? Colors.green : appBarColor.shade200,
              ),

              Positioned(
                bottom: 8,
                child: Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                    color: qiblahDirection.qiblah.toInt() > -2 && qiblahDirection.qiblah.toInt() < 2 ? Colors.green : appBarColor.shade400,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(" Qiblə dərəcəsi ${qiblahDirection.offset.toStringAsFixed(1)}°",
                      style: GoogleFonts.arimaMadurai(fontWeight: FontWeight.bold, color: Colors.white , fontSize: 20),),
                  ),
                ),
              ),

            ],

          ),
        );
      },
    );
  }
}