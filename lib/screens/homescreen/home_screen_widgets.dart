
import 'dart:convert';
import 'package:gozel_islam/screens/homescreen/other_topics/en_son_elave.dart';
import 'package:gozel_islam/screens/homescreen/other_topics/maraqli-movzu.dart';
import 'package:gozel_islam/screens/homescreen/other_topics/yenilenen_movzular.dart';
import 'package:gozel_islam/screens/menu_pages/test.dart';
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

import '../menu_pages/dini_bilgiler/reader.dart';


Widget headerContainers(BuildContext context){
  return  Padding(
    padding: EdgeInsets.only(top: 10, bottom: 0),
    child: SizedBox(
      height: 130,
      child: ListView(
        padding: EdgeInsets.only(left: 10),
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
                    SizedBox(height: 5,),
                    Text("Bütün dini mövzular", style: GoogleFonts.alata(color: Colors.white60, fontSize: 13),),],),
                width: 160,
                decoration: BoxDecoration(
                    color: appBarColor,
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
                        child: Image.asset("assets/open-book.png", height: 40,)),
                    Text("Doğru İman Bilgiləri", style: GoogleFonts.alata(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),),
                    SizedBox(height: 5,),
                    Text("İman haqqında bilgilər", style: GoogleFonts.alata(color: Colors.white60, fontSize: 13),),
                  ],

                ),
                width: 160,
                decoration: BoxDecoration(
                    color: appBarColor.shade300,
                    borderRadius: BorderRadius.circular(15)
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: InkWell(
              onTap: (){
                Navigator.push(context, CupertinoPageRoute(builder: (context)=>DiniBilgiler1Page(link: Uri.parse("https://www.gozelislam.com/qusl/namaz/"), bashliq: "İman Bilgiləri")));

              },
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset("assets/open-book.png", height:40,),
                    Text("Namaz Öyrənirəm", style: GoogleFonts.alata(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),),
                    SizedBox(height: 5,),
                    Text("Namaz bilgiləri", style: GoogleFonts.alata(color: Colors.white60, fontSize: 13),),

                  ],

                ),
                width: 160,
                decoration: BoxDecoration(
                    color: appBarColor.shade300,
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
                Navigator.push(context, CupertinoPageRoute(builder: (context)=>DiniBilgiler1Page(link: Uri.parse("https://www.gozelislam.com/qusl/qusul/"), bashliq: "İman Bilgiləri")));

              },
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset("assets/open-book.png", height:40,),
                    Text("Qüsl, Dəstəmaz, Heyz", style: GoogleFonts.alata(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),),
                    SizedBox(height: 5,),
                    Text("Namaz öyrənmək üçün", style: GoogleFonts.alata(color: Colors.white60, fontSize: 13),),


                  ],

                ),
                width: 160,
                decoration: BoxDecoration(
                    color: appBarColor.shade300,
                    borderRadius: BorderRadius.circular(15)
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: InkWell(
              onTap: (){
                Navigator.push(context, CupertinoPageRoute(builder: (context)=>DiniBilgiler1Page(link: Uri.parse("https://www.gozelislam.com/oruc-ve-ramazan/"), bashliq: "İman Bilgiləri")));

              },
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset("assets/open-book.png", height: 40,),
                    Text("Ramazan və oruc", style: GoogleFonts.alata(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),),
                    SizedBox(height: 5,),
                    Text("Ramazan və oruc bilgiləri", style: GoogleFonts.alata(color: Colors.white60, fontSize: 13),),],),
                width: 160,
                decoration: BoxDecoration(
                    color: appBarColor.shade300,
                    borderRadius: BorderRadius.circular(15)
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: InkWell(
              onTap: (){
                Navigator.push(context, CupertinoPageRoute(builder: (context)=>DiniBilgiler1Page(link: Uri.parse("https://www.gozelislam.com/peygember-efendimiz/"), bashliq: "İman Bilgiləri")));

              },
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset("assets/open-book.png", height: 40,),
                    Text("Peyğambər Əfəndimiz", style: GoogleFonts.alata(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),),
                    SizedBox(height: 5,),
                    Text("Üstünlükləri, fəzilətləri və s. bilgilər", style: GoogleFonts.alata(color: Colors.white60, fontSize: 13),),],),
                width: 160,
                decoration: BoxDecoration(
                    color: appBarColor.shade300,
                    borderRadius: BorderRadius.circular(15)
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: InkWell(
              onTap: (){
                Navigator.push(context, CupertinoPageRoute(builder: (context)=>DiniBilgiler1Page(link: Uri.parse("https://www.gozelislam.com/qurani-kerim/"), bashliq: "İman Bilgiləri")));

              },
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset("assets/open-book.png", height: 40,),
                    Text("Qurani Kərim", style: GoogleFonts.alata(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),),
                    SizedBox(height: 5,),
                    Text("Qurani Kərim haqqında bilgilər", style: GoogleFonts.alata(color: Colors.white60, fontSize: 13),),],),
                width: 160,
                decoration: BoxDecoration(
                    color: appBarColor.shade300,
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
Padding buildHikmet(BuildContext context, String metin) {
  return Padding(
    padding: const EdgeInsets.only(left: 10, right: 10, bottom: 20, top: 10),
    child: AnimatedContainer(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ListTile(
              isThreeLine: true,
              title: Text("Hikmət əhli buyurdu ki,", style: GoogleFonts.arimaMadurai(fontWeight: FontWeight.bold, color: appBarColor, fontSize: 18),),
              subtitle: Text(metin,
                textAlign: TextAlign.start,
                style: GoogleFonts.poppins(fontSize: 16) ,)),
          Row(mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                  onPressed: (){
                    Navigator.push(context, CupertinoPageRoute(builder: (context)=>BackgroundScreen("Hikmət əhli buyurdu ki, ${metin}")));
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
                    await Share.share("Hikmət əhli buyurdu ki, ${metin} \n ${textShareText}");
                  }, icon: Icon(Icons.share_rounded, color: Colors.red,)),



            ],
          )
        ],
      ),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onInverseSurface,
          borderRadius: BorderRadius.circular(15)
      ), duration: Duration(seconds: 1),
    ),
  );
}

