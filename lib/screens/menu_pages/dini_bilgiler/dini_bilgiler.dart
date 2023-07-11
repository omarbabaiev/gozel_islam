import 'dart:async';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gozel_islam/screens/homescreen/homescreen.dart';
import 'package:gozel_islam/screens/menu_pages/dini_bilgiler/reader.dart';
import 'package:html/parser.dart' as parser;
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';
import '../../../Constants.dart';
import 'dini_bilgiler2.dart';
import 'package:flutter_animate/flutter_animate.dart';

class DiniBilgiler1Page extends StatefulWidget {
  final Uri link;
  final String bashliq;
  const DiniBilgiler1Page(
      {super.key, required this.link, required this.bashliq});
  @override
  State<DiniBilgiler1Page> createState() => _DiniBilgiler1PageState();
}

class _DiniBilgiler1PageState extends State<DiniBilgiler1Page> {
  var papkaza;
  List<ReadFile> movzuAdi = [];
  Future<void> getData() async {
    var response = await http.get(widget.link);
    final body = response.body;
    final document = parser.parse(body);
    var res = document.getElementsByClassName("card2").forEach((element) async {
      // print("papka link ${element.children[0].children[0].children[1].children[0].attributes['href'].toString()}");

      setState(() {
        if (element.children[0].children[0].children[0].text != null) {
          movzuAdi.add(ReadFile(
              Icon(
                Icons.folder,
                color: Colors.tealAccent,
              ),
              element.children[0].children[0].children[0].text,
              true,
              element.children[0].children[0].children[0].children[0]
                  .attributes['href']
                  .toString()));
        }
        if (element.children[0].children[0].children[1].text != null) {
          movzuAdi.add(ReadFile(
              Icon(Icons.folder, color: Colors.tealAccent),
              element.children[0].children[0].children[1].text,
              true,
              element.children[0].children[0].children[1].children[0]
                  .attributes['href']
                  .toString()));
        }

        if (element.children[1].children[0].children[0].text != null) {
          movzuAdi.add(ReadFile(
              Icon(Icons.folder, color: Colors.tealAccent),
              element.children[1].children[0].children[0].text,
              true,
              element.children[1].children[0].children[0].children[0]
                  .attributes['href']
                  .toString()));
        }
        if (element.children[2].children[0].children[1].text != null) {
          movzuAdi.add(ReadFile(
              Icon(Icons.folder, color: Colors.tealAccent),
              element.children[2].children[0].children[1].text,
              true,
              element.children[2].children[0].children[1].children[0]
                  .attributes['href']
                  .toString()));
        }

        if (element.children[3].children[0].children[0].text != null) {
          movzuAdi.add(ReadFile(
              Icon(Icons.folder, color: Colors.tealAccent),
              element.children[3].children[0].children[0].text,
              true,
              element.children[3].children[0].children[0].children[0]
                  .attributes['href']
                  .toString()));
        }
        if (element.children[4].children[0].children[1].text != null) {
          movzuAdi.add(ReadFile(
              Icon(Icons.folder, color: Colors.tealAccent),
              element.children[4].children[0].children[1].text,
              true,
              element.children[4].children[0].children[1].children[0]
                  .attributes['href']
                  .toString()));
        }

        if (element.children[5].children[0].children[0].text != null) {
          movzuAdi.add(ReadFile(
              Icon(Icons.folder, color: Colors.tealAccent),
              element.children[5].children[0].children[0].text,
              true,
              element.children[5].children[0].children[0].children[0]
                  .attributes['href']
                  .toString()));
        }
        if (element.children[6].children[0].children[1].text != null) {
          movzuAdi.add(ReadFile(
              Icon(Icons.folder, color: Colors.tealAccent),
              element.children[6].children[0].children[1].text,
              true,
              element.children[6].children[0].children[1].children[0]
                  .attributes['href']
                  .toString()));
        }

        if (element.children[7].children[0].children[0].text != null) {
          movzuAdi.add(ReadFile(
              Icon(Icons.folder, color: Colors.tealAccent),
              element.children[7].children[0].children[0].text,
              true,
              element.children[7].children[0].children[0].children[0]
                  .attributes['href']
                  .toString()));
        }
        if (element.children[8].children[0].children[1].text != null) {
          movzuAdi.add(ReadFile(
              Icon(Icons.folder, color: Colors.tealAccent),
              element.children[8].children[0].children[1].text,
              true,
              element.children[8].children[0].children[1].children[0]
                  .attributes['href']
                  .toString()));
        }

        if (element.children[9].children[0].children[0].text != null) {
          movzuAdi.add(ReadFile(
              Icon(Icons.folder, color: Colors.tealAccent),
              element.children[9].children[0].children[0].text,
              true,
              element.children[9].children[0].children[0].children[0]
                  .attributes['href']
                  .toString()));
        }
        if (element.children[10].children[0].children[1].text != null) {
          movzuAdi.add(ReadFile(
              Icon(Icons.folder, color: Colors.tealAccent),
              element.children[10].children[0].children[1].text,
              true,
              element.children[10].children[0].children[1].children[0]
                  .attributes['href']
                  .toString()));
        }

        if (element.children[11].children[0].children[0].text != null) {
          movzuAdi.add(ReadFile(
              Icon(Icons.folder, color: Colors.tealAccent),
              element.children[11].children[0].children[0].text,
              true,
              element.children[11].children[0].children[0].children[0]
                  .attributes['href']
                  .toString()));
        }
        if (element.children[12].children[0].children[1].text != null) {
          movzuAdi.add(ReadFile(
              Icon(Icons.folder, color: Colors.tealAccent),
              element.children[12].children[0].children[1].text,
              true,
              element.children[12].children[0].children[1].children[0]
                  .attributes['href']
                  .toString()));
        }

        if (element.children[13].children[0].children[0].text != null) {
          movzuAdi.add(ReadFile(
              Icon(Icons.folder, color: Colors.tealAccent),
              element.children[13].children[0].children[0].text,
              true,
              element.children[13].children[0].children[0].children[0]
                  .attributes['href']
                  .toString()));
        }
        if (element.children[14].children[0].children[1].text != null) {
          movzuAdi.add(ReadFile(
              Icon(Icons.folder, color: Colors.tealAccent),
              element.children[14].children[0].children[1].text,
              true,
              element.children[14].children[0].children[1].children[0]
                  .attributes['href']
                  .toString()));
        }
      });
    });
    var res1 = document.getElementsByClassName("optionshort2").forEach((element) async {
      print(
          "file${element.children[0].children[1].attributes['href'].toString()}");
      print(element.text.toString());

      setState(() {
        movzuAdi.add(ReadFile(
            Icon(
              Icons.text_snippet_outlined, color: Colors.red.shade100,
            ),
            element.text.toString().substring(4),
            false,
            element.children[0].children[1].attributes['href'].toString()));
      });
    });


  }

