
import 'dart:convert';
import 'package:gozel_islam/screens/homescreen/maraqli_movzu_page.dart';
import 'package:gozel_islam/screens/homescreen/other_topics/en_son_elave.dart';
import 'package:gozel_islam/screens/homescreen/other_topics/maraqli-movzu.dart';
import 'package:gozel_islam/screens/homescreen/other_topics/yenilenen_movzular.dart';
import 'package:gozel_islam/screens/homescreen/prayer_time_table/prayer_time_table_screen.dart';
import 'package:gozel_islam/screens/menu_pages/books/book_screen.dart';
import 'package:gozel_islam/screens/menu_pages/dini_bilgiler/gunun_movzusu.dart';
import 'package:gozel_islam/screens/menu_pages/esmaul_husna/esma_husna.dart';
import 'package:jiffy/jiffy.dart';
import 'package:lottie/lottie.dart';
import 'package:share_files_and_screenshot_widgets/share_files_and_screenshot_widgets.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gozel_islam/constants.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:gozel_islam/screens/homescreen/homescreen.dart';
import 'package:gozel_islam/screens/homescreen/share_hikmet_card/background.dart';
import 'package:http/http.dart' as http;
import '../menu_pages/dini_bilgiler/all_topics.dart';
import '../menu_pages/dini_bilgiler/dini_bilgiler.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:html/parser.dart' as html;
import '../menu_pages/dini_bilgiler/reader.dart';
import '../menu_pages/youtube_card/models/channel_model.dart';
import '../menu_pages/youtube_card/models/video_model.dart';
import '../menu_pages/youtube_card/screens/home_screen.dart';
import '../menu_pages/youtube_card/screens/video_screen.dart';


Widget headerContainers(BuildContext context){
  return  Padding(
    padding: EdgeInsets.only(top: 10, bottom: 0),
    child: SizedBox(
      height: 110,
      child: ListView(
        padding: EdgeInsets.only(left: 7),
        scrollDirection: Axis.horizontal,
        children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: InkWell(
              onTap: (){
                Navigator.push(context, CupertinoPageRoute(builder: (context)=>DiniBilgilerPage()));
              },
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset("assets/open-book.png", height: 40,),
                    Text("Bütün dini mövzular", style: GoogleFonts.alata(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),),
                  ],),
                width: 120,
                decoration: BoxDecoration(
                    color: Colors.lightBlue,
                    borderRadius: BorderRadius.circular(15)
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: InkWell(
              onTap: (){
                Navigator.push(context, CupertinoPageRoute(builder: (context)=>DiniBilgiler1Page(link: Uri.parse("https://www.gozelislam.com/dogru-iman/"), bashliq: "İman Bilgiləri")));
              },
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                        child: Image.asset("assets/ketupat.png", height: 40,)),
                    Text("Doğru İman Bilgiləri", style: GoogleFonts.alata(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),),
                  ],

                ),
                width: 120,
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(15)
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: InkWell(
              onTap: (){
                Navigator.push(context, CupertinoPageRoute(builder: (context)=>DiniBilgiler1Page(link: Uri.parse("https://www.gozelislam.com/qusl/namaz/"), bashliq: "Namaz bilgiləri")));

              },
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset("assets/praying.png", height:40,),
                    Text("Namaz bilgiləri", style: GoogleFonts.alata(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),),


                  ],

                ),
                width: 120,
                decoration: BoxDecoration(
                    color: Colors.indigo,
                    borderRadius: BorderRadius.circular(15)
                ),
              ),
            ),
          ),
          // https://www.gozelislam.com/qusl/qusul/
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: InkWell(
              onTap: (){
                Navigator.push(context, CupertinoPageRoute(builder: (context)=>DiniBilgiler1Page(link: Uri.parse("https://www.gozelislam.com/qusl/qusul/"), bashliq: "Qüsl, Dəstəmaz, Heyz")));

              },
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset("assets/wudhu.png", height:40,),
                    Text("Qüsl, Dəstəmaz, Heyz", style: GoogleFonts.alata(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),),
                  ],

                ),
                width: 120,
                decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(15)
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: InkWell(
              onTap: (){
                Navigator.push(context, CupertinoPageRoute(builder: (context)=>DiniBilgiler1Page(link: Uri.parse("https://www.gozelislam.com/oruc-ve-ramazan/"), bashliq: "Ramazan və oruc bilgiləri")));

              },
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset("assets/lantern.png", height: 40,),
                    Text("Ramazan və oruc", style: GoogleFonts.alata(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),),

                  ],),
                width: 120,
                decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(15)
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: InkWell(
              onTap: (){
                Navigator.push(context, CupertinoPageRoute(builder: (context)=>DiniBilgiler1Page(link: Uri.parse("https://www.gozelislam.com/peygember-efendimiz/"), bashliq: "Peyğambər Əfəndimiz haqqında")));

              },
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset("assets/muhammad.png", height: 40,),
                    Text("Peyğambər Əfəndimiz", style: GoogleFonts.alata(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),),

                  ],),
                width: 120,
                decoration: BoxDecoration(
                    color: Colors.deepPurpleAccent,
                    borderRadius: BorderRadius.circular(15)
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: InkWell(
              onTap: (){
                Navigator.push(context, CupertinoPageRoute(builder: (context)=>DiniBilgiler1Page(link: Uri.parse("https://www.gozelislam.com/qurani-kerim/"), bashliq: "Qurani Kərim haqqında ")));

              },
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset("assets/quran.png", height: 40,),
                    Text("Qurani Kərim", style: GoogleFonts.alata(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),),
                  ],),
                width: 120,
                decoration: BoxDecoration(
                    color: Colors.deepOrange,
                    borderRadius: BorderRadius.circular(15)
                ),
              ),
            ),
          ),



        ],
      ),
    ),
  );

}


