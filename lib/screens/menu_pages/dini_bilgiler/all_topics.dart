import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:html/parser.dart' as parser;
import 'package:http/http.dart' as http;

import '../../../Constants.dart';
import 'dini_bilgiler.dart';





class DiniBilgilerPage extends StatefulWidget {
  @override
  State<DiniBilgilerPage> createState() => _DiniBilgilerPageState();
}

class _DiniBilgilerPageState extends State<DiniBilgilerPage> {
  var _url = Uri.parse("https://www.gozelislam.com");
  var movzuAdi = [];
  var linkMovzu = [];
  Future<void>getData()async{
    var papka, papka1, papka2, papka3, papka4, papka5, papka6, papka7;
    var link, link1, link2, link3, link4, link5, link6, link7;
    var response = await http.get(_url);
    final body = response.body;
    final document = parser.parse(body);
    var res = document.getElementsByClassName("col-sm-4").forEach((element)async {
      papka = element.children[0].children[0].text.toString();
      papka1 = element.children[0].children[1].text.toString();
      papka2 = element.children[0].children[2].text.toString();
      papka3 = element.children[0].children[3].text.toString();
      papka4 = element.children[0].children[4].text.toString();
      papka5 = element.children[0].children[5].text.toString();
      papka6 = element.children[0].children[6].text.toString();
      papka7 = element.children[0].children[7].text.toString();

      link = element.children[0].children[0].children[0].attributes['href'].toString();
      link1 = element.children[0].children[1].children[0].attributes['href'].toString();
      link2 = element.children[0].children[2].children[0].attributes['href'].toString();
      link3 = element.children[0].children[3].children[0].attributes['href'].toString();
      link4 = element.children[0].children[4].children[0].attributes['href'].toString();
      link5 = element.children[0].children[5].children[0].attributes['href'].toString();
      link6 = element.children[0].children[6].children[0].attributes['href'].toString();
      link7 = element.children[0].children[7].children[0].attributes['href'].toString();

      setState(() {
        movzuAdi.add(papka);
        movzuAdi.add(papka1);
        movzuAdi.add(papka2);
        movzuAdi.add(papka3);
        movzuAdi.add(papka4);
        movzuAdi.add(papka5);
        movzuAdi.add(papka6);
        movzuAdi.add(papka7);
        linkMovzu.add(link);
        linkMovzu.add(link1);
        linkMovzu.add(link2);
        linkMovzu.add(link3);
        linkMovzu.add(link4);
        linkMovzu.add(link5);
        linkMovzu.add(link6);
        linkMovzu.add(link7);
      });
    });

  }

  @override
  void initState() {
    getData();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var _w = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar:AppBar(
        scrolledUnderElevation: 3,
        centerTitle: true,
        backgroundColor: appBarColor,
        title: Text("Dini Bilgilər", style: GoogleFonts.arimaMadurai(color: Colors.white, fontWeight: FontWeight.bold, ),),

      ),
      body: movzuAdi.isNotEmpty ?  Animate(
        effects: [FadeEffect(duration: Duration(milliseconds: 300))],
        child: Scrollbar(
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal:_w / 30, vertical: 100),
              physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
              itemCount: movzuAdi.length ,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: appBarColor.shade300,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.red.withOpacity(.2),
                          blurRadius: 10,
                          offset: Offset(10, 15),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(20),
                    ),


                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        onTap: () {
                          Navigator.push(context, CupertinoPageRoute(builder: (context) => DiniBilgiler1Page(link: Uri.parse(linkMovzu[index]), bashliq: movzuAdi[index],)));
                        },
                        leading: Icon(Icons.folder_sharp, color: Colors.tealAccent,),
                        title: Text(movzuAdi[index], style: GoogleFonts.alata(color: Colors.white)),
                        trailing: Icon(Icons.arrow_right_sharp),


                      ),
                    ),
                  ),
                );

              }, separatorBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Divider(),
                );
            }, ) ),
      ):  Center(child: CircularProgressIndicator(),),
    );

  }
}






