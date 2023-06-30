import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:gozel_islam/screens/homescreen/prayer_time_table/prayer_time_table_screen.dart';
import 'package:gozel_islam/screens/homescreen/youtube_widget.dart';
import 'package:gozel_islam/screens/menu_pages/about_us/about_us.dart';
import 'package:gozel_islam/screens/menu_pages/books/book_screen.dart';
import 'package:gozel_islam/screens/menu_pages/compass_screen/compass_main.dart';
import 'package:gozel_islam/screens/menu_pages/ecards/ecards.dart';
import 'package:gozel_islam/screens/menu_pages/esmaul_husna/esma_husna.dart';
import 'package:gozel_islam/screens/menu_pages/filmler_screen/filmler_screen.dart';
import 'package:gozel_islam/screens/menu_pages/hikmetli_sozler_card/hikmetli_sozler_card.dart';
import 'package:gozel_islam/screens/menu_pages/ilahiler_screen/illahiler_screen.dart';
import 'package:gozel_islam/screens/homescreen/home_screen_widgets.dart';
import 'package:gozel_islam/screens/menu_pages/links/links.dart';
import 'package:gozel_islam/screens/menu_pages/our_shop/our_shop.dart';
import 'package:gozel_islam/screens/menu_pages/qeza_namaz/qeza_namaz.dart';
import 'package:gozel_islam/screens/menu_pages/sual_gonder/sual_gonder.dart';
import 'package:jiffy/jiffy.dart';
import '../../constants.dart';
import '../menu_pages/youtube_card/screens/home_screen.dart';
import 'package:get_storage/get_storage.dart';

import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;


class HomeScreen extends StatefulWidget {

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
 var prayerTime;
 GetStorage box = GetStorage();
 var movzuAdiYenilenen = [];
 var linkMovzuYenilenen = [];
 var bashliq;
 var metin;
 var hikmetliSoz;

 Future<void> getTextData() async {
   var _url = Uri.parse("https://www.gozelislam.com/");
   var response = await http.get(_url);
   final body = response.body;
   final document = parser.parse(body);

   var resHikmet = document.getElementsByClassName("top-block2").forEach((element) {
     var hikmetliSoz;
     setState(() {
       hikmetliSoz = element.children[0].children[2].text.toString();
     });
     box.write("hikmetliSoz", hikmetliSoz);
   });


   var resMovzu = document
       .getElementsByClassName("col-md-8 col-sm-12 col-xs-12")
       .forEach((element) async {
     var bashliq; var metin;
     setState(() {
       bashliq = element.children[1].children[0].children[2].children[0]
           .children[0].children[0].children[0].text
           .toString();
       metin = element.children[1].children[0].children[5].text.toString();
     });
     box.write("bashliq", bashliq);
     box.write("metin", metin);
   });
   //
   // var resUpdatedTopics = document.getElementsByClassName("blog-sidebar").forEach((element)async {
   //
   //   var papka, papka1, papka2, papka3, papka4, papka5, papka6, papka7;
   //   var link, link1, link2, link3, link4, link5, link6, link7;
   //
   //   // link5 = element.children[0].children[5].children[0].attributes['href'].toString();
   //   // link6 = element.children[0].children[6].children[0].attributes['href'].toString();
   //   // link7 = element.children[0].children[7].children[0].attributes['href'].toString();
   //
   //   setState(() {
   //     papka = element.children[0].children[3].text.toString();
   //     papka1 = element.children[0].children[5].text.toString();
   //     papka2 = element.children[0].children[7].text.toString();
   //     papka3 = element.children[0].children[9].text.toString();
   //     papka4 = element.children[0].children[11].text.toString();
   //     // papka5 = element.children[0].children[5].text.toString();
   //     // papka6 = element.children[0].children[6].text.toString();
   //     // papka7 = element.children[0].children[7].text.toString();
   //
   //     link = element.children[0].children[3].children[0].attributes['href'].toString();
   //     link1 = element.children[0].children[5].children[0].attributes['href'].toString();
   //     link2 = element.children[0].children[7].children[0].attributes['href'].toString();
   //     link3 = element.children[0].children[9].children[0].attributes['href'].toString();
   //     link4 = element.children[0].children[11].children[0].attributes['href'].toString();
   //     movzuAdiYenilenen = [papka, papka1, papka2, papka3, papka4 ];
   //     // movzuAdiYenilenen.add(papka5);
   //     // movzuAdiYenilenen.add(papka6);
   //     // movzuAdiYenilenen.add(papka7);
   //     linkMovzuYenilenen = [link, link1, link2, link3, link4];
   //
   //     // linkMovzuYenilenen.add(link5);
   //     // linkMovzuYenilenen.add(link6);
   //     // linkMovzuYenilenen.add(link7);
   //   });
   // });
   // print(movzuAdiYenilenen);

 }

