
import 'dart:async';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gozel_islam/constants.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;
import 'package:url_launcher/url_launcher.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';




class Themes extends StatefulWidget {
  @override
  State<Themes> createState() => _ThemesState();
}

class _ThemesState extends State<Themes> {
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
  var _bashliq2;
  var _metin2;
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
  var bashliq;
  var metin ;


  var bashliq10;
  var metin10;

  var _url = Uri.parse("https://www.gozelislam.com/");

  bool _show = true;
  Future<void>getMovzuPage()async{
    setState(() {
      _show = false;
    });
    var _url = Uri.parse(box.read("_link2"));
    var response = await http.get(_url);
    final body = response.body;
    final document = parser.parse(body);
    var res = document.getElementsByClassName("blog-info").forEach((element)async {

      await  box.write("_metin3",element.children[2].children[1].text.toString() );
      await box.write("_bashliq3", element.children[0].text.toString());
      setState(() {
        bashliq10 = box.read("_bashliq3");
        metin10 = box.read("_metin3");
        _show = true;
      });
    });
  }
  void _launchUrl(String patha) async {
    if (!await launch(Uri.parse(patha).toString(), forceSafariVC: true, forceWebView: false )) throw 'Could not launch $patha';
  }
  void zor (){
    setState((){

    });
  }
  var _link2;
  @override
  void initState() {
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


    bashliq10 = box.read("_bashliq3")?? "Dişdə dolğu və diş qapağının olması";
    metin10 = box.read("_metin3") ?? maraqliMetin;
    _link2 = box.read("_link2");

    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      key: _scaffoldKey,
        floatingActionButton: FloatingActionButton(onPressed: () {
          getMovzuDialog();
          getMovzuPage();

        }, child: Icon(Icons.refresh),

        ),
        backgroundColor: _bacgroundColor,
        appBar: AppBar(
          scrolledUnderElevation: 3,
          iconTheme: IconThemeData(color: Colors.white),
          centerTitle: true,
          backgroundColor: appBarColor,
          title: Text("Dini mövzular", style: GoogleFonts.arimaMadurai(color: Colors.white, fontWeight: FontWeight.bold, ),),
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








        body:
        _show ?
        Scrollbar(
          child: RefreshIndicator(
            onRefresh: ()async{
              await getMovzuDialog();
              getMovzuPage();
            },
            child: ListView(
              children: <Widget>[


                Container(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
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
                                bashliq10.toString(), textAlign: TextAlign.center, style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 25),),
                            ),
                          ),
                          AnimatedDefaultTextStyle(
                            style: GoogleFonts.poppins(color: Colors.black, fontSize: _fontSize),
                            duration:Duration(milliseconds: 400),
                            child: Text('${metin10.toString()}' , textAlign: TextAlign.justify,  ),),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: TextButton(onPressed: () {
                              _launchUrl(_link2.toString());
                            },
                                child: Center(child: Text('Saytda bax' ,style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300, color: Colors.blue ),))),
                          )
                        ],
                      ),
                    )),



                //3

              ],
            ),
          ),
        ) : Center(child: CircularProgressIndicator(),)
    );



  }
}
