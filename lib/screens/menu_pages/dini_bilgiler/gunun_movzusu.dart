import 'dart:async';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../Constants.dart';
import 'package:flutter_html/flutter_html.dart';


class GununMovzusuReader extends StatefulWidget {

  @override
  State<GununMovzusuReader> createState() => _GununMovzusuReaderState();
}

class _GununMovzusuReaderState extends State<GununMovzusuReader> {
  late PersistentBottomSheetController _controller; // <------ Instance variable
  final _scaffoldKey = GlobalKey<ScaffoldState>(); // <---- Another instance variable
  void _createBottomSheet() async{
    _controller = await _scaffoldKey.currentState!.showBottomSheet(
        enableDrag: true,
            (context) =>
            SizedBox(
              height: 300,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 8,
                      width: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: appBarColor.shade300
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20.0, horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment
                          .spaceBetween,
                      children: [
                        Text("Arxa Fon",
                          style: GoogleFonts.alata(fontSize: 20),),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: appBarColor.shade300
                          ),
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    box.write("arxaFon", "white");
                                    _bacgroundColor = Colors.white;
                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,

                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    box.write(
                                        "arxaFon", "lightBlueAccent");

                                    _bacgroundColor =
                                        appBarColor.shade100;
                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                        color: appBarColor.shade100,
                                        shape: BoxShape.circle
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    box.write("arxaFon", "grey");

                                    _bacgroundColor = Colors.orange.shade100;
                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                        color: Colors.orange.shade100,
                                        shape: BoxShape.circle
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(onTap: () {
                                setState(() {
                                  box.write("arxaFon", "amber");

                                  _bacgroundColor =
                                      Colors.amber.shade100;
                                });
                              },
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                        color: Colors.amber.shade100,
                                        shape: BoxShape.circle
                                    ),
                                  ),
                                ),
                              ),


                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Divider(),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment
                          .spaceBetween,
                      children: [
                        Text("Zoom", style: GoogleFonts.alata(fontSize: 20),),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              InkWell(
                                  onTap: () {
                                    setState(() {
                                      _fontSize--;
                                      box.write("font", _fontSize);
                                    });
                                  },
                                  child: Icon(Icons.remove,
                                    color: appBarColor,
                                    size: 30,)),
                              Icon(Icons.text_fields, size: 30),
                              InkWell(
                                  onTap: () {
                                    setState(() {
                                      _fontSize++;
                                      box.write("font", _fontSize);
                                    });
                                  },
                                  child: Icon(Icons.add,
                                      color: appBarColor,
                                      size: 30))
                            ],
                          ),
                        )

                      ],
                    ),
                  )
                ],
              ),
            )

    );
  }


  double _fontSize = 16;
  var _bacgroundColor = Colors.white;
  var _box;
  GetStorage box = GetStorage();

  void _increaseFontSize(){
    setState((){
      if(_fontSize < 51)
        _fontSize++;
    });
  }
  void _removwFontSize(){
    setState((){
      if(_fontSize > 10)
        _fontSize--;
    });
  }



  var bashliq10;
  var metin10;

  var _url = Uri.parse("https://www.gozelislam.com/");



  void _launchUrl(String patha) async {
    if (!await launch(Uri.parse(patha).toString(), forceSafariVC: true, forceWebView: false )) throw 'Could not launch $patha';
  }
  void zor (){
    setState((){

    });
  }
  var _link2;



var bashliq ;
var metin;
  @override
  void initState() {
   bashliq =  box.read("bashliqGun");
   metin = box.read("movzuGun");
    _box =  box.read("arxaFon") ?? "white";
    _fontSize = box.read("font") ?? 15;

    switch(_box ){
      case "white70" : _bacgroundColor = Colors.white;
      break;
      case "lightBlueAccent": _bacgroundColor = appBarColor.shade100;
      break;
      case "grey" : _bacgroundColor = Colors.orange.shade100;
      break;
      case "amber" : _bacgroundColor = Colors.amber.shade100;
      break;

    }

    // TODO: implement initState
    super.initState();
  }



  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      key: _scaffoldKey,
      extendBodyBehindAppBar: true,
      backgroundColor: _bacgroundColor,
      appBar: AppBar(
        scrolledUnderElevation: 3,
        centerTitle: true,
        backgroundColor: appBarColor,
        title: Text("Günün mövzusu", style: GoogleFonts.arimaMadurai(color: Colors.white, fontWeight: FontWeight.bold, ),),
        actions: [
          IconButton(
              icon: const Icon(Icons.settings),
              color: Colors.white,
              onPressed: () {
                _createBottomSheet();
              }
          ),],

        elevation: 0,
      ),
      body: metin != null ? Scrollbar(
        child: ListView(
          children: <Widget>[


            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Animate(
                    effects: [
                      FadeEffect(duration: Duration(milliseconds: 200))
                    ],
                    child: Animate(
                      effects: [
                        FadeEffect(duration: Duration(milliseconds: 400))
                      ],
                      child: Text(
                        box.read("bashliqGun")??"nulll", textAlign: TextAlign.center, style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 25),),
                    ),
                  ),

                  AnimatedDefaultTextStyle(
                    style: GoogleFonts.arimaMadurai(color: Colors.black, fontSize: _fontSize),
                    duration:Duration(milliseconds: 400),
                    child: Html(data: box.read("movzuGun")??"nulll" ,
                      style: {
                        "span": Style(
                          fontSize: FontSize(_fontSize),
                        ),
                        "p": Style(
                          fontSize: FontSize(16),
                        ),
                        "img": Style(
                          fontSize: FontSize(16),
                        ),
                        "td": Style(
                          fontSize: FontSize(16),
                        ),



                      },  ),),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextButton(onPressed: () {
                _launchUrl("https://www.gozelislam.com/gunun-sohbeti.html");
              },
                  child: Center(child: Text('Saytda bax' ,style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300, color: Colors.blue ),))),
            )


            //3

          ],
        ),
      ): Center(child: Lottie.asset("assets/progres.json", height: 100),),
    );}}