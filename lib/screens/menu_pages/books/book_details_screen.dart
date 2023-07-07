import 'dart:io';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:file_support/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../constants.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:path_provider/path_provider.dart';
import 'package:file_support/file_support.dart';

class BookDetailsScreen extends StatefulWidget {
  String hero;
  String image;
  String orederLink;
  String linkDownload;
  String bookName;
  String author;
  String description;
  String price;

  BookDetailsScreen(this.image, this.orederLink, this.linkDownload, this.bookName, this.author, this.description, this.hero, this.price);

  @override
  State<BookDetailsScreen> createState() => _BookDetailsScreenState();
}

class _BookDetailsScreenState extends State<BookDetailsScreen> {
  void _launchUrl(String patha) async {
    if (!await launch(Uri.parse(patha).toString(), forceSafariVC: true, forceWebView: false )) throw 'Could not launch $patha';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        scrolledUnderElevation: 3,
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        backgroundColor: appBarColor,
        title: Text("Kitab haqqında məlumat", style: GoogleFonts.arimaMadurai(color: Colors.white, fontWeight: FontWeight.bold, ),),

      ),
      body: Center(
        child: ListView(
          children: [
            Animate(
              effects: [FadeEffect()],
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40),),
                  gradient: LinearGradient(colors: [Colors.cyan, Colors.green]),
                    color: Colors.red.shade300),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround ,
                    children: [
                      Hero(tag: widget.hero,
                      child: FadeInImage(
                          height: 150,
                          placeholder: AssetImage("assets/open-book.png"),
                          image: NetworkImage(widget.image, )
                      ),),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 30,),
                          SizedBox(
                              width: 200,
                              child: Text(widget.bookName, textAlign: TextAlign.center, style: GoogleFonts.arimaMadurai(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),)),
                          Text(widget.author, textAlign: TextAlign.center, style: GoogleFonts.arimaMadurai(fontSize: 17),),
                          SizedBox(height: 20,),
                          Container(
                            height: 40,
                            width: 130,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                shape: BoxShape.rectangle,
                                color: Colors.red,
                                boxShadow: [BoxShadow(blurStyle: BlurStyle.solid, blurRadius: .4)]
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                              child: FittedBox(child: Text("${widget.price} AZN", textAlign: TextAlign.center, style: GoogleFonts.alata(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),)),
                            ),
                          ),
                          SizedBox(height: 50,),
                          Container(
                            height: 40,
                            width: 130,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                shape: BoxShape.rectangle,
                                color: Colors.green.shade200,
                                boxShadow: [BoxShadow(blurStyle: BlurStyle.solid, blurRadius: .4)]
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                              child: InkWell(
                                onTap: (){
                                  _launchUrl("https://form.jotform.com/200363853004445");
                                },
                                child: FittedBox(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Sifariş et", textAlign: TextAlign.center, style: GoogleFonts.alata(fontSize: 20, fontWeight: FontWeight.w500),),
                                      Icon(Icons.shopping_cart_outlined),

                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10,),
                          InkWell(
                            onTap: ()async {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    shape: StadiumBorder(),
                                    backgroundColor: appBarColor.shade100,
                                    behavior: SnackBarBehavior.floating,
                                    content: Text("Yüklənir...", style: GoogleFonts.alata(fontWeight: FontWeight.bold, color: Colors.black),),
                                  ));

                              File? file = await FileSupport().downloadFileInDownloadFolderAndroid(
                                  url: widget.linkDownload,
                                  filename: widget.bookName, extension: ".pdf",progress: (p){
                              });
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    showCloseIcon: true,
                                    shape: StadiumBorder(),
                                    backgroundColor: appBarColor.shade100,
                                    behavior: SnackBarBehavior.floating,
                                    content: Text("Yüklənmə bitdi", style: GoogleFonts.alata(fontWeight: FontWeight.bold, color: Colors.black),),

                                  ));

                            },
                            child: Container(
                              height: 40,
                              width: 130,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  shape: BoxShape.rectangle,
                                  color: Colors.red.shade200,
                                  boxShadow: [BoxShadow(blurStyle: BlurStyle.solid, blurRadius: .4)]
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                                child: FittedBox(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Yüklə", textAlign: TextAlign.center, style: GoogleFonts.alata(fontSize: 20, fontWeight: FontWeight.w500),),
                                      Icon(Icons.download),

                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text("Kitab sifarişi", style: GoogleFonts.alata(fontSize: 20, color: appBarColor, fontWeight: FontWeight.bold), textAlign: TextAlign.justify, ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  decoration: BoxDecoration(
                      boxShadow: [BoxShadow(blurRadius: 1)],
                      borderRadius: BorderRadius.circular(20),
                      color: appBarColor.shade100
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        ListTile(
                          leading: Icon(Icons.shopping_cart_outlined, color: Colors.green),
                          title: Text("Sifariş xətti", style: GoogleFonts.alata(),),
                          subtitle: Text("+994 55 233 70 70", style: GoogleFonts.alata(),),
                        ),
                        ListTile(
                          leading: Icon(Icons.check, color: Colors.green),
                          title: Text("Çatdırılma 1 gün ərzində", style: GoogleFonts.alata(),),

                        ),
                        ListTile(
                          leading: Icon(Icons.check, color: Colors.green,),
                          title: Text("Yerindəcə ödəmə", style: GoogleFonts.alata(),),
                        ),
                        ListTile(
                          leading: Icon(Icons.check, color: Colors.green),
                          title: Text("Online Sifariş", style: GoogleFonts.alata(),),
                        ),
                      ],
                    ),
                  )
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text("Kitab haqqında", style: GoogleFonts.alata(fontSize: 20, color: appBarColor, fontWeight: FontWeight.bold), textAlign: TextAlign.justify, ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  decoration: BoxDecoration(
                      boxShadow: [BoxShadow(blurRadius: 1)],
                      borderRadius: BorderRadius.circular(20),
                      color: appBarColor.shade100
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(widget.description, style: GoogleFonts.alata(fontSize: 20), textAlign: TextAlign.justify, ),
                  )
              ),
            ),





            SizedBox(height: 50,)

          ],
        ),
      ),
    );
  }
}



