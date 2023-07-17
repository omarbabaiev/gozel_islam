import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../../constants.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:mailto/mailto.dart';

class OurShop extends StatelessWidget {

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
        title: Text("Mədinə Gülü - Dini mağaza", style: GoogleFonts.arimaMadurai(color: Colors.white, fontWeight: FontWeight.bold, ),),

      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
          SizedBox(
          height: 300,
          child: Animate(
            effects: [
              FadeEffect()
            ],
            child: Swiper(
                autoplay: true,
                pagination: SwiperPagination(builder: DotSwiperPaginationBuilder(activeColor: appBarColor, color: Colors.white),
                    alignment: Alignment.bottomCenter),
                indicatorLayout: PageIndicatorLayout.SCALE,
                itemCount: _list.length,
                itemBuilder: (context, index){
                  return _list[index];
                }),
          ),
        ),
            SizedBox(height: 40,),

            ListTile(
              leading: Icon(Icons.shopping_bag_outlined, color: Colors.red, ),
              title: Text("Mağaza haqqında", style: GoogleFonts.arimaMadurai(),),
              subtitle: Text("Dini kitablar, namaz geyimləri, səccadələr, təsbehlər və aksesuarlar", style: GoogleFonts.arimaMadurai(fontWeight: FontWeight.bold),),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Divider(),
            ),
            ListTile(
              trailing: ElevatedButton(onPressed: ()async {
                  FirebaseAnalytics analytics = Provider.of<FirebaseAnalytics>(context, listen: false);
                  await analytics.logEvent(
                    name: 'test_event',
                  );
                launch("tel://+(994) 55 233 70 70");
              }, child: Text("Zəng et"), style: ElevatedButton.styleFrom(elevation: 0),),
              leading: Icon(Icons.call, color: Colors.red),
              title: Text("Telefon", style: GoogleFonts.arimaMadurai(),),
              subtitle: Text("+(994) 55 233 70 70", style: GoogleFonts.arimaMadurai( fontWeight: FontWeight.bold),),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Divider(),
            ),
            ListTile(
              trailing: ElevatedButton(onPressed: ()async {

              launchMailto();
              }, child: Text("Mail göndər"), style: ElevatedButton.styleFrom(elevation: 0),),
              leading: Icon(Icons.mail, color: Colors.red),
              title: Text("E-mail", style: GoogleFonts.arimaMadurai(),),
              subtitle: Text("admin@gozelislam.com", style: GoogleFonts.arimaMadurai( fontWeight: FontWeight.bold),),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Divider(),
            ),
            ListTile(
              leading: Icon(Icons.location_on_outlined, color: Colors.red),
              title: Text("Ünvan", style: GoogleFonts.arimaMadurai(),),
              subtitle: Text("Bineqedi Rayonu, 6-cı mik, Zərifə Parkının yanı. Nəsimi mətrosunun yaxınlığı.", style: GoogleFonts.arimaMadurai( fontWeight: FontWeight.bold),),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Divider(),
            ),
            ListTile(
              leading: Icon(Icons.local_shipping_outlined, color: Colors.red),
              title: Text("Çatdırılma", style: GoogleFonts.arimaMadurai(),),
              subtitle: Text("Bakı daxili və rayonlara poçtla çatdırılma", style: GoogleFonts.arimaMadurai( fontWeight: FontWeight.bold),),
            ),



          ],
        ),
      )
    );
  }
  var _list = [
    Image.asset("assets/photo_5289741821687222363_y.jpg", fit: BoxFit.fill,),
    Image.asset("assets/photo_5289741821687222370_y.jpg", fit: BoxFit.fill,),
    Image.asset("assets/photo_5289741821687222373_y.jpg", fit: BoxFit.fill,),
    Image.asset("assets/photo_5289741821687222376_y.jpg", fit: BoxFit.fill,),
    Image.asset("assets/photo_5289741821687222377_y.jpg", fit: BoxFit.fill,),
    Image.asset("assets/photo_5289741821687222363_y.jpg", fit: BoxFit.fill,),
    Image.asset("assets/photo_5289741821687222365_y.jpg", fit: BoxFit.fill,),
    Image.asset("assets/photo_5289741821687222367_y.jpg", fit: BoxFit.fill,),




  ];

}