Widget telegramWidget(BuildContext context){
  return             Padding(
    padding: const EdgeInsets.only(top: 20, bottom: 10, right: 10, left: 10),
    child: Container(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Gözəl İslam Telegram kanalı", textAlign: TextAlign.center , style: GoogleFonts.alatsi(color: Colors.white, fontSize: 20),),
                Text("Hər gün yeni paylaşımlar", textAlign: TextAlign.center , style: GoogleFonts.alatsi(color: Colors.white70, fontSize: 15),),
                Text("www.t.me/gozelislam", textAlign: TextAlign.center , style: GoogleFonts.alatsi(color: Colors.white70, fontSize: 15),),

                Spacer(),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(elevation: 0, side: BorderSide(color: Colors.blue)),
                      onPressed: (){}, child: Text("Abunə Ol", textAlign: TextAlign.center , style: GoogleFonts.alatsi(color: Colors.red, fontSize: 20),)),
                ),
              ],
            ),

            Positioned(
              right: 10,
              bottom: 20,
              child: Container(
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: CircleBorder(),
                ),
                child:  Icon(
                  Icons.telegram,
                  color: Colors.blue,
                  size: 60,

                ),
              ),
            )
          ],
        ),
      ),
      height: 130,
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              colors: [
                Colors.blue, Colors.lightBlueAccent
              ]
          ),

          borderRadius: BorderRadius.circular(15)
      ),
    ),
  );
}


Widget banner (BuildContext context){
  return SizedBox(
    height: 120,
    child: Swiper(
        autoplay: true,
        autoplayDelay: 3,
        pagination: SwiperPagination(builder: DotSwiperPaginationBuilder(activeColor: appBarColor, color: Colors.white),
            alignment: Alignment.bottomCenter),
        indicatorLayout: PageIndicatorLayout.SCALE,
        itemCount: 4,
        itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset("assets/dinikitablar3.png", fit: BoxFit.fill,)),
          );
        }),
  );
}
Padding buildHikmet(BuildContext context, String metin, String shareMetin) {
  return Padding(
    padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 10),
    child: AnimatedContainer(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ListTile(
              isThreeLine: true,
              leading: Icon(Icons.format_quote_rounded, color: appBarColor,),
              title: Text("Hikmət əhli buyurdu ki", style: GoogleFonts.arimaMadurai(fontWeight: FontWeight.bold, color: Colors.orange, fontSize: 25),),
              subtitle: Html(
                data: metin,
                style: {
                "p": Style(
                  fontSize: FontSize(15),
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  textAlign: TextAlign.justify
                ),


              }, )),
          Row(mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                  onPressed: (){
                    Navigator.push(context, CupertinoPageRoute(builder: (context)=>BackgroundScreen("Hikmət əhli buyurdu ki, ${shareMetin}")));
                  }, icon: Icon(Icons.image, color: Colors.red,)),
              IconButton(onPressed: (){
                Clipboard.setData(ClipboardData(text: metin))
                    .then((value) { //only if ->
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        duration: Duration(seconds: 1),
                        showCloseIcon: true,
                        content: Text("Kopyalandı", style: GoogleFonts.poppins(color: Colors.black),),
                        behavior: SnackBarBehavior.floating,
                        backgroundColor: Colors.red.shade100,
                        shape: RoundedRectangleBorder(),
                      ));
                });
              }, icon:Icon(Icons.copy_sharp, color: Colors.red,) ),
              IconButton(
                  onPressed: ()async{
                    await Share.share("Hikmət əhli buyurdu ki, ${shareMetin} \n ${textShareText}");
                  }, icon: Icon(Icons.share_rounded, color: Colors.red,)),



            ],
          ),
          SizedBox(height: 10,)

        ],
      ),
      decoration: BoxDecoration(
        border: Border.all(width: 0.2, color: Colors.red),
          color: Theme.of(context).colorScheme.onInverseSurface,
          borderRadius: BorderRadius.circular(15)
      ), duration: Duration(seconds: 1),
    ),
  );
}


