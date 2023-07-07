import 'dart:async';
import 'dart:convert';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:jiffy/jiffy.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../Constants.dart';

class SendEmail extends StatefulWidget {
  @override
  _SendEmailState createState() => _SendEmailState();
}

class _SendEmailState extends State<SendEmail> {



  GetStorage box = GetStorage();
  List<String>? attachment;
  var isTrue = false;
  var isSended = false;
  @override
  void initState() {
    isSended = box.read("${Jiffy.now().dateTime.month}" + "000" + "${Jiffy.now().dateTime.day}") ?? false;
    // TODO: implement initState
    super.initState();
    attachment= <String>[];
  }
  final _nameController = TextEditingController(

  );
  final _emailController = TextEditingController(

  );

  final _subjectController = TextEditingController();
  final _numberController = TextEditingController();

  final _bodyController = TextEditingController(

  );

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      key: _scaffoldKey,
      appBar:
      AppBar(
        leading: IconButton(onPressed: () {      Navigator.pop(context);
        }, icon: Icon(Icons.chevron_left, size: 30,),),
        scrolledUnderElevation: 3,
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        backgroundColor: appBarColor,
        title: Text('Sual Göndər', style: GoogleFonts.arimaMadurai(color: Colors.white, fontWeight: FontWeight.bold, ),),
        actions: <Widget>[

          IconButton(
            onPressed:()async{
         launch("mailto:gozelislam@hotmail.com?body="
             """Mən adım ${_nameController.text},

             Mənim sualımın cavabını bu ${_emailController.text} ünvanıma və ya ${_numberController.text} whatsapp nömrəmə göndərə bilərsiniz,

             ${_subjectController.text}

             ${_bodyController.text}""");

    }



             ,
            icon: Icon(Icons.send),
          )
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TextField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          // hintStyle: TextStyle(color: Constants.primaryColor),
                          hintText: "Adınız",
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),

                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TextField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          // hintStyle: TextStyle(color: Constants.primaryColor),
                          hintText: "E-mail adresi",
                          fillColor: Colors.white,
                          filled: true,
                          errorText: "* Bu xananı doldurmaq mütləqdir",
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),

                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TextField(
                        keyboardType: TextInputType.phone,
                        controller: _numberController,
                        decoration: InputDecoration(
                          // hintStyle: TextStyle(color: Constants.primaryColor),
                          hintText: "WhatsApp nömrəsi",
                          fillColor: Colors.white,
                          filled: true,
                          errorText: "* Bu xananı doldurmaq mütləqdir",
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),

                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TextField(
                        controller: _subjectController,
                        decoration: InputDecoration(
                          // hintStyle: TextStyle(color: Constants.primaryColor),
                          fillColor: Colors.white,
                          hintText: "Mövzu adı",
                          filled: true,
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TextField(
                        maxLines: 10,
                        controller: _bodyController,

                        decoration: InputDecoration(
                            hintText: "Sualınız",
                            fillColor: Colors.white,
                            filled: true,
                            // hintStyle: TextStyle(color: Constants.primaryColor),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
                      ),
                    ),
                    OutlinedButton(
    onPressed:()async{
    launch("mailto:gozelislam@hotmail.com?body="
    """Mən adım ${_nameController.text},

             Mənim sualımın cavabını bu ${_emailController.text} ünvanıma və ya ${_numberController.text} whatsapp nömrəmə göndərə bilərsiniz,

             ${_subjectController.text}

             ${_bodyController.text}""");

    }, child: Text("        GÖNDƏR        ")),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("* Dini sual soruşarkən sizdən aşağıdakı qaydalara riayət etməyiniz xahiş olunur:\n \n"
                          "1.Sual göndərməmişdən əvvəl o mövzu ilə bağlı məlumatı saytdan oxumaq (www.gozelislam.com).\n \n"
                          "2.Dolğun cavab almaq üçün sualı geniş şəkildə yazmaq.\n \n"
                          "3.Namaz vaxtı ilə bağlı sualların cavablarını www.namazvakti.com, www.namazvaxti.org saytından və ya bilgi@namazvakti.com elektron ünvana e-mail göndərməklə əldə edə bilərsiniz.\n \n"
                          "4.Sualınıza cavab almaq üçün E-Mail və Whatsapp nömrənizi DÜZGÜN qeyd etmək.\n \n"
                          "5. E-mail və nömrəniz sualınızın cavabını göndərməyimiz üçün lazımdır"


                        , style: TextStyle( fontSize: 13),),
                    ),
                  ],
                ),
              ),
            ),
          ),
          isTrue ? Center(child: Container(
              height: Get.height,
              width: Get.width,
              color: Colors.black26,
              child: Center(child: CircularProgressIndicator( color: Colors.white,))),) : SizedBox()
        ],
      ),


    );
  }


}