 var _bashliq2;
 var _metin2;
 Future<void>getMovzuPage()async{

   var _url = Uri.parse(box.read("_link2"));
   var response = await http.get(_url);
   final body = response.body;
   final document = parser.parse(body);
   var res = document.getElementsByClassName("blog-info").forEach((element)async {

     await  box.write("_metin3",element.children[2].children[1].text.toString() );
     await box.write("_bashliq3", element.children[0].text.toString());
     setState(() {
       _bashliq2 = box.read("_bashliq3");
       _metin2 = box.read("_metin3");
     });
   });
 }
 Future<void> getMovzuDialog() async {
   var _url = Uri.parse("https://www.gozelislam.com/");
   var response = await http.get(_url);
   final body = response.body;
   final document = parser.parse(body);
   var res = document.getElementsByClassName("costom4").forEach((element) {
     setState(() {
       _bashliq2 =
           element.children[0].children[0].children[0].children[0].children[0]
               .text.toString();
       _metin2 = element.children[0].children[0].children[1].text.toString();
     });
     box.write("_metin2", _metin2);
     box.write("_bashliq2", _bashliq2);
     box.write("_link2",
         element.children[0].children[0].children[0].children[0]
             .attributes['href'].toString());
   });
   print(box.read("_link2"));
 }