Padding buildSocial() {
  void _launchUrl(String patha) async {
    if (!await launch(Uri.parse(patha).toString(), forceSafariVC: true, forceWebView: false )) throw 'Could not launch $patha';
  }
  return Padding(
    padding: EdgeInsets.all(10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        OutlinedButton(
            style: OutlinedButton.styleFrom(backgroundColor: Colors.indigo),
            onPressed: (){
              _launchUrl("https://www.facebook.com/gozelislam");
            }, child: Text("Facebook", style: TextStyle(color: Colors.white), )),
        OutlinedButton(
            style: OutlinedButton.styleFrom(backgroundColor: Color(0xFFA81F38)),
            onPressed: (){
              _launchUrl("https://www.instagram.com/gozelislam_kitabevi");
            }, child: Text("Instagram", style: TextStyle(color: Colors.white))),
        OutlinedButton(
            style: OutlinedButton.styleFrom(backgroundColor: Colors.lightBlue),
            onPressed: (){
              _launchUrl("https://t.me/gozelislam");
            }, child: Text("Telegram", style: TextStyle(color: Colors.white))),

      ],
    ),
  );
}

Padding buildMaraqliMovzular(String bashliq, String metin, String url, String metinShare ,BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
    child:  Container(
      height: 400 ,
      width: double.infinity,
      child: Stack(
        children: [
          ListTile(
              leading: Icon(Icons.format_quote_rounded, color: Colors.deepOrange,),

              isThreeLine: true,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: Text(bashliq, maxLines: 1, overflow: TextOverflow.ellipsis, style: GoogleFonts.arimaMadurai(fontWeight: FontWeight.bold, fontSize: 25, color:  Colors.indigo,),)),
                ],),
              subtitle: Padding(
                padding: EdgeInsets.only(bottom: 100),
                child: Scrollbar(
                  child: SingleChildScrollView(
                    child: Html(
                      data: metin,
                      style: {
                        "span": Style(
                            fontSize: FontSize(16),
                            fontFamily:  GoogleFonts.poppins().fontFamily
                        ),
                        "p" : Style(
                          fontSize: FontSize(16),
                          fontFamily: GoogleFonts.poppins().fontFamily,
                        ),



                      },
                    ),
                  ),
                ),
              )
            // Text(metin, maxLines: 10, overflow: TextOverflow.ellipsis ,textAlign: TextAlign.justify, style: GoogleFonts.poppins(fontSize: 18) ,)
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: ElevatedButton(onPressed: (){
                      Navigator.push(context, CupertinoPageRoute(builder: (context)=>MaraqliMovzuReader(bashliq, metin)));
                      // void _launchUrl(String patha) async {
                      //   if (!await launch(Uri.parse(patha).toString(), forceSafariVC: true, forceWebView: false )) throw 'Could not launch $patha';
                      // }
                      // _launchUrl("https://www.gozelislam.com/");
                    }, child: Text(metin.isEmpty ? "Sayta keçid et" :  "Ətraflı oxu", style: GoogleFonts.poppins(),),
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.transparent, elevation: 0, shadowColor: Colors.transparent, side: BorderSide(width: .8)),),
                  ),
                  Row(
                    children: [
                      IconButton(onPressed: (){
                        Clipboard.setData(ClipboardData(text: metin))
                            .then((value) { //only if ->
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                duration: Duration(seconds: 1),
                                showCloseIcon: true,
                                content: Text("Kopyalandı", style: GoogleFonts.poppins(color: Colors.black),),
                                behavior: SnackBarBehavior.floating,
                                backgroundColor: Colors.red.shade100,
                                shape: RoundedRectangleBorder(),
                              ));
                        });
                      }, icon:Icon(Icons.copy_sharp, color: Colors.red,) ),
                      IconButton(
                          onPressed: ()async{
                            await Share.share("${bashliq} \n ${metinShare} \n ${textShareText}");
                          }, icon: Icon(Icons.share_rounded, color: Colors.red,)),
                    ],
                  ),


                ],
              ),
              SizedBox(height: 10,)
            ],
          ),
        ],
      ),
      decoration: BoxDecoration(
          border: Border.all(width: 0.2, color: Colors.red),
          color: Theme.of(context).colorScheme.onInverseSurface,
          borderRadius: BorderRadius.circular(15)
      ),
    )


  );
}


