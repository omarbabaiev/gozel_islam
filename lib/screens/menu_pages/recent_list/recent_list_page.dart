import 'dart:ui';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gozel_islam/screens/menu_pages/dini_bilgiler/all_topics.dart';
import 'package:gozel_islam/screens/menu_pages/recent_list/recent_reader.dart';
import 'package:html/parser.dart' as parser;
import 'package:http/http.dart' as http;

import '../../../Constants.dart';





class RecentListPage extends StatefulWidget {
  @override
  State<RecentListPage> createState() => _RecentListPageState();
}
class _RecentListPageState extends State<RecentListPage> {
  GetStorage box = GetStorage();
  late List listHeader;
  late List listText;

  @override
  void initState() {
    listHeader = box.read("headerList")??[];
    listText = box.read("textList")??[];

    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var _w = MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: appBarColor.shade200,
        label: Row(
          children: [
            Icon(Icons.add, color: Colors.white,),
            Text("ƏLAVƏ ET", style: TextStyle( color: Colors.white, fontWeight: FontWeight.bold),),
          ],
        ) ,
        onPressed: () {
          Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context)=>DiniBilgilerPage()));
        },
      ),
      extendBodyBehindAppBar: true,
      appBar:AppBar(
        scrolledUnderElevation: 3,
        centerTitle: true,
        backgroundColor: appBarColor,
        title: Text("Sonra oxunacaqlar", style: GoogleFonts.arimaMadurai(color: Colors.white, fontWeight: FontWeight.bold, ),),

      ),
      body:   Animate(
        effects: [FadeEffect(duration: Duration(milliseconds: 300))],
        child: listHeader.length == 0 ? Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.info_outline, size: 40, color: appBarColor.shade200,),
              Text("Mövzu tapılmadı", maxLines: 1, overflow: TextOverflow.ellipsis,
                style: GoogleFonts.alatsi(fontSize: 26)),
            ],
          ),
        )

            :  Scrollbar(
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal:_w / 30, vertical: 100),
              itemCount: listHeader.length,
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
                          Navigator.push(context, CupertinoPageRoute(builder: (context)=>RecentReader(listHeader[index], listText[index])));
                        },
                        leading: Icon(  Icons.text_snippet_outlined, color: Colors.red.shade100,),
                        title: Text(listHeader[index], maxLines: 1, overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.alata(color: Colors.white,
                              fontWeight: FontWeight.bold),),
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
      ),
    );

  }
}






