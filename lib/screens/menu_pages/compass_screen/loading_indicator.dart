import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    return Container(
      alignment: Alignment.center,
      child:  Lottie.asset("assets/progres.json", height: 100),
    );
  }
}