Padding buildOtherMovzu(BuildContext context, ) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10 ),
    child: Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListView(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: appBarColor.shade100
                  ),
                  child: ListTile(
                    onTap: (){
                      Navigator.push(context, CupertinoPageRoute(builder: (context)=>YenilenenMovzular()));
                    },
                    leading: Icon(Icons.topic_rounded, color: Colors.yellowAccent.shade400,),
                    title: Text("Ən son yenilənən mövzular", style: GoogleFonts.alata(  fontSize: 18),),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: appBarColor.shade100
                  ),
                  child: ListTile(
                    onTap: (){
                      Navigator.push(context, CupertinoPageRoute(builder: (context)=>ElaveMovzular()));
                    },
                    leading: Icon(Icons.topic_rounded, color: Colors.yellowAccent.shade400,),
                    title: Text("Ən son əlavə olunan mövzular", style: GoogleFonts.alata(  fontSize: 18),),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: appBarColor.shade100
                  ),
                  child: ListTile(
                    onTap: (){
                      Navigator.push(context, CupertinoPageRoute(builder: (context)=>Themes()));
                    },
                    leading: Icon(Icons.topic_rounded, color: Colors.yellowAccent.shade400,),
                    title: Text("Sizin üçün maraqlı mövzular", style: GoogleFonts.alata(  fontSize: 18)),
                  ),
                ),
              ),
            ],

          ),
        ],
      ),
      decoration: BoxDecoration(
        border: Border.all(width: 2, color: appBarColor.shade100),
          // color: Theme.of(context).colorScheme.onInverseSurface,
          borderRadius: BorderRadius.circular(15)
      ),
    ),
  );
}



