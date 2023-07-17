import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../../Constants.dart';

class MapMosque extends StatefulWidget {
  const MapMosque({Key? key}) : super(key: key);

  @override
  State<MapMosque> createState() => _MapMosqueState();
}

class _MapMosqueState extends State<MapMosque> {
  bool zor = false;
  double progress = 0;
  InAppWebViewController? _controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 3,
        centerTitle: true,
        backgroundColor: appBarColor,
        title: Text("Məscidlər", style: GoogleFonts.arimaMadurai(color: Colors.white, fontWeight: FontWeight.bold, ),),

      ),

      body: Center(
          child: Container(
            child: Column(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: InAppWebView(

                          initialUrlRequest:
                          URLRequest(url: Uri.parse('https://www.google.az/maps/search/mosque/')),
                          androidOnGeolocationPermissionsShowPrompt:
                              (InAppWebViewController controller, String origin) async {
                            return GeolocationPermissionShowPromptResponse(
                                origin: origin,
                                allow: true,
                                retain: true
                            );
                          },
                          onProgressChanged: (InAppWebViewController controller, int progress) {
                            setState(() {
                              this.progress = progress / 100;
                            });
                          },
                        ),
                      ),
                      Align(
                          alignment: Alignment.center,
                          child: _buildProgressBar()
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
      ),
    );
  }

  Widget _buildProgressBar() {
    if (progress != 1.0) {
      return Center(child: Lottie.asset("assets/progres.json", height: 100));
// You can use LinearProgressIndicator also
//      return LinearProgressIndicator(
//        value: progress,
//        valueColor: new AlwaysStoppedAnimation<Color>(Colors.orange),
//        backgroundColor: Colors.blue,
//      );
    }
    return Container();
  }
}