Column buildButtons(BuildContext context) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, ),
        child: Column(
          children: [
            ElevatedButton(onPressed: (){
              Navigator.push(context, CupertinoPageRoute(builder: (context)=>Test1()));
            }, child: Text("SUAL GÖNDƏR", style: GoogleFonts.alatsi(fontSize: 20),),
              style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  side: BorderSide(width: 1),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
              ),)
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, ),
        child: Column(
          children: [
            ElevatedButton(onPressed: (){}, child: Text("KİTAB SİFARİŞ ET", style: GoogleFonts.alatsi(fontSize: 20),),
              style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  side: BorderSide(width: 1),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
              ),)
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, ),
        child: Column(
          children: [
            ElevatedButton(onPressed: (){}, child: Text("MAİL QRUPUNA ABUNƏ OL", style: GoogleFonts.alatsi(fontSize:20),),
              style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  side: BorderSide(width: 1),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
              ),)
          ],
        ),
      ),
    ],
  );
}

Padding buildSocial() {
  return Padding(
    padding: EdgeInsets.all(10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        OutlinedButton(
            style: OutlinedButton.styleFrom(backgroundColor: Colors.blue),
            onPressed: (){}, child: Text("Facebook", style: TextStyle(color: Colors.white), )),
        OutlinedButton(
            style: OutlinedButton.styleFrom(backgroundColor: Colors.green),
            onPressed: (){}, child: Text("Whatsapp", style: TextStyle(color: Colors.white))),
        OutlinedButton(
            style: OutlinedButton.styleFrom(backgroundColor: Colors.blue),
            onPressed: (){}, child: Text("Telegram", style: TextStyle(color: Colors.white))),

      ],
    ),
  );
}