Padding buildMovzu(BuildContext context, String bashliq, String metin, String maetinShare) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10, ), child:  Container(
    height: 300 ,
    width: double.infinity,
    child: Stack(
      children: [
        ListTile(
            leading: Icon(Icons.format_quote_rounded, color: Colors.deepOrange,),
            isThreeLine: true,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(bashliq, maxLines: 1, overflow: TextOverflow.ellipsis, style: GoogleFonts.arimaMadurai(fontWeight: FontWeight.bold, fontSize: 25, color:  Colors.green,),),
              ],),
            subtitle: Padding(
              padding: EdgeInsets.only(bottom: 100),
              child: Scrollbar(
                child: SingleChildScrollView(
                  child: Html(
                    data: metin,
                    style: {
                      "span" : Style(
                        fontSize: FontSize(16),
                        fontFamily: GoogleFonts.poppins().fontFamily,
                      ),
                      "p": Style(
                        fontSize: FontSize(16),
                        fontFamily: GoogleFonts.poppins().fontFamily,


                      ),



                    },
                  ),
                ),
              ),
            )
          // Text(metin, maxLines: 10, overflow: TextOverflow.ellipsis ,textAlign: TextAlign.justify, style: GoogleFonts.poppins(fontSize: 18) ,)
        ),

        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: ElevatedButton(onPressed: (){
                    Navigator.push(context, CupertinoPageRoute(builder: (context)=>GununMovzusuReader()));
                    // void _launchUrl(String patha) async {
                    //   if (!await launch(Uri.parse(patha).toString(), forceSafariVC: true, forceWebView: false )) throw 'Could not launch $patha';
                    // }
                    // _launchUrl("https://www.gozelislam.com/");
                  }, child: Text(metin.isEmpty ? "Sayta keçid et" :  "Ətraflı oxu", style: GoogleFonts.poppins(),),
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.transparent, elevation: 0, shadowColor: Colors.transparent, side: BorderSide(width: .8)),),
                ),
                Row(
                  children: [
                    IconButton(onPressed: (){
                      Clipboard.setData(ClipboardData(text: metin))
                          .then((value) { //only if ->
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              duration: Duration(seconds: 1),
                              showCloseIcon: true,
                              content: Text("Kopyalandı", style: GoogleFonts.poppins(color: Colors.black),),
                              behavior: SnackBarBehavior.floating,
                              backgroundColor: Colors.red.shade100,
                              shape: RoundedRectangleBorder(),
                            ));
                      });
                    }, icon:Icon(Icons.copy_sharp, color: Colors.red,) ),
                    IconButton(
                        onPressed: ()async{
                          await Share.share("${bashliq} \n ${maetinShare} \n ${textShareText}");
                        }, icon: Icon(Icons.share_rounded, color: Colors.red,)),
                  ],
                ),


              ],
            ),
            SizedBox(height: 10,)
          ],
        ),
      ],
    ),
    decoration: BoxDecoration(
        border: Border.all(width: 0.2, color: Colors.red),
        color: Theme.of(context).colorScheme.onInverseSurface,
        borderRadius: BorderRadius.circular(15)
    ),
  )

  );
}
StatefulBuilder buildPrayerTimes(BuildContext context, var base, var extra, String hicrah, String date,  ) {
  GetStorage box = GetStorage();
  var isOpen = false;
  var currentTime;
  String cityname = "Bakı";
  var isLoading  = false;
  Future<void> getData(String url)async{
    var response = await http.get(Uri.parse("https://prayer-time-ws.herokuapp.com/api/dates/json/1.0/allDataYearly?indexOfCity=${url}"));
    var json = response.body;
    var jsonData = jsonDecode(utf8.decode(json.runes.toList()).toString());
    if (response.statusCode == 200) {
      currentTime = jsonData["data"];
      box.write("time", currentTime);


    }
  }
  return StatefulBuilder(
    builder: (BuildContext context, void Function(void Function()) setState) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: AnimatedContainer(
            width: double.infinity,
            child:
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 14, left: 14, top: 5, ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(child: Icon(Icons.calendar_month, color: Colors.red,), onTap: (){  Navigator.push(context, CupertinoPageRoute(builder: (context)=>PrayerTimeTable()));
                      },),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                              date,
                              style: GoogleFonts.alata(fontSize: 17, color: Colors.red)),
                          Text(
                              hicrah,
                              maxLines: 1,
                              style: GoogleFonts.alata(color: Colors.black.withOpacity(.7))
                          )
                        ],
                      ),
                      InkWell(
                          child: Text("${box.read("nameOfCity") ?? "Bakı"}", style: GoogleFonts.arimaMadurai(fontWeight: FontWeight.bold, color: Colors.red.shade600, fontSize: 25),),
                          onTap: (){
                            showModalBottomSheet(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15))),
                                context: context,
                                builder: ( BuildContext context ) {
                                  return StatefulBuilder(
                                    builder: (BuildContext context, StateSetter setState) {
                                      return Stack(
                                        alignment: Alignment.topCenter,
                                        children: [

                                          Container(
                                              decoration: BoxDecoration(
                                                  color: appBarColor.shade50,
                                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15))
                                              ),
                                              child: ListView.separated(
                                                padding: EdgeInsets.only(top: 20 ),
                                                itemBuilder: (BuildContext context, int index) {
                                                  return ListTile(
                                                    leading: Icon(Icons.location_city_sharp, color: Colors.red.shade200),
                                                    onTap: () async {
                                                      setState(() {
                                                        isLoading = true;
                                                        switch(itemCodes[index]){
                                                          case "1423": cityname = "Ağdam" ;
                                                          break;
                                                          case "1424": cityname = "Şirvan";
                                                          break;
                                                          case "1425":  cityname ="Bakı";
                                                          break;case "1426":  cityname ="Bərdə";
                                                        break;case "1427": cityname ="Fizuli";
                                                        break;case "1428":cityname = "Gəncə";
                                                        break;case "1432": cityname ="Lənkəran";
                                                        break;case "1435": cityname ="Mingəçevir";
                                                        break;case "1437":cityname = "Sabirabad";
                                                        break;case "1438": cityname ="Səlyan";
                                                        break;case "1439": cityname ="Şəki";
                                                        break;case "1440": cityname ="Sumqayıt";
                                                        break;case "1441": cityname ="Zaqatala";
                                                        break;case "1443": cityname ="Şuşa";
                                                        break;case "1445": cityname ="Naxçıvan";
                                                        break;case "1447": cityname ="Culfa";
                                                        break;case "21319": cityname ="Tovuz";
                                                        break;case "38073": cityname ="Ağdaş";
                                                        break;case "38172": cityname ="İmişli";
                                                        break;case "38174": cityname ="Gədəbəy";
                                                        break;case "38179": cityname ="Ağdərə";
                                                        break;case "38193": cityname ="Saatlı";
                                                        break;case "38290": cityname ="Kəngərli";
                                                        break;case "38356": cityname ="Daşkəsən";
                                                        break;case "38457": cityname ="Göyçay";
                                                        break;case "38654": cityname ="Lerik";
                                                        break;case "38788": cityname ="Qubadlı";
                                                        break;case "38875": cityname ="Siyəzən";
                                                        break;case "38904": cityname ="Biləsuvar";
                                                        break;case "38944": cityname ="Yardımlı";
                                                        break;case "38985": cityname ="Xankəndi";
                                                        break;case "43363": cityname ="Ağsu";
                                                        break;case "43392":cityname = "Neftçala";
                                                        break;case "43395":cityname = "Quba";
                                                        break; case "43397": cityname ="Ucar";
                                                        break; case "43398": cityname ="Xaçmaz";
                                                        break; case "43661": cityname ="Tərtər";
                                                        break; case "43649": cityname ="Astara";
                                                        break; case "43873": cityname ="Beyləqan";
                                                        break; case "60075": cityname ="İsmayıllı";
                                                        break; case "62280": cityname ="Qusar";
                                                        break; case "62281": cityname ="Ordubad";
                                                        break; case "62282":cityname = "Şamaxı";
                                                        break; case "43392":cityname = "Goranboy";
                                                        break; case "62728":cityname = "Balakən";
                                                        break; case "65729": cityname ="Qax";
                                                        break; case "65732": cityname ="Şəmkir";
                                                        break; case "65737":cityname = "Yevlax";
                                                        break; case "65739": cityname ="Laçın" ;
                                                        break; case "65744": cityname ="Cəlilabad";
                                                        break; case "67957": cityname ="Oğuz";
                                                        break; case "70928": cityname ="Qəbələ";
                                                        break; case "82092": cityname ="Ağcabədi";
                                                        break; case "92768": cityname ="Göygöl";
                                                        break; case "92807": cityname ="Zəngilan";
                                                        break; case "21320": cityname ="Qazax";

                                                        break;
                                                        }
                                                      });


                                                      try{
                                                        await getData(itemCodes[index]!);
                                                        box.write("nameOfCity", cityname);
                                                        isLoading = false;
                                                        Navigator.of(context).pushAndRemoveUntil(
                                                            CupertinoPageRoute(
                                                                builder: (context) => HomeScreen()),
                                                                (route) => false
                                                        );
                                                      }
                                                      catch(e){
                                                        setState(() {
                                                          isLoading = false;
                                                        });
                                                        Navigator.pop(context);
                                                        ScaffoldMessenger.of(context).showSnackBar(
                                                            SnackBar(
                                                              duration: Duration(seconds: 1),
                                                              showCloseIcon: true,
                                                              content: Text("İnternet bağlantısı yoxdur", style: GoogleFonts.poppins(color: Colors.black),),
                                                              behavior: SnackBarBehavior.floating,
                                                              backgroundColor: Colors.red.shade100,
                                                              shape: RoundedRectangleBorder(),
                                                            ));                                                      }
                                                    },
                                                    title: Text(itemsName[index], style: GoogleFonts.alata(fontSize: 18),),
                                                    trailing: itemsName[index].contains(box.read("nameOfCity")??"Bakı") ? Icon(Icons.check_circle_outline, color: Colors.indigoAccent,) : Icon(Icons.circle_outlined),
                                                  );
                                                },
                                                separatorBuilder: (BuildContext context, int index) {
                                                  return Padding(
                                                    padding: const EdgeInsets.symmetric(horizontal: 10),
                                                    child: Divider(),
                                                  );
                                                },
                                                itemCount: itemsName.length,)
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Container(
                                              height: 8,
                                              width: 50,
                                              decoration: BoxDecoration(
                                                  color: Colors.red,
                                                  borderRadius: BorderRadius.circular(20)
                                              ),
                                            ),
                                          ),
                                          Container(
                                            height: 20,
                                            width: 400,
                                            decoration: BoxDecoration(
                                                color: Colors.transparent,
                                                borderRadius: BorderRadius.circular(20)
                                            ),
                                          ),
                                          isLoading == true ?  Container(
                                            decoration: BoxDecoration(
                                                color: Colors.indigoAccent.shade100.withOpacity(.3),
                                                borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15))
                                            ),
                                            height: MediaQuery.of(context).size.height,
                                            width: MediaQuery.of(context).size.width,
                                          ) : SizedBox(),
                                          isLoading == true ? Center(child: Lottie.asset("assets/progres.json"),) : SizedBox()
                                        ],
                                      );
                                    } ,
                                  );;
                                }
                            );
                          }

                      ),

                    ],
                  ),
                ),
                Divider(thickness: 2, endIndent: 20, indent: 20, color: appBarColor.shade50,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
                  child: SizedBox(
                    height: 60,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Container(
                              width: 80,
                              padding: EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text("İmsaq", style: GoogleFonts.alata(fontSize: 18, color: Colors.red),),
                                  Text(base["imsaq"], style: GoogleFonts.alata(fontSize: 18, fontWeight: FontWeight.w500),)
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Container(
                              width: 80,
                              padding: EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text("Sübh", style: GoogleFonts.alata(fontSize: 18, color: Colors.red),),
                                  Text(base["sabah"], style: GoogleFonts.alata(fontSize: 18, fontWeight: FontWeight.w500),)
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Container(
                              width: 80,
                              padding: EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text("Günəş", style: GoogleFonts.alata(fontSize: 18, color: Colors.red),),
                                  Text(base["gunes"], style: GoogleFonts.alata(fontSize: 18, fontWeight: FontWeight.w500),)
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Container(
                              width: 80,
                              padding: EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text("İşrak", style: GoogleFonts.alata(fontSize: 18, color: Colors.red),),
                                  Text(extra["israk"], style: GoogleFonts.alata(fontSize: 18, fontWeight: FontWeight.w500),)
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Container(
                              width: 80,
                              padding: EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text("Kərahət", style: GoogleFonts.alata(fontSize: 18, color: Colors.red),),
                                  Text(extra["kerahat"], style: GoogleFonts.alata(fontSize: 18, fontWeight: FontWeight.w500),)
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Container(
                              width: 80,
                              padding: EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text("Zöhr", style: GoogleFonts.alata(fontSize: 18, color: Colors.red),),
                                  Text(base["gunorta"], style: GoogleFonts.alata(fontSize: 18, fontWeight: FontWeight.w500),)
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Container(
                              width: 80,
                              padding: EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text("Əsr", style: GoogleFonts.alata(fontSize: 18, color: Colors.red),),
                                  Text(base["ikindi"], style: GoogleFonts.alata(fontSize: 18, fontWeight: FontWeight.w500),)
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Container(
                              width: 80,
                              padding: EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text("Əsr Sani", style: GoogleFonts.alata(fontSize: 18, color: Colors.red),),
                                  Text(extra["asri_sani"], style: GoogleFonts.alata(fontSize: 18, fontWeight: FontWeight.w500),)
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Container(
                              width: 80,
                              padding: EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text("Şam", style: GoogleFonts.alata(fontSize: 18, color: Colors.red),),
                                  Text(base["axsam"], style: GoogleFonts.alata(fontSize: 18, fontWeight: FontWeight.w500),)
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Container(
                              width: 80,
                              padding: EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text("İşa", style: GoogleFonts.alata(fontSize: 18, color: Colors.red),),
                                  Text(base["yatsi"], style: GoogleFonts.alata(fontSize: 18, fontWeight: FontWeight.w500),)
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Container(
                              width: 80,
                              padding: EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text("İşa sani", style: GoogleFonts.alata(fontSize: 18, color: Colors.red),),
                                  Text(extra["isa_sani"], style: GoogleFonts.alata(fontSize: 18, fontWeight: FontWeight.w500),)
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Container(
                              width: 80,
                              padding: EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text("Gecə", style: GoogleFonts.alata(fontSize: 18, color: Colors.red),),
                                  Text(extra["midnight"], style: GoogleFonts.alata(fontSize: 18, fontWeight: FontWeight.w500),)
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Container(
                              width: 80,
                              padding: EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text("Təhəccüd", style: GoogleFonts.alata(fontSize: 18, color: Colors.red),),
                                  Text(extra["teheccud"], style: GoogleFonts.alata(fontSize: 18, fontWeight: FontWeight.w500),)
                                ],
                              ),
                            ),
                          ),


                        ]
                    ),
                  ),
                ),
              ],
            ),
            decoration: BoxDecoration(
                color: appBarColor.shade100,
                borderRadius: BorderRadius.circular(15)
            ), duration: Duration(seconds: 1)
        ),
      );
    },
  );
}


