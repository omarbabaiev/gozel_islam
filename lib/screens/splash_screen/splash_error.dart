import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gozel_islam/Constants.dart';
import 'package:gozel_islam/screens/splash_screen/splash_screen.dart';
import 'package:lottie/lottie.dart';


class SplashError extends StatelessWidget {
  const SplashError({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: appBarColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset("assets/75267-no-wifi.json",height: 200 ),
              Text("İnternet bağlantısı yoxdur",  style: TextStyle(
                fontWeight: FontWeight.bold,
                  color: Colors.white
              ),),
              SizedBox(height: 20,),

              OutlinedButton(
                style: OutlinedButton.styleFrom(backgroundColor: Colors.white),
                onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> SplashScreen()));

              },
                child: Text("Yenilə", style: TextStyle(color: appBarColor),),)

            ],
          ),
        )
    );
  }
}