  Future<void> waitOne3Seconds() async {
    await getData();
    var timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {});
    });
  }

  @override
  void initState() {
    waitOne3Seconds();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _w = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        scrolledUnderElevation: 3,
        centerTitle: true,
        backgroundColor: appBarColor,
        title: Text(widget.bashliq, style: GoogleFonts.arimaMadurai(color: Colors.white, fontWeight: FontWeight.bold, ),),
      ),
      body: movzuAdi.isNotEmpty
          ? Animate(
        effects: [FadeEffect(duration: Duration(milliseconds: 300))],
        child: Scrollbar(
            child: ListView.separated(
              padding:
              EdgeInsets.symmetric(horizontal: _w / 30, vertical: 100),
              physics: BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              itemCount: movzuAdi.length,
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
                        leading: movzuAdi[index].icon,
                        onTap: () {
                          movzuAdi[index].metod == true
                              ? Navigator.push(context, CupertinoPageRoute(builder: (context)=>DiniBilgiler2Page(Uri.parse(movzuAdi[index].link), movzuAdi[index].name)))
                              :                          Navigator.push(context, CupertinoPageRoute(builder: (context) => DiniReader(url: Uri.parse(movzuAdi[index].link),)));                      },
                        title: Text(movzuAdi[index].name, maxLines: 1, overflow: TextOverflow.ellipsis,  style: GoogleFonts.alata(color: Colors.white)),
                        trailing: Icon(Icons.arrow_right_sharp),


                      ),
                    ),
                  ),
                );
              }, separatorBuilder: (BuildContext context, int index) {
                return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Divider(),
            ); },)),
          )
          : Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

class ReadFile {
  final Icon icon;
  final String name;
  final bool metod;
  final String link;
  ReadFile(
      this.icon,
      this.name,
      this.metod,
      this.link,
      );
}