Padding buildYoutube(BuildContext context, Video video) {
  return Padding(
    padding: const EdgeInsets.only(top: 10, right: 10, left: 10, bottom: 0) ,
    child: Container(
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onInverseSurface,
          borderRadius: BorderRadius.circular(15)
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          InkWell(
            onTap: (){Navigator.push(context, CupertinoPageRoute(builder: (context) =>VideoScreen(id: video, hero: "0", )),);},
            child: ClipRRect(
              borderRadius: BorderRadius.only(topRight:  Radius.circular(10), topLeft: Radius.circular(10)),
              child: SizedBox(
                height: 220,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Hero(
                        tag: "0",
                        child: FadeInImage(
                          fit: BoxFit.fitHeight,
                          placeholder: AssetImage("assets/logi.png",),
                          image: NetworkImage("${video.thumbnailUrl}"),
                        ),
                      ),
                    ),
                  ],
                ),
              )

            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: OutlinedButton(
                    onPressed: () async {
                      Navigator.push(context, CupertinoPageRoute(builder: (context)=>YouTubeCard()));
                    },
                    child: Text(
                      "Daha çox", style: GoogleFonts.poppins(),

                    )),
              ),
              IconButton(
                  onPressed: () async {

                    await Share.share("https://www.youtube.com/watch?v=${video!.id}");
                  },
                  icon: Icon(
                    Icons.share,
                    color: appBarColor,
                  )),
            ],
          ),
          SizedBox(height: 10,)

        ],
      ),
    ),
  );
}


