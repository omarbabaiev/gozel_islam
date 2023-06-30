import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../constants.dart';

class EsmaScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var _w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        scrolledUnderElevation: 3,
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        backgroundColor: appBarColor,
        title: Text("Esmaül Hüsna", style: GoogleFonts.arimaMadurai(color: Colors.white, fontWeight: FontWeight.bold, ),),

      ),
        body: Scrollbar(
            child: ListView.builder(
              itemCount: esmaTileListe.length,
              itemBuilder: (BuildContext context, int index) {
                return  ListTile(
                                leading: Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        border: Border.all( width: .1),
                                        shape: BoxShape.circle,
                                        gradient: LinearGradient(colors: [Colors.red.shade100, appBarColor.shade200 ]

                                        )
                                    ),
                                    child: FittedBox(child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Text('${index + 1}', style: GoogleFonts.aldrich(), ),
                                    ))),
                                title: Text(esmaTileListe[index], style: GoogleFonts.arimaMadurai(fontWeight: FontWeight.bold, fontSize: 20)),
                                subtitle: Text('${mena[index]}', style: GoogleFonts.poppins()),
                                trailing: Text(arabItem[index], style: GoogleFonts.arimaMadurai(fontSize: 20, color: Colors.red)),

                              );
              },

            ),
          ),
    );
  }
}
