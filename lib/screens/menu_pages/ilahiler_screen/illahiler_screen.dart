import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../constants.dart';

class IlahilerScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var _w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        scrolledUnderElevation: 3,
        centerTitle: true,
        backgroundColor: appBarColor,
        title: Text("İlahilər", style: GoogleFonts.arimaMadurai(color: Colors.white, fontWeight: FontWeight.bold, ),),

      ),
      body: Scrollbar(
        child: ListView.separated(
          itemCount: ilahiTileWidget.length,
          itemBuilder: (BuildContext context, int index) {
            return  ilahiTileWidget[index];
          }, separatorBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Divider(),
            );
        },

        ),
      ),
    );
  }

}