class BuildEsma extends StatefulWidget {
 int index;

 BuildEsma(this.index);

  @override
  State<BuildEsma> createState() => _BuildEsmaState();
}

class _BuildEsmaState extends State<BuildEsma> {
  GlobalKey previewContainer = new GlobalKey();
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10 ),
      child: RepaintBoundary(
          key: previewContainer,
          child: Container(
            width: double.infinity,
            child: Column(
              children: [
                ListTile(
                    style: ListTileStyle.drawer,
                    leading:  Image.asset("assets/esma.png", width: 23, color: Colors.deepOrange, ),
                    isThreeLine: true,
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(esmaTileListe[widget.index], style: GoogleFonts.arimaMadurai(fontWeight: FontWeight.bold, fontSize: 25, color:  Colors.orange,),),
                        Text(arabItem[widget.index], maxLines: 10, overflow: TextOverflow.ellipsis ,textAlign: TextAlign.justify, style: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.w500, color: Colors.deepOrange) ,)

                      ],
                    ),
                    subtitle: Padding(
                        padding: EdgeInsets.only(bottom: 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: 30,),
                            Text("”${mena[widget.index]}“" ,textAlign: TextAlign.center, style: GoogleFonts.arimaMadurai(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.indigo) ,),
                            SizedBox(height: 15,)
                          ],
                        )

                    )
                ),
               _isLoading ? Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset("assets/header.png", height: 50,),
                    ),
                    Text("www.gozelislam.com" ,textAlign: TextAlign.center, style: GoogleFonts.poppins(fontSize: 18,  color: Colors.red) ,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset("assets/header.png", height: 50,),
                    ),
                  ],
                )
                 : Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: ElevatedButton(onPressed: (){
                        Navigator.push(context, CupertinoPageRoute(builder: (context)=>EsmaScreen()));
                        // void _launchUrl(String patha) async {
                        //   if (!await launch(Uri.parse(patha).toString(), forceSafariVC: true, forceWebView: false )) throw 'Could not launch $patha';
                        // }
                        // _launchUrl("https://www.gozelislam.com/");
                      }, child: Text("Daha çox", style: GoogleFonts.poppins(),),
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.transparent, elevation: 0, shadowColor: Colors.transparent, side: BorderSide(width: .8)),),
                    ),
                    IconButton(
                        onPressed: ()async {

                          setState(() {
                            _isLoading = true;
                          });

                        await  Future.delayed(Duration(milliseconds: 300));
                          Future.delayed(Duration(milliseconds: 1), () async{
                            await ShareFilesAndScreenshotWidgets().shareScreenshot(
                                previewContainer,
                                1200,
                                "Title",
                                "${mena[widget.index].substring(0, 2)}.jpg",
                                "image/jpeg",
                                text: "Dini Mövzular, Söhbətlər və Sual-Cavab www.gozelislam.com\n${textShareText}");
                          });


                          setState(() {
                            _isLoading = false;
                          });
                        },
                        // async{
                        //   await Share.share(" ${arabItem[Jiffy.now().weekOfYear]}  \n ${esmaTileListe[Jiffy.now().weekOfYear]} \n ${mena[Jiffy.now().weekOfYear]}  \n ${textShareText}");
                        // },
                        icon: Icon(Icons.share_rounded, color: Colors.red,)),
                  ],
                ),
                SizedBox(height: 10,)



              ],
            ),
            decoration: BoxDecoration(
                border: Border.all(width: 0.2, color: Colors.red),
                color: Theme.of(context).colorScheme.onInverseSurface,
                borderRadius: BorderRadius.circular(15)
            ),
          )

      ),
    );
  }
}