Padding buildMaraqliMovzular(String bashliq, String metin, String url, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10 ),
    child:  Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ListTile(
              isThreeLine: true,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(bashliq, style: GoogleFonts.arimaMadurai(fontWeight: FontWeight.bold, fontSize: 18, color: appBarColor),),
                ],),
              subtitle: Text(metin, maxLines: 10, overflow: TextOverflow.ellipsis ,textAlign: TextAlign.justify, style: GoogleFonts.poppins(fontSize: 18) ,)),

          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: ElevatedButton(onPressed: (){
                  Navigator.push(context, CupertinoPageRoute(builder: (context)=>DiniReader(url: Uri.parse(url))));
                  // void _launchUrl(String patha) async {
                  //   if (!await launch(Uri.parse(patha).toString(), forceSafariVC: true, forceWebView: false )) throw 'Could not launch $patha';
                  // }
                  // _launchUrl("https://www.gozelislam.com/");
                }, child: Text(metin.isEmpty ? "Sayta keçid et" :  "Ardını oxu", style: GoogleFonts.poppins(),),
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
                        await Share.share("${bashliq} \n ${metin} \n ${textShareText}");
                      }, icon: Icon(Icons.share_rounded, color: Colors.red,)),
                ],
              ),


            ],
          ),
          SizedBox(height: 20,)
        ],
      ),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onInverseSurface,
          borderRadius: BorderRadius.circular(15)
      ),
    )


  );
}

Padding buildYenilenenMovzu(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
    child: Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 19, top: 10),
            child: Text("Yenilənən mövzular", style: GoogleFonts.arimaMadurai(fontWeight: FontWeight.bold, color: appBarColor , fontSize: 18),),
          ),
          ListView(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: [
              ListTile(
                leading: Icon(Icons.topic_outlined, color: appBarColor.shade600),
                title: Text("Rəsm çəkmək..", style: GoogleFonts.poppins(fontSize: 18),), trailing: Icon(Icons.chevron_right, color: appBarColor.shade600,),),
              ListTile(
                  leading: Icon(Icons.topic_outlined, color: appBarColor.shade600),
                  title: Text("Cümə günü və gecəsi nə oxunmalıdır..", style: GoogleFonts.poppins(fontSize: 18),), trailing: Icon(Icons.chevron_right, color: appBarColor.shade600)),
              ListTile(
                  leading: Icon(Icons.topic_outlined, color: appBarColor.shade600),
                  title: Text("Xəstəyə qan vermək..", style: GoogleFonts.poppins(fontSize: 18),),trailing: Icon(Icons.chevron_right, color: appBarColor.shade600)),
              ListTile(
                  leading: Icon(Icons.topic_outlined, color: appBarColor.shade600),
                  title: Text("Ən uca elm həddini bilməkdir..", style: GoogleFonts.poppins(fontSize: 18)), trailing: Icon(Icons.chevron_right, color: appBarColor.shade600)),
              ListTile(
                  leading: Icon(Icons.topic_outlined, color: appBarColor.shade600),
                  title: Text("Gözəl əxlaq..", style: GoogleFonts.poppins(fontSize: 18),), trailing: Icon(Icons.chevron_right, color: appBarColor.shade600)),


            ],
          ),
        ],
      ),
      decoration: BoxDecoration(
          color:Theme.of(context).colorScheme.onInverseSurface,
          borderRadius: BorderRadius.circular(15)
      ),
    ),
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
                    leading: Icon(Icons.topic_rounded),
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
                    leading: Icon(Icons.topic_rounded),
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
                    leading: Icon(Icons.topic_rounded),
                    title: Text("Sizin üçün maraqlı mövzular", style: GoogleFonts.alata(  fontSize: 18)),
                  ),
                ),
              ),
            ],

          ),
        ],
      ),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onInverseSurface,
          borderRadius: BorderRadius.circular(15)
      ),
    ),
  );
}



