import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gozel_islam/screens/menu_pages/dini_bilgiler/reader.dart';
import 'package:html/parser.dart' as parser;
import 'package:http/http.dart' as http;

import '../../../Constants.dart';
import '../../menu_pages/dini_bilgiler/dini_bilgiler.dart';





class ElaveMovzular extends StatefulWidget {
  @override
  State<ElaveMovzular> createState() => _ElaveMovzularState();
}

class _ElaveMovzularState extends State<ElaveMovzular> {
  var prayerTime;
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



    var resUpdatedTopics = document.getElementsByClassName("blog-sidebar").forEach((element)async {

      var papka, papka1, papka2, papka3, papka4, papka5, papka6, papka7;
      var link, link1, link2, link3, link4, link5, link6, link7;

      // link5 = element.children[0].children[5].children[0].attributes['href'].toString();
      // link6 = element.children[0].children[6].children[0].attributes['href'].toString();
      // link7 = element.children[0].children[7].children[0].attributes['href'].toString();

      setState(() {
        papka = element.children[1].children[3].text.toString();
        papka1 = element.children[1].children[5].text.toString();
        papka2 = element.children[1].children[7].text.toString();
        papka3 = element.children[1].children[9].text.toString();
        papka4 = element.children[1].children[11].text.toString();
        // papka5 = element.children[0].children[5].text.toString();
        // papka6 = element.children[0].children[6].text.toString();
        // papka7 = element.children[0].children[7].text.toString();

        link = element.children[1].children[3].children[0].attributes['href'].toString();
        link1 = element.children[1].children[5].children[0].attributes['href'].toString();
        link2 = element.children[1].children[7].children[0].attributes['href'].toString();
        link3 = element.children[1].children[9].children[0].attributes['href'].toString();
        link4 = element.children[1].children[11].children[0].attributes['href'].toString();
        movzuAdiYenilenen = [papka, papka1, papka2, papka3, papka4 ];
        // movzuAdiYenilenen.add(papka5);
        // movzuAdiYenilenen.add(papka6);
        // movzuAdiYenilenen.add(papka7);
        linkMovzuYenilenen = [link, link1, link2, link3, link4];

        // linkMovzuYenilenen.add(link5);
        // linkMovzuYenilenen.add(link6);
        // linkMovzuYenilenen.add(link7);
      });
    });
    print(movzuAdiYenilenen);

  }

  @override
  void initState() {
    getTextData();
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
        title: Text("Ən son əlavə olunanlar", style: GoogleFonts.arimaMadurai(color: Colors.white, fontWeight: FontWeight.bold, ),),

      ),
      body: movzuAdiYenilenen.isNotEmpty ?  Animate(
        effects: [FadeEffect(duration: Duration(milliseconds: 300))],
        child: Scrollbar(
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal:_w / 30, vertical: 100),
              physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
              itemCount: movzuAdiYenilenen.length ,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(4.0),
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
                          Navigator.push(context, CupertinoPageRoute(builder: (context) => DiniReader(url: Uri.parse(linkMovzuYenilenen[index]), )));
                        },
                        leading: Icon(Icons.topic_outlined, color: Colors.red.shade100),
                        title: Text("${movzuAdiYenilenen[index]}\n", style: GoogleFonts.alata(color: Colors.white)),
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






