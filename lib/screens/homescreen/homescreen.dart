import 'dart:io';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gozel_islam/screens/homescreen/KufrCard.dart';
import 'package:gozel_islam/screens/homescreen/book_card.dart';
import 'package:gozel_islam/screens/homescreen/prayer_time_table/prayer_time_table_screen.dart';
import 'package:gozel_islam/screens/menu_pages/ZikirMatik/ZikirMatik.dart';
import 'package:gozel_islam/screens/menu_pages/ZikirMatik/ZikirlerPage.dart';
import 'package:gozel_islam/screens/menu_pages/about_us/about_us.dart';
import 'package:gozel_islam/screens/menu_pages/books/book_screen.dart';
import 'package:gozel_islam/screens/menu_pages/compass_screen/compass_main.dart';
import 'package:gozel_islam/screens/menu_pages/dini_bilgiler/all_topics.dart';
import 'package:gozel_islam/screens/menu_pages/ecards/ecards.dart';
import 'package:gozel_islam/screens/menu_pages/esmaul_husna/esma_husna.dart';
import 'package:gozel_islam/screens/menu_pages/filmler_screen/filmler_screen.dart';
import 'package:gozel_islam/screens/menu_pages/hikmetli_sozler_card/hikmetli_sozler_card.dart';
import 'package:gozel_islam/screens/menu_pages/ilahiler_screen/illahiler_screen.dart';
import 'package:gozel_islam/screens/homescreen/home_screen_widgets.dart';
import 'package:gozel_islam/screens/menu_pages/links/links.dart';
import 'package:gozel_islam/screens/menu_pages/our_shop/our_shop.dart';
import 'package:gozel_islam/screens/menu_pages/qeza_namaz/qeza_namaz.dart';
import 'package:gozel_islam/screens/menu_pages/recent_list/recent_list_page.dart';
import 'package:gozel_islam/screens/menu_pages/sual_gonder/sual_gonder.dart';
import 'package:jiffy/jiffy.dart';
import 'package:share_plus/share_plus.dart';
import '../../constants.dart';
import '../menu_pages/privacy_policy/privacy_policy.dart';
import '../menu_pages/youtube_card/screens/home_screen.dart';
import 'package:get_storage/get_storage.dart';
import 'package:url_launcher/url_launcher.dart';
import '../menu_pages/youtube_card/models/channel_model.dart';
import '../menu_pages/youtube_card/services/api_service.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;


class HomeScreen extends StatefulWidget {

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  var channel;
  var video;
  var _isYoutube = true;
  _initChannel() async {
    Channel _channel = await APIService2.instance
        .fetchChannel(channelId: 'UCV5G4F5n17ZCVWtGUxJ6z4A');
    setState(() {
      _isYoutube = false;
      channel = _channel;
      video = channel!.videos[0];
    });
  }
 var basePrayerTime;
  var addPrayerTime;
 GetStorage box = GetStorage();
 var movzuAdiYenilenen = [];
 var linkMovzuYenilenen = [];
 var bashliq;
 var metin;
 var hikmetliSoz;

  var hikmetliSozShare;

  var metinShare;
  List months = [
    'Yanvar',
    'Fevral',
    'Mart',
    'Aprel',
    'May',
    'İyun',
    'İyul',
    'Avqust',
    'Sentyabr',
    'Oktyabr',
    'Noyabr',
    'Dekabr'
  ];

  List weekday = [
    "Bzr. ertəsi",
    "Çər. axşamı",
    "Çərşənbə",
    "Cümə axşamı",
    "Cümə",
    "Şənbə",
    "Bazar"
  ];

