import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../constants.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:mailto/mailto.dart';

class AboutUs extends StatelessWidget {

  launchMailto() async {
    final mailtoLink = Mailto(
      to: ['admin@gozelislam.com'],
    );
    // Convert the Mailto instance into a string.
    // Use either Dart's string interpolation
    // or the toString() method.
    await launch('$mailtoLink');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 3,
          centerTitle: true,
          backgroundColor: appBarColor,
          title: Text("Haqqımızda", style: GoogleFonts.arimaMadurai(color: Colors.white, fontWeight: FontWeight.bold, ),),

        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: DrawerHeader(
              //       decoration: BoxDecoration(color: appBarColor, borderRadius: BorderRadius.circular(15)),
              //       child: Center(child: Column(
              //         mainAxisAlignment: MainAxisAlignment.center,
              //         children: [
              //           Text("Gözəl İslam", style: GoogleFonts.arimaMadurai(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 40),),
              //           Text("Dini kitablar, dini mövzular, sual cavab" , style: GoogleFonts.arimaMadurai(color: Colors.white, fontWeight: FontWeight.bold, ),),
              //           Text("www.gozelislam.com", style: GoogleFonts.arimaMadurai(color: Colors.white60, fontWeight: FontWeight.bold, ),),],
              //       ))),
              // ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset("assets/logi.png", height: 200,),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                    "Mobil tətbiqimiz www.gozelislam.com saytı əsasında Əhli-sünnət alimlərinin qiymətli əsərlərini əsas alaraq əhli-sünnət etiqadına uyğun olaraq hazırlanmışdır. "
                        "Tətbiqimizdəki məlumatlar bütün insanların istifadəsi üçün hazırlanmışdır. "
                        "Burada dini mövzular, məqalələr, söhbətlər, suallar və cavabları əks olunmuşdur. Əslinə sadiq qalmaq şərtilə icazə almadan hər kəs istədiyi kimi istifadə edə bilər.",
                   textAlign: TextAlign.justify , style: GoogleFonts.alata(fontSize: 20),
                ),
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.mail),
                title: Text("Texniki problemləri bizə bildirin", ),
                subtitle: Text("admin@gozelislam.com"),
              ),

              
            ],
          ),
        )
    );
  }


}