Padding buildBanner(BuildContext context, ) {
  var _list = ["assets/dinikitablar1.png", "assets/dinikitablar2.png", "assets/dinikitablar3.png",  ];
  return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 0 ),
      child:  Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 103,
              child: Swiper(
                  pagination: SwiperPagination(
                    margin: EdgeInsets.only(top: 60),
                      builder: DotSwiperPaginationBuilder(
                      activeColor: appBarColor, color: Colors.white),
                      alignment: Alignment.bottomCenter),
                  indicatorLayout: PageIndicatorLayout.SCALE,
                  itemCount: _list.length,
                  itemBuilder: (context, index){
                    return ClipRRect(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)),
                        child: Image.asset(_list[index]));
                  }),
            ),
            SizedBox(height: 10,),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: ElevatedButton(onPressed: (){
                    Navigator.push(context, CupertinoPageRoute(builder: (context)=>EsmaScreen()));
                    void _launchUrl(String patha) async {
                      if (!await launch(Uri.parse(patha).toString(), forceSafariVC: true, forceWebView: false )) throw 'Could not launch $patha';
                    }
                    _launchUrl("https://form.jotform.com/200363853004445");
                  }, child: Text("Sifariş et", style: GoogleFonts.poppins(),),
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.transparent, elevation: 0, shadowColor: Colors.transparent, side: BorderSide(width: .8)),),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 8),
                  child: ElevatedButton(onPressed: (){
                    Navigator.push(context, CupertinoPageRoute(builder: (context)=>BookScreen()));
                    // void _launchUrl(String patha) async {
                    //   if (!await launch(Uri.parse(patha).toString(), forceSafariVC: true, forceWebView: false )) throw 'Could not launch $patha';
                    // }
                    // _launchUrl("https://www.gozelislam.com/");
                  }, child: Text("Oxu", style: GoogleFonts.poppins(fontSize: 15 ,fontWeight: FontWeight.bold,),),
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.transparent, elevation: 0, shadowColor: Colors.transparent, side: BorderSide(width: .8)),),
                ),
              ],
            ),
            SizedBox(height: 10,)



          ],
        ),
        decoration: BoxDecoration(
            color: appBarColor.shade50,
            borderRadius: BorderRadius.circular(15)
        ),
      )

  );
}