Padding buildMovzu(BuildContext context, String bashliq, String metin) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10, ),
    child: Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ListTile(
              isThreeLine: true,
              title: Text(bashliq,maxLines: 1, style: GoogleFonts.arimaMadurai(fontWeight: FontWeight.bold, fontSize: 18, color: appBarColor),),
              subtitle: Text(metin.isEmpty  ? "Daha ətraflı saytda bax" : "${metin}", maxLines: 12, overflow: TextOverflow.ellipsis ,textAlign: TextAlign.justify, style: GoogleFonts.poppins(fontSize: 16) ,)),

          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: ElevatedButton(onPressed: (){
                  void _launchUrl(String patha) async {
                    if (!await launch(Uri.parse(patha).toString(), forceSafariVC: true, forceWebView: false )) throw 'Could not launch $patha';
                  }
                  _launchUrl("https://www.gozelislam.com/");
                }, child: Text(metin.isEmpty ? "Sayta keçid et" :  "Ardını oxu", style: GoogleFonts.poppins(),),
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
                        await Share.share("${bashliq} \n ${metin} \n ${textShareText}");
                      }, icon: Icon(Icons.share_rounded, color: Colors.red,)),
                ],
              ),


            ],
          ),
          SizedBox(height: 10,)
        ],
      ),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onInverseSurface,
          borderRadius: BorderRadius.circular(15)
      ),
    ),
  );
}
Padding buildPrayerTimes(BuildContext context, String subh, String dhur, String asr, String sam, String isa,  ) {
  GetStorage box = GetStorage();
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
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    child: Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Namaz vaxtı", style: GoogleFonts.arimaMadurai(fontWeight: FontWeight.bold, color: appBarColor, fontSize: 18),),
                InkWell(
                    child: Text("${box.read("nameOfCity") ?? "Bakı"}", style: GoogleFonts.alata(fontWeight: FontWeight.bold, color: Colors.red.shade600, fontSize: 25),),
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
                                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Xəta baş verdi")));
                                              }
                                            },
                                            title: Text(itemsName[index], style: GoogleFonts.alata(fontSize: 20),),
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
                                    isLoading == true ? Center(child: CircularProgressIndicator(),) : SizedBox()
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white
                  ),
                  child: Column(
                    children: [
                      Text("Sübh", style: GoogleFonts.alata(fontSize: 20, color: Colors.red),),
                      Text(subh, style: GoogleFonts.alata(fontSize: 20, fontWeight: FontWeight.w500),)
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white
                  ),
                  child: Column(
                    children: [
                      Text("Zöhr", style: GoogleFonts.alata(fontSize: 20, color: Colors.red),),
                      Text(dhur, style: GoogleFonts.alata(fontSize: 20, fontWeight: FontWeight.w500),)
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white
                  ),
                  child: Column(
                    children: [
                      Text("Əsr", style: GoogleFonts.alata(fontSize: 20, color: Colors.red),),
                      Text(asr, style: GoogleFonts.alata(fontSize: 20, fontWeight: FontWeight.w500),)
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white
                  ),
                  child: Column(
                    children: [
                      Text("Şam", style: GoogleFonts.alata(fontSize: 20, color: Colors.red),),
                      Text(sam, style: GoogleFonts.alata(fontSize: 20, fontWeight: FontWeight.w500),)
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.green.shade200
                  ),
                  child: Column(
                    children: [
                      Text("İşa", style: GoogleFonts.alata(fontSize: 20, color: Colors.red),),
                      Text(isa, style: GoogleFonts.alata(fontSize: 20, fontWeight: FontWeight.w500),)
                    ],
                  ),
                ),






              ],
            ),
          ),
          SizedBox(height: 10,)
        ],
      ),
      decoration: BoxDecoration(
          color: appBarColor.shade100,
          borderRadius: BorderRadius.circular(15)
      ),
    ),
  );
}
