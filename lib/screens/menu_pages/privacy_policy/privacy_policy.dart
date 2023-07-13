import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../constants.dart';


class PrivacyPolicy extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 3,
          centerTitle: true,
          backgroundColor: appBarColor,
          title: Text("Privacy policy", style: GoogleFonts.arimaMadurai(color: Colors.white, fontWeight: FontWeight.bold, ),),

        ),
        body: SingleChildScrollView(
          child: Html(data: privacyPolicy,),
        )
    );
  }


}