 Future<void> getTextData() async {
   var _url = Uri.parse("https://www.gozelislam.com/");
   var response = await http.get(_url);
   final body = response.body;
   final document = parser.parse(body);

   var resHikmet = document.getElementsByClassName("top-block2").forEach((element) {
     var hikmetliSoz;
     setState(() {
       hikmetliSoz = element.children[0].children[2].outerHtml;
     });
     box.write("hikmetliSoz", hikmetliSoz);
     box.write("hikmetliSozshare", element.children[0].children[2].text.toString());

   });


   var resMovzu = document
       .getElementsByClassName("col-md-8 col-sm-12 col-xs-12")
       .forEach((element) async {
     var bashliq; var metin;
     setState(() {
       bashliq = element.children[1].children[0].children[2].children[0]
           .children[0].children[0].children[0].text.toString();
       metin = element.children[1].children[0].children[5].outerHtml;
     });
     box.write("bashliq", bashliq);
     box.write("metin", metin);
     box.write("metinshare", element.children[1].children[0].children[5].text.toString());

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
 Future<void> getGununMovzusu() async {

   var response = await http.get(Uri.parse("https://www.gozelislam.com/gunun-sohbeti.html"));
   var response1 = await http.get(Uri.parse("https://www.gozelislam.com/"));

   final body = response.body;
   final document = parser.parse(body);
   var res = document.getElementsByClassName("show-more").forEach
     ((element)async {
     // metin= element.outerHtml;
     setState(() {
       box.write("movzuGun", element.outerHtml);
     });
   });
   var res1 = document.getElementsByClassName("panel-heading").forEach
     ((element)async {
     bashliq = element.children[0].text.toString();
     setState(() {
       box.write("bashliqGun", element.children[0].text.toString());
     });
   });

   final body1 = response1.body;
   final document1 = parser.parse(body1);
   var resMovzu = document1
       .getElementsByClassName("col-md-8 col-sm-12 col-xs-12")
       .forEach((element) async {
     var bashliq; var metin;
     setState(() {
       bashliq = element.children[1].children[0].children[2].children[0]
           .children[0].children[0].children[0].text.toString();
       metin = element.children[1].children[0].children[5].outerHtml;
     });
     box.write("bashliq", bashliq);
     box.write("metin", metin);
     box.write("metinshare", element.children[1].children[0].children[5].text.toString());

   });


 }

 var _bashliq2;
 var _metin2;
 Future<void>getMovzuPage()async{

   var _url = Uri.parse(box.read("_link2"));
   var response = await http.get(_url);
   final body = response.body;
   final document = parser.parse(body);
   var res = document.getElementsByClassName("blog-info").forEach((element)async {

     await  box.write("_metin3",element.children[2].children[1].outerHtml );
     await  box.write("_metin3share",element.children[2].children[1].text.toString() );
     await box.write("_bashliq3", element.children[0].text.toString());
     setState(() {
       _bashliq2 = box.read("_bashliq3");
       _metin2 = box.read("_metin3");
       metin3share = box.read("_metin3share");
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
       _metin2 = element.children[0].children[0].children[1].outerHtml;
     });
     box.write("_metin2", _metin2);
     box.write("_metin2share", element.children[0].children[0].children[1].text.toString());
     box.write("_bashliq2", _bashliq2);
     box.write("_link2",
         element.children[0].children[0].children[0].children[0]
             .attributes['href'].toString());
   });
   print(box.read("_link2"));
 }
var zor;
var metin3share;
late int index;
 @override
  void initState() {
   index = Random().nextInt(98);
   _initChannel();
   metin3share = box.read("_metin3share")??daylyTopic;
    bashliq = box.read("bashliqGun") ?? "Rəsm Çəkmək";
    metin = box.read("movzuGun") ?? daylyTopic;
   metinShare = box.read("metinshare") ?? daylyTopic;

   hikmetliSoz = box.read("hikmetliSoz") ?? hikmetFakeData;
   hikmetliSozShare = box.read("hikmetliSozshare") ?? hikmetFakeData;

   basePrayerTime = box.read("time")["${Jiffy.now().dayOfYear}"]["baseTime"];
   addPrayerTime = box.read("time")["${Jiffy.now().dayOfYear}"]["extraTime"];
   zor = box.read("time");
   getGununMovzusu();
    super.initState();
  }


  @override
  void dispose() {
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Theme.of(context).colorScheme.onInverseSurface,
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 4, color: Colors.red, style: BorderStyle.solid),
                  color: Colors.white),
              child: Image.asset("assets/header.png"),),
            // ListTile(
            //   leading: Icon(Icons.home_outlined, color: Colors.red,),
            //   title: Text("Əsas səhifə", style: GoogleFonts.poppins(fontWeight: FontWeight.w500,),), ),
            ListTile(
              onTap: (){
                Navigator.of(context).push(CupertinoPageRoute(builder: (context)=>BookScreen()));
              },
              leading: Icon(Icons.book_outlined, color: Colors.red,),
              title: Text("Dini kitablar", style: GoogleFonts.poppins(fontWeight: FontWeight.w500,),), ),
        ListTile(
          onTap: (){
            Navigator.of(context).push(CupertinoPageRoute(builder: (context)=>DiniBilgilerPage()));
          },
          leading: Icon(Icons.view_day_outlined, color: Colors.red,),
          title: Text("Dini bilgilər", style: GoogleFonts.poppins(fontWeight: FontWeight.w500,),), ),
            ListTile(
              onTap: (){
                Navigator.of(context).push(CupertinoPageRoute(builder: (context)=>RecentListPage()));
              },
              leading: Icon(Icons.receipt, color: Colors.red,),
              title: Text("Sonra oxunacaqlar", style: GoogleFonts.poppins(fontWeight: FontWeight.w500,),), ),
            // ListTile(
            //   onTap: (){
            //     Navigator.of(context).push(CupertinoPageRoute(builder: (context)=>ZikirlerPage()));
            //   },
            //   leading: Image.asset("assets/tasbeh1.png", width: 30, color: Colors.black45,),
            //   title: Text("Zikrlər", style: GoogleFonts.poppins(fontWeight: FontWeight.w500,),), ),
            ListTile(
              onTap: (){
                Navigator.of(context).push(CupertinoPageRoute(builder: (context)=>PrayerTimeTable()));
              },
              leading: Icon(Icons.calendar_month, color: Colors.red,),
              title: Text("Namaz təqvimi", style: GoogleFonts.poppins(fontWeight: FontWeight.w500,),), ),
            ListTile(
              onTap: (){
                Navigator.of(context).push(CupertinoPageRoute(builder: (context)=>OurShop()));
              },
              leading: Icon(Icons.shopping_bag_outlined, color: Colors.red,),
              title: Text("Mağazamız", style: GoogleFonts.poppins(fontWeight: FontWeight.w500,),), ),
            ListTile(
              onTap: (){
                Navigator.of(context).push(CupertinoPageRoute(builder: (context)=>EcardsScreen()));
              },
              leading: Icon(Icons.image_aspect_ratio, color: Colors.red,),
              title: Text("E-kart", style: GoogleFonts.poppins(fontWeight: FontWeight.w500,),), ),
            ListTile(
              onTap: (){
                Navigator.of(context).push(CupertinoPageRoute(builder: (context)=>HikmetliSozlerCardScreen()));
              },
              leading: Icon(Icons.image_aspect_ratio, color: Colors.red,),
              title: Text("Hikmətli sözlər", style: GoogleFonts.poppins(fontWeight: FontWeight.w500,),), ),
            ListTile(
              onTap: (){
                Navigator.of(context).push(CupertinoPageRoute(builder: (context)=>CompassMain()));
              },
              leading: Icon(Icons.compass_calibration_outlined, color: Colors.red,),
              title: Text("Kompass", style: GoogleFonts.poppins(fontWeight: FontWeight.w500,),), ),


            ListTile(
            onTap: (){
            Navigator.of(context).push(CupertinoPageRoute(builder: (context)=>YouTubeCard()));},
            leading: Icon(Icons.video_collection_outlined, color: Colors.red,),
            title: Text("Dini Videolar", style: GoogleFonts.poppins(fontWeight: FontWeight.w500,),), ),

            ListTile(
              onTap: (){
                Navigator.of(context).push(CupertinoPageRoute(builder: (context)=>FilmlerScreen()));
              },
              leading: Icon(Icons.video_library_outlined, color: Colors.red,),
              title: Text("Dini filmlər", style: GoogleFonts.poppins(fontWeight: FontWeight.w500,),), ),
            ListTile(
              onTap: (){
                Navigator.of(context).push(CupertinoPageRoute(builder: (context)=>IlahilerScreen()));
              },
              leading: Icon(Icons.music_note, color: Colors.red,),
              title: Text("İlahilər", style: GoogleFonts.poppins(fontWeight: FontWeight.w500,),), ),
        ListTile(
          onTap: (){
            Navigator.of(context).push(CupertinoPageRoute(builder: (context)=>QezaNamaz()));
          },
          leading: Icon(Icons.calculate_outlined, color: Colors.red,),
          title: Text("Qəza hesablama", style: GoogleFonts.poppins(fontWeight: FontWeight.w500,),), ),
            ListTile(
              onTap: (){
                Navigator.of(context).push(CupertinoPageRoute(builder: (context)=>EsmaScreen()));
              },
              leading: Image.asset("assets/esma.png", width: 23, color: Colors.red, ),
              title: Text("Esmail Hüsna", style: GoogleFonts.poppins(fontWeight: FontWeight.w500,),), ),
            ListTile(
              onTap: (){
                Navigator.of(context).push(CupertinoPageRoute(builder: (context)=>LinksScreen()));
              },
              leading: Icon(Icons.link_rounded, color: Colors.red,),
              title: Text("Faydalı linklər", style: GoogleFonts.poppins(fontWeight: FontWeight.w500,),), ),
            ListTile(
              onTap: (){
                Navigator.of(context).push(CupertinoPageRoute(builder: (context)=>SendEmail()));
              },
              leading: Icon(Icons.question_answer_outlined, color: Colors.red,),
              title: Text("Sual göndər", style: GoogleFonts.poppins(fontWeight: FontWeight.w500,),), ),
            ListTile(
              onTap: ()
              async{
                await Share.share("${"Dini Mövzular, Söhbətlər və Sual-Cavab\n${textShareText}"}");
              },
              leading: Icon(Icons.share, color: Colors.red,),
              title: Text("Paylaş", style: GoogleFonts.poppins(fontWeight: FontWeight.w500,),), ),
            ListTile(
              onTap: (){
                Navigator.of(context).push(CupertinoPageRoute(builder: (context)=>AboutUs()));

              },
              leading: Icon(Icons.info_outline, color: Colors.red,),
              title: Text("Haqqımızda", style: GoogleFonts.poppins(fontWeight: FontWeight.w500,),), ),
            ListTile(
              onTap: (){
                Navigator.of(context).push(CupertinoPageRoute(builder: (context)=>PrivacyPolicy()));
              },
              leading: Icon(Icons.privacy_tip_outlined, color: Colors.red,),
              title: Text("Privacy policy", style: GoogleFonts.poppins(fontWeight: FontWeight.w500,),), ),
            ListTile(
              onTap: (){
                if (Platform.isAndroid || Platform.isIOS) {
                  final appId = Platform.isAndroid ? '${shortLink}' : 'YOUR_IOS_APP_ID';
                  final url = Uri.parse(
                    Platform.isAndroid
                        ? "market://details?id=$appId"
                        : "https://apps.apple.com/app/id$appId",
                  );
                  launchUrl(
                    url,
                    mode: LaunchMode.externalApplication,
                  );
                }
              },
              leading: Icon(Icons.star_rate_outlined, color: Colors.red,),
              title: Text("Dəyərləndir", style: GoogleFonts.poppins(fontWeight: FontWeight.w500,),), ),

            Divider(),
            ListTile(
              title: Text("Version 1.0.0", textAlign: TextAlign.center, style: GoogleFonts.poppins(fontWeight: FontWeight.w500,),), ),

          ],
        ),
      ),
      appBar: AppBar(
        actions:
        [
          InkWell( onTap: (){
            Navigator.push(context, CupertinoPageRoute(builder: (context)=>ZikrPage()));
          }, child: Image.asset("assets/tasbeh1.png", width: 30, ),),
          IconButton( onPressed: () async{
            await Share.share("${"Dini Mövzular, Söhbətlər və Sual-Cavab\n${textShareText}"}");
    }, icon: Icon(Icons.share, color: Colors.amber.shade100,),),

        ],
        scrolledUnderElevation: 3,
        centerTitle: true,
        backgroundColor: appBarColor,
        title: Text("Gözəl İslam", style: GoogleFonts.arimaMadurai(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),),

      ),
      body: RefreshIndicator(
        onRefresh: () async{
          await getTextData();
          await getMovzuDialog();
          await getMovzuPage();
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
              buildPrayerTimes(context, basePrayerTime , addPrayerTime,
                  "${"${zor['${Jiffy.now().dayOfYear}']['baseTime']["todayHijrahDate"]}".capitalize}" ,
                  "${DateTime.parse("${zor['${Jiffy.now().dayOfYear}']['baseTime']["todayDate"]}").day} ${months[DateTime.parse("${zor['${Jiffy.now().dayOfYear}']['baseTime']["todayDate"]}").month - 1]}, ${weekday[DateTime.parse("${zor['${Jiffy.now().dayOfYear}']['baseTime']["todayDate"]}").weekday - 1]}",),
              KufrCard(),
              buildHikmet(context, hikmetliSoz, hikmetliSozShare),
              buildMovzu(context, bashliq, metin, metinShare ),
              buildMaraqliMovzular( box.read("_bashliq3")??"Dişdə dolğu və diş qapağının olması", box.read("_metin3")?? maraqliMetin, box.read("_link2"),  metin3share, context ),
              buildEsma(context, index ),
              _isYoutube ? SizedBox()  : buildYoutube(context, video,  ),
              buildBanner(context),
              buildOtherMovzu(context, ),
              buildSocial(),



            ],
          ),
        ),
      ),

    );
  }




}

