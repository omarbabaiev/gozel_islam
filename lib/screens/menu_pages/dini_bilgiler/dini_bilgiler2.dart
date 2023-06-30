import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gozel_islam/screens/menu_pages/dini_bilgiler/reader.dart';
import 'package:html/parser.dart' as parser;
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';
import '../../../Constants.dart';
import 'package:flutter_animate/flutter_animate.dart';

class DiniBilgiler2Page extends StatefulWidget {
  final Uri url;
  final String bashliq;

  DiniBilgiler2Page(this.url, this.bashliq);

  @override
  State<DiniBilgiler2Page> createState() => _DiniBilgiler2PageState();
}

class _DiniBilgiler2PageState extends State<DiniBilgiler2Page> {



  var movzuAdi1 = [];
  var linkMovzu1 = [];


  Future<void>getData(Uri text)async{
    var papka;
    var link;


    var response = await http.get(text);
    final body = response.body;
    final document = parser.parse(body);
    var res1 = document.getElementsByClassName("optionshort2").forEach
      ((element)async {
      papka = element.text.toString();
      link = element.children[0].children[1].attributes['href'].toString();


      setState(() {
        movzuAdi1.add(papka);

        linkMovzu1.add(link);

      });






    });

  }


  @override
  void initState() {
    getData(widget.url);

    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var _w = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar:  AppBar(
        scrolledUnderElevation: 3,
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        backgroundColor: appBarColor,
        title: Text(widget.bashliq, style: GoogleFonts.arimaMadurai(color: Colors.white, fontWeight: FontWeight.bold, ),),
      ) ,
      body: movzuAdi1.isNotEmpty ? Animate(
        effects: [FadeEffect(duration: Duration(milliseconds: 300))],
        child: Scrollbar(
            child: ListView.separated(

              padding: EdgeInsets.symmetric(horizontal: _w / 30, vertical: 100),
              physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
              itemCount: movzuAdi1.length ,
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
                         Navigator.push(context, CupertinoPageRoute(builder: (context) => DiniReader(url: Uri.parse(linkMovzu1[index]),)));
                        },
                        leading: Icon(  Icons.text_snippet_outlined, color: Colors.red.shade100,),
                        title:
                        Text( movzuAdi1[index].toString().substring(4,), maxLines: 1, overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.alata(color: Colors.white,
                          fontWeight: FontWeight.bold),),
                        trailing: Icon(Icons.arrow_right_sharp),


                      ),
                    ),
                  ),
                );


                  Container(
                    decoration: BoxDecoration(
                      color: Theme
                          .of(context)
                          .errorColor,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blue.withOpacity(.2),
                          blurRadius: 30,
                          offset: Offset(20, 30),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(20),
                    ),


                    child: ListTile(
                      leading: Icon(Icons.text_snippet_outlined,),
                      title: Text(
                        movzuAdi1[index].toString().substring(4,), maxLines: 1,
                        style: TextStyle(overflow: TextOverflow.ellipsis,
                            fontWeight: FontWeight.bold),),
                      trailing:

                      Icon(Icons.chevron_right),

                      onTap: () {
                        // Navigator.push(context, SizeTransition2(DiniReader(url: Uri.parse(linkMovzu1[index],))));

                      },


                    ));
              }, separatorBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Divider(),
                );
            },)
        ),
      ) :  Center(child:CircularProgressIndicator(),),
    );
  }
}


