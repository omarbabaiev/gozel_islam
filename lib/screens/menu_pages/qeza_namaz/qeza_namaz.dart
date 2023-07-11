import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:get_storage/get_storage.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../Constants.dart';
import 'package:flutter_animate/flutter_animate.dart';
class QezaNamaz extends StatefulWidget {
  const QezaNamaz({Key? key}) : super(key: key);

  @override
  State<QezaNamaz> createState() => _QezaNamazState();
}

class _QezaNamazState extends State<QezaNamaz> {
  GetStorage box = GetStorage();
  var currentDay = 0;
  var currentMonth = 0;
  var currentYear = 0;
  late bool show;
  int? _year;
  var subh, zohr, asr, sam, yatsi, vitr, oruc;
  @override
  void initState() {
    show =  box.read("showQeza")??true;
    subh = box.read("subhQeza")??0;
    zohr = box.read("zohrQeza")??0;
    asr = box.read("asrQeza")??0;
    sam = box.read("samQeza")??0;
    yatsi = box.read("yatsiQeza")??0;
    vitr = box.read("vitrQeza")??0;
    oruc = box.read("orucQeza")??0;

    // TODO: implement initState
    super.initState();
  }
  @override
  void dispose() {
    box.write("subhQeza", subh);
    box.write("zohrQeza", zohr);
    box.write("asrQeza", asr);
    box.write("samQeza", sam);
    box.write("yatsiQeza", yatsi);
    box.write("vitrQeza", vitr);
    box.write("orucQeza", oruc);
    box.write("showQeza", show);

    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: show ? FloatingActionButton.extended(
        label: Text("HESABLA", style: GoogleFonts.alata(fontWeight: FontWeight.bold),),
        onPressed: () {
          setState(() {
            show = false;
            box.write("showQeza", false);
            _year = (currentYear * 365 + currentMonth * 30 + currentDay);
            subh = (_year);
            zohr = (_year);
            asr = (_year);
            sam = (_year);
            yatsi = (_year);
            vitr = (_year);
            oruc = (currentYear);
            box.write("subhQeza", subh);
            box.write("zohrQeza", zohr);
            box.write("asrQeza", asr);
            box.write("samQeza", sam);
            box.write("yatsiQeza", yatsi);
            box.write("vitrQeza", vitr);
            box.write("orucQeza", oruc);
          });
          print(_year);
        }) : SizedBox(),
      appBar: AppBar(

        scrolledUnderElevation: 3,
        centerTitle: true,
        backgroundColor: appBarColor,
        title: Text("Qəza hesablama", style: GoogleFonts.arimaMadurai(color: Colors.white, fontWeight: FontWeight.bold, ),),
      ),
      body: show ? Dialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 10,),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Gün", style: GoogleFonts.alata(fontSize: 30, color: Colors.red),),
                      NumberPicker(
                        textStyle: GoogleFonts.aldrich(),
                        selectedTextStyle: GoogleFonts.aldrich(fontWeight: FontWeight.bold, fontSize: 30),
                        value: currentDay,
                        minValue: 0,
                        maxValue: 365,
                        onChanged: (value){
                          print(currentDay);
                          setState(() => currentDay = value);},
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Ay", style: GoogleFonts.alata(fontSize: 30, color: Colors.red),),
                      NumberPicker(
                        textStyle: GoogleFonts.aldrich(),
                        selectedTextStyle: GoogleFonts.aldrich(fontWeight: FontWeight.bold, fontSize: 30),
                        value: currentMonth,
                        minValue: 0,
                        maxValue: 12,
                        onChanged: (value){
                          print(currentMonth);
                          setState(() => currentMonth = value);}, ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("İl", style: GoogleFonts.alata(fontSize: 30, color: Colors.red),),
                      NumberPicker(
                        textStyle: GoogleFonts.aldrich(),
                        selectedTextStyle: GoogleFonts.aldrich(fontWeight: FontWeight.bold, fontSize: 30),
                        value: currentYear,
                        minValue: 0,
                        maxValue: 100,
                        onChanged: (value){
                          print(currentYear);
                          setState(() => currentYear = value);},                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ) :


      Animate(
        effects: [
          FadeEffect()
        ],
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [


                  Padding(
                      padding: EdgeInsets.all(10),
                      child: Container(
                          decoration: BoxDecoration(
                            color: appBarColor.shade200,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.blue.withOpacity(.2),
                                blurRadius: 30,
                                offset: Offset(10, 10),
                              ),
                            ],
                            borderRadius: BorderRadius.circular(20),
                          ),


                          child: ListTile(

                            title:
                            Text( "Sübh Namazı", maxLines: 1, style: GoogleFonts.arimaMadurai(),),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:[
                                IconButton(icon: Icon(Icons.remove,), onPressed: () {
                                  setState(() {
                                    subh--;

                                  });
                                },),
                                SizedBox(width: 10,),
                                AnimatedFlipCounter(textStyle: GoogleFonts.aldrich(fontSize: 20) , value: subh),

                                SizedBox(width: 10,),

                                IconButton(icon: Icon(Icons.add), onPressed: (){
                                  setState(() {
                                    subh++;

                                  });
                                },),
                              ],
                            ),

                          ))),
                  Padding(
                      padding: EdgeInsets.all(10),
                      child: Container(
                          decoration: BoxDecoration(
                            color: appBarColor.shade200,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.blue.withOpacity(.2),
                                blurRadius: 30,
                                offset: Offset(10, 10),
                              ),
                            ],
                            borderRadius: BorderRadius.circular(20),
                          ),


                          child: ListTile(

                            title:
                            Text( "Zöhr Namazı", maxLines: 1, style: GoogleFonts.arimaMadurai(),),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:[
                                IconButton(icon: Icon(Icons.remove,), onPressed: () {
                                  setState(() {
                                    zohr--;

                                  });
                                },),
                                SizedBox(width: 10,),
                                AnimatedFlipCounter(textStyle: GoogleFonts.aldrich(fontSize: 20) , value: zohr),

                                SizedBox(width: 10,),

                                IconButton(icon: Icon(Icons.add,), onPressed: (){
                                  setState(() {
                                    zohr++;

                                  });
                                },),
                              ],
                            ),

                          ))),
                  Padding(
                      padding: EdgeInsets.all(10),
                      child: Container(
                          decoration: BoxDecoration(
                            color: appBarColor.shade200,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.blue.withOpacity(.2),
                                blurRadius: 30,
                                offset: Offset(10, 10),
                              ),
                            ],
                            borderRadius: BorderRadius.circular(20),
                          ),


                          child: ListTile(

                            title:
                            Text( "Əsr Namazı", maxLines: 1, style: GoogleFonts.arimaMadurai(),),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:[
                                IconButton(icon: Icon(Icons.remove,), onPressed: () {
                                  setState(() {
                                    asr--;

                                  });
                                },),
                                SizedBox(width: 10,),
                                AnimatedFlipCounter(textStyle: GoogleFonts.aldrich(fontSize: 20) , value: asr),

                                SizedBox(width: 10,),

                                IconButton(icon: Icon(Icons.add,), onPressed: (){
                                  setState(() {
                                    asr++;

                                  });
                                },),
                              ],
                            ),

                          ))),
                  Padding(
                      padding: EdgeInsets.all(10),
                      child: Container(
                          decoration: BoxDecoration(
                            color: appBarColor.shade200,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.blue.withOpacity(.2),
                                blurRadius: 30,
                                offset: Offset(10, 10),
                              ),
                            ],
                            borderRadius: BorderRadius.circular(20),
                          ),


                          child: ListTile(

                            title:
                            Text( "Axşam Namazı", maxLines: 1, style: GoogleFonts.arimaMadurai(),),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:[
                                IconButton(icon: Icon(Icons.remove,), onPressed: () {
                                  setState(() {
                                    sam--;

                                  });
                                },),
                                SizedBox(width: 10,),
                                AnimatedFlipCounter(textStyle: GoogleFonts.aldrich(fontSize: 20) , value: sam),

                                SizedBox(width: 10,),

                                IconButton(icon: Icon(Icons.add, ), onPressed: (){
                                  setState(() {
                                    sam++;

                                  });
                                },),
                              ],
                            ),

                          ))),
                  Padding(
                      padding: EdgeInsets.all(10),
                      child: Container(
                          decoration: BoxDecoration(
                            color: appBarColor.shade200,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.blue.withOpacity(.2),
                                blurRadius: 30,
                                offset: Offset(10, 10),
                              ),
                            ],
                            borderRadius: BorderRadius.circular(20),
                          ),


                          child: ListTile(

                            title:
                            Text( "İşa Namazı", maxLines: 1, style: GoogleFonts.arimaMadurai(),),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:[
                                IconButton(icon: Icon(Icons.remove, ), onPressed: () {
                                  setState(() {
                                    yatsi--;

                                  });
                                },),
                                SizedBox(width: 10,),
                                AnimatedFlipCounter(textStyle: GoogleFonts.aldrich(fontSize: 20) , value: yatsi),

                                SizedBox(width: 10,),

                                IconButton(icon: Icon(Icons.add, ), onPressed: (){
                                  setState(() {
                                    yatsi++;
                                  });

                                },),
                              ],
                            ),

                          ))),
                  Padding(
                      padding: EdgeInsets.all(10),
                      child: Container(
                          decoration: BoxDecoration(
                            color: appBarColor.shade200,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.blue.withOpacity(.2),
                                blurRadius: 30,
                                offset: Offset(10, 10),
                              ),
                            ],
                            borderRadius: BorderRadius.circular(20),
                          ),


                          child: ListTile(

                            title:
                            Text( "Vitr Namazı", maxLines: 1, style: GoogleFonts.arimaMadurai()),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:[
                                IconButton(icon: Icon(Icons.remove, ), onPressed: () {
                                  setState(() {
                                    vitr--;

                                  });
                                },),
                                SizedBox(width: 10,),
                                AnimatedFlipCounter(textStyle: GoogleFonts.aldrich(fontSize: 20) , value: vitr),

                                SizedBox(width: 10,),

                                IconButton(icon: Icon(Icons.add, ), onPressed: (){
                                  setState(() {
                                    vitr++;

                                  });
                                },),
                              ],
                            ),

                          ))),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Divider(
                      thickness: 1,
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.inversePrimary,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.blue.withOpacity(.2),
                              blurRadius: 30,
                              offset: Offset(10, 10),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(20),
                        ),


                        child: ListTile(

                          title:
                          Text( "Oruc", maxLines: 1, style: GoogleFonts.arimaMadurai()),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:[
                              IconButton(icon: Icon(Icons.remove, ), onPressed: () {
                                setState(() {
                                  oruc--;
                                });

                              },),
                              SizedBox(width: 10,),
                              AnimatedFlipCounter(textStyle: GoogleFonts.aldrich(fontSize: 20) , value: oruc),

                              SizedBox(width: 10,),

                              IconButton(icon: Icon(Icons.add, ), onPressed: (){
                                setState(() {
                                  oruc++;

                                });
                              },),
                            ],
                          ),

                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Text("* Qeyd: Hesablama zamanı 1 il ortalama 365 gün, Ramazan ayı 30 gün olduğu nəzərə alınır",
                      style: GoogleFonts.arimaMadurai( ),),
                  ),


                ],
              ),
            ),
          ),
        ),
      ),


    );
  }
}



