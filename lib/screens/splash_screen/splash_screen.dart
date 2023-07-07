

import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gozel_islam/Constants.dart';
import 'package:gozel_islam/screens/homescreen/homescreen.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;


class SplashScreen extends StatefulWidget {
@override
_SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
with TickerProviderStateMixin {
late AnimationController scaleController;
late Animation<double> scaleAnimation;

double _opacity = 0;
bool _value = true;
GetStorage box = GetStorage();

var currentTime;
var isSucces = false;

var url = Uri.parse(
    "https://prayer-time-ws.herokuapp.com/api/dates/json/1.0/allDataYearly?indexOfCity=1425");
var isIntroUpdated = false;

Future<void> getData() async {
  if (box.read("time") == null || (box.read("yearOfUpdate")!=DateTime.now().year)) {
    var response = await http.get(url);
    var json = response.body;
    var jsonData = jsonDecode(utf8.decode(json.runes.toList()).toString());
    print(response.statusCode);
    if (response.statusCode == 200) {
      currentTime = jsonData["data"];
      box.write("time", currentTime);
      box.write("yearOfUpdate", DateTime.now().year);
    }
  }
}
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
          .children[0].children[0].children[0].text
          .toString();
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
    await box.write("_bashliq3", element.children[0].text.toString());
    await  box.write("_metin3share",element.children[2].children[1].text.toString() );
    setState(() {
      _bashliq2 = box.read("_bashliq3");
      _metin2 = box.read("_metin3");
    });
  });
}
Future<void>getGets()async{
 await getMovzuDialog();
  getMovzuPage();
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
    box.write("_bashliq2", _bashliq2);
    box.write("_metin2share", element.children[0].children[0].children[1].text.toString());
    box.write("_link2",
        element.children[0].children[0].children[0].children[0]
            .attributes['href'].toString());
  });
  print(box.read("_link2"));
}


@override
void initState() {
super.initState();
getTextData();
getGets();
scaleController = AnimationController(
vsync: this,
duration: Duration(milliseconds: 600),
)..addStatusListener(
(status) {
if (status == AnimationStatus.completed) {
Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context)=>HomeScreen()));
Timer(
Duration(milliseconds: 300),
                     () {
                             scaleController.reset();
                                  },
                             );}},);

scaleAnimation =
Tween<double>(begin: 0.0, end: 12).animate(scaleController);

Timer(Duration(milliseconds: 600), () {
setState(() {
_opacity = 1.0;
_value = false;
});
});
Timer(Duration(milliseconds: 2000), () async{
  await getData();
  setState(() {
scaleController.forward();
});
});
}

@override
void dispose() {
// TODO: implement dispose
scaleController.dispose();
super.dispose();
}

@override
Widget build(BuildContext context) {
return Scaffold(

body: Stack(
children: [
Row(
mainAxisAlignment: MainAxisAlignment.spaceEvenly,
children: [
Padding(
padding: EdgeInsets.only(top: 80),
child: Text(
'www.gozelislam.com',
style: GoogleFonts.alata(fontSize: 30, )
),
),
],
),
Center(
child: AnimatedOpacity(
curve: Curves.fastLinearToSlowEaseIn,
duration: Duration(seconds: 6),
opacity: _opacity,
child: AnimatedContainer(
curve: Curves.fastLinearToSlowEaseIn,
duration: Duration(seconds: 2),
height: _value ? 50 : 200,
width: _value ? 50 : 200,
decoration: BoxDecoration(
boxShadow: [
BoxShadow(
color: appBarColor.withOpacity(.2),
blurRadius: 100,
spreadRadius: 10,
),
],
color: appBarColor,
borderRadius: BorderRadius.circular(20),
),
child: Center(
child: Image.asset("assets/logi.png"),),),),),],),);}}

class ThisIsFadeRoute extends PageRouteBuilder {
final Widget page;
final Widget route;

ThisIsFadeRoute({required this.page, required this.route})
    : super(
pageBuilder: (
BuildContext context,
Animation<double> animation,
Animation<double> secondaryAnimation,
) =>
page,
transitionsBuilder: (
BuildContext context,
Animation<double> animation,
Animation<double> secondaryAnimation,
Widget child,
) =>
FadeTransition(
opacity: animation,
),
);
}


