import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:lottie/lottie.dart';
import '../../../Constants.dart';
import 'edit_image.dart';
import 'image_model.dart';


class BackgroundScreen extends StatefulWidget {
  String text;

  BackgroundScreen(this.text);

  @override
  State<BackgroundScreen> createState() => _BackgroundScreenState();
}

class _BackgroundScreenState extends State<BackgroundScreen> {

var _api = "26288319-44b0e3d8845c3bd82f251f7a9&q";

Future<ImageModel>_fetchData()async{
  var response = await http.get(Uri.parse("https://pixabay.com/api/?key=${_api}=nature+background&image_type=photo&orientation=horizontal&colors=green&per_page=200"));
  var data = imageModelFromJson(response.body);
  return data;
}




  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        scrolledUnderElevation: 3,
        centerTitle: true,
        backgroundColor: appBarColor,
        title: Text("Arxa plan seç", style: GoogleFonts.arimaMadurai(color: Colors.white, fontWeight: FontWeight.bold, ),),

      ),


      body: Animate(
          effects: [FadeEffect(), ScaleEffect()],
          child: FutureBuilder(
            future: _fetchData(),
            builder: (BuildContext context, AsyncSnapshot<ImageModel> snapshot) {
               if(snapshot.connectionState == ConnectionState.waiting){
                 return Center(child: Lottie.asset("assets/progres.json", height: 100),);
               } else if(snapshot.connectionState == ConnectionState.done){
                 if(snapshot.hasData){
                   return  Scrollbar(
                     child: GridView.builder(
                         padding: EdgeInsets.only(bottom: 20, top: 100),
                         itemCount: snapshot.data!.hits.length,
                         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, childAspectRatio: 1.3),
                         itemBuilder: (context, index){
                           return Padding(
                               padding: const EdgeInsets.all(4.0),
                               child: InkWell(
                                   onTap: (){
                                     Navigator.of(context).push(CupertinoPageRoute(builder: (context)=>
                                         EditImage( snapshot.data!.hits[index].largeImageUrl, widget.text, "${index}", snapshot.data!.hits[index].imageHeight.toDouble(), snapshot.data!, snapshot.data!.hits[index].imageSize, index)));
                                   },
                                   child: Hero(tag: "${index}",
                                   child: Container(
                                     height: 200,
                                     child: ClipRRect(
                                       borderRadius: BorderRadius.circular(10),
                                       child: CachedNetworkImage(
                                         fit: BoxFit.fill,
                                         placeholder: (context, String){
                                           return Opacity(
                                             opacity: .2,
                                             child: ClipRRect(
                                                 borderRadius: BorderRadius.circular(15),
                                                 child: Image.asset("assets/header.png", height: 60,)),
                                           );
                                       },
                                         imageUrl: snapshot.data!.hits[index].previewUrl,),
                                     ),
                                   )))
                           );
                         }),
                   );
                 }else{
                   Center(child: Text(snapshot.error.toString()),);
                 }
               }
               return Center(child: Text("sasa"),);
            },
          )
      ),
    );
  }
}