 @override
  void initState() {
   getMovzuPage();
    bashliq = box.read("bashliq") ?? "Rəsm Çəkmək";
    metin = box.read("metin") ?? daylyTopic;
    hikmetliSoz = box.read("hikmetliSoz") ?? hikmetFakeData;
    prayerTime = box.read("time")["${Jiffy.now().dayOfYear}"]["baseTime"];
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: Drawer(
        backgroundColor: Theme.of(context).colorScheme.onInverseSurface,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: DrawerHeader(
                  decoration: BoxDecoration(color: appBarColor, borderRadius: BorderRadius.circular(15)),
                  child: Center(child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Gözəl İslam", style: GoogleFonts.arimaMadurai(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 40),),
                      Text("Dini kitablar, dini mövzular, sual cavab" , style: GoogleFonts.arimaMadurai(color: Colors.white, fontWeight: FontWeight.bold, ),),
                      Text("www.gozelislam.com", style: GoogleFonts.arimaMadurai(color: Colors.white60, fontWeight: FontWeight.bold, ),),],
                  ))),
            ),
            ListTile(
              leading: Icon(Icons.home_outlined),
              title: Text("Əsas səhifə", style: GoogleFonts.poppins(fontWeight: FontWeight.w500,),), ),
            ListTile(
              onTap: (){
                Navigator.of(context).push(CupertinoPageRoute(builder: (context)=>BookScreen()));
              },
              leading: Icon(Icons.book_outlined),
              title: Text("Dini kitablar", style: GoogleFonts.poppins(fontWeight: FontWeight.w500,),), ),
            ListTile(
              onTap: (){
                Navigator.of(context).push(CupertinoPageRoute(builder: (context)=>OurShop()));
              },
              leading: Icon(Icons.shopping_bag_outlined),
              title: Text("Mağazamız", style: GoogleFonts.poppins(fontWeight: FontWeight.w500,),), ),
            ListTile(
              onTap: (){
                Navigator.of(context).push(CupertinoPageRoute(builder: (context)=>EcardsScreen()));
              },
              leading: Icon(Icons.image_aspect_ratio),
              title: Text("E-kart", style: GoogleFonts.poppins(fontWeight: FontWeight.w500,),), ),
            ListTile(
              onTap: (){
                Navigator.of(context).push(CupertinoPageRoute(builder: (context)=>HikmetliSozlerCardScreen()));
              },
              leading: Icon(Icons.image_aspect_ratio),
              title: Text("Hikmətli sözlər", style: GoogleFonts.poppins(fontWeight: FontWeight.w500,),), ),
            ListTile(
              onTap: (){
                Navigator.of(context).push(CupertinoPageRoute(builder: (context)=>CompassMain()));
              },
              leading: Icon(Icons.compass_calibration_outlined),
              title: Text("Kompass", style: GoogleFonts.poppins(fontWeight: FontWeight.w500,),), ),

            ListTile(
              onTap: (){
                Navigator.of(context).push(CupertinoPageRoute(builder: (context)=>QezaNamaz()));
              },
              leading: Icon(Icons.calculate_outlined),
              title: Text("Qəza hesablama", style: GoogleFonts.poppins(fontWeight: FontWeight.w500,),), ),

            ListTile(
              onTap: (){
                Navigator.of(context).push(CupertinoPageRoute(builder: (context)=>FilmlerScreen()));
              },
              leading: Icon(Icons.video_library_outlined),
              title: Text("Dini filmlər", style: GoogleFonts.poppins(fontWeight: FontWeight.w500,),), ),
            ListTile(
              onTap: (){
                Navigator.of(context).push(CupertinoPageRoute(builder: (context)=>IlahilerScreen()));
              },
              leading: Icon(Icons.music_note),
              title: Text("İlahilər", style: GoogleFonts.poppins(fontWeight: FontWeight.w500,),), ),
            ListTile(
              onTap: (){
                Navigator.of(context).push(CupertinoPageRoute(builder: (context)=>EsmaScreen()));
              },
              leading: Image.asset("assets/esma.png", width: 23,),
              title: Text("Esmail Hüsna", style: GoogleFonts.poppins(fontWeight: FontWeight.w500,),), ),
            ListTile(
              onTap: (){
                Navigator.of(context).push(CupertinoPageRoute(builder: (context)=>LinksScreen()));
              },
              leading: Icon(Icons.link_rounded),
              title: Text("Linklər", style: GoogleFonts.poppins(fontWeight: FontWeight.w500,),), ),
            ListTile(
              onTap: (){
                Navigator.of(context).push(CupertinoPageRoute(builder: (context)=>YouTubeCard()));
              },
              leading: Icon(Icons.video_collection_outlined),
              title: Text("Video", style: GoogleFonts.poppins(fontWeight: FontWeight.w500,),), ),
            ListTile(
              onTap: (){
                Navigator.of(context).push(CupertinoPageRoute(builder: (context)=>SendEmail()));
              },
              leading: Icon(Icons.question_answer_outlined),
              title: Text("Sual göndər", style: GoogleFonts.poppins(fontWeight: FontWeight.w500,),), ),
            ListTile(
              onTap: (){
                Navigator.of(context).push(CupertinoPageRoute(builder: (context)=>AboutUs()));

              },
              leading: Icon(Icons.home_outlined),
              title: Text("Haqqımızda", style: GoogleFonts.poppins(fontWeight: FontWeight.w500,),), ),
            Divider(),
            ListTile(
              title: Text("Version 1.0.0", textAlign: TextAlign.center, style: GoogleFonts.poppins(fontWeight: FontWeight.w500,),), ),

          ],
        ),
      ),
      appBar: AppBar(
        actions:
        [
          IconButton( onPressed: () {
            Navigator.push(context, CupertinoPageRoute(builder: (context)=>PrayerTimeTable()));
          }, icon: Icon(Icons.calendar_month),),
          IconButton( onPressed: () {  }, icon: Icon(Icons.share),),


        ],
        scrolledUnderElevation: 3,
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        backgroundColor: appBarColor,
        title: Text("Gözəl İslam", style: GoogleFonts.arimaMadurai(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),),

      ),
      body: RefreshIndicator(
        onRefresh: () async{
          await getTextData();
          await getMovzuDialog();
          getMovzuPage();
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                  builder: (context) => HomeScreen()),
                  (route) => false
          );
        },
        child: Animate(
          effects: [
            FadeEffect(duration: Duration(milliseconds: 300))
          ],
          child: ListView(
            padding: EdgeInsets.only(bottom: 50),
            children: [
              headerContainers(context),
              buildPrayerTimes(context, prayerTime["sabah"], prayerTime["gunorta"], prayerTime["ikindi"], prayerTime["axsam"], prayerTime["yatsi"], ),
              // banner(context),
              buildHikmet(context, hikmetliSoz),
              buildMovzu(context, bashliq, metin),
              SohbetCard(),
              buildMaraqliMovzular( box.read("_bashliq3")??"Dişdə dolğu və diş qapağının olması", box.read("_metin3")?? maraqliMetin, box.read("_link2"), context ),
              buildOtherMovzu(context, ),
              buildSocial(),
              buildButtons(context)



            ],
          ),
        ),
      ),

    );
  }




}

