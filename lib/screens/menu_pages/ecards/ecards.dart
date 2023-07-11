import 'dart:io';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter/material.dart';
import 'package:html/parser.dart' as parser;
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:path_provider/path_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../Constants.dart';


class EcardsScreen extends StatefulWidget {
  @override
  State<EcardsScreen> createState() => _EcardsScreenState();
}

class _EcardsScreenState extends State<EcardsScreen> with TickerProviderStateMixin{

  late String imageData;

  late bool dataLoaded;


  var _url = Uri.parse("https://www.gozelislam.com/e-kart/");


  var image = [];
  var isBtn2 = false;
  Future<Null> saveAndShare(String zor, int index) async {
    setState(() {
      isBtn2 = true;
    });
    final RenderObject? box = context.findRenderObject();
    if (Platform.isAndroid) {
      var response = await get(Uri.parse("https://www.gozelislam.com${zor}"));
      final documentDirectory = (await getExternalStorageDirectory())?.path;
      File imgFile = new File('$documentDirectory/gozelislam${index}.jpg');
       imgFile.writeAsBytesSync(response.bodyBytes);
      Share.shareFiles(['$documentDirectory/gozelislam${index}.jpg'],
          subject: 'https://www.gozelislam.com/',
          text: 'Gözəl İslam - Dini Mövzular, Söhbətlər və Sual-Cavab https://www.gozelislam.com/');
    } else {
      Share.share("https://www.gozelislam.com/",
        subject: 'https://www.gozelislam.com/', );

    }
    setState(() {
      isBtn2 = false;
    });
  }
  var client = http.Client();
  Future<List> _getData()async{
    var response = await client.get(_url);
    final body = response.body;
    final document = parser.parse(body);
    var res = document.getElementsByClassName("short-story10").forEach((element)async {

      setState((){
        image.add(
            element.children[0].children[0].attributes["src"].toString()
        );
      });
    });
    return image;

  }

  //you can save video files too.


  @override
  void initState() {
    _getData();
    // TODO: implement initState
    super.initState();
  }
  @override
  void dispose() {
   client.close();
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
        appBar:AppBar(
          scrolledUnderElevation: 3,
          centerTitle: true,
          backgroundColor: appBarColor,
          title: Text("E-kart", style: GoogleFonts.arimaMadurai(color: Colors.white, fontWeight: FontWeight.bold, ),),

        ),

      body: image.isEmpty ? Center(child: CircularProgressIndicator(),) : FutureBuilder(
        future: _getData(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          return Stack(
            children: [
              Scrollbar(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.builder(
                    itemCount: snapshot.data.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        crossAxisCount: 2),
                    itemBuilder: (BuildContext context, int index) {
                      return Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      InkWell(
                                        onTap:(){ _showSecondPage(context, index, "hero${index}", "hero2${index}", "https://www.gozelislam.com${snapshot.data[index]}" );},
                                        child: Hero(
                                            tag: "hero${index}",
                                            child: FadeInImage(
                                        placeholder: AssetImage("assets/logi.png", ),
                                        image: NetworkImage("https://www.gozelislam.com${snapshot.data[index]}"),
                                        imageErrorBuilder: (ctx, exception, stackTrace) {
                                        return Container(); //THE WIDGET YOU WANT TO SHOW IF URL NOT RETURN IMAGE
                                         },
                                          )
                                           ),
                                      ),

                                      Align(
                                        alignment: Alignment.bottomCenter,
                                        child: FractionallySizedBox(
                                          heightFactor: .20,
                                          widthFactor: 1,
                                          child: Container(
                                            child:    Align(
                                              alignment: Alignment.topRight,
                                              child: Center(
                                                child: FittedBox(
                                                  child: Hero(
                                                    tag: "hero2${index}",
                                                    child: ElevatedButton(
                                                        style: ElevatedButton.styleFrom(
                                                            shadowColor: Colors.transparent,
                                                            backgroundColor: Colors.transparent,
                                                            elevation: 0
                                                        ),

                                                        onPressed: (){
                                                          saveAndShare(image[index], index);
                                                        }, child: Icon(Icons.share, size: 35,color: Colors.white,)),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            decoration: BoxDecoration(
                                                color: Colors.red.withOpacity(.4),
                                                borderRadius: BorderRadius.circular(5)
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                    },

                  ),
                ),
              ),
              isBtn2 == false ? SizedBox()  : Center(child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.red.withOpacity(0.6),
                  child: Center(child: CircularProgressIndicator(color: Colors.white,)))
              )
            ],
          );
        },),

    );

  }

  void _showSecondPage(BuildContext context, int index, String hero, String hero2, String link ){
    Navigator.of(context).push(
        CupertinoPageRoute(builder:
            (context)=>Scaffold(
              appBar:AppBar(
                actions: [
                  Hero(
                    tag: hero2,
                    child: IconButton(
                      style: IconButton.styleFrom(
                          shadowColor: Colors.transparent,
                          backgroundColor: Colors.transparent,
                          elevation: 0),
                        onPressed: (){
                          saveAndShare(image[index], index);
                        }, icon: Icon(Icons.share, )),
                  )
                ],
                scrolledUnderElevation: 3,
                centerTitle: true,
                backgroundColor: appBarColor,
                title: Text("E-kart", style: GoogleFonts.arimaMadurai(color: Colors.white, fontWeight: FontWeight.bold, ),),

              ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Hero(
                tag: hero, child: Image.network(link),
              ),
            ),
          ),
        )
        )
    );
  }
}



















































