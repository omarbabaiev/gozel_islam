import 'dart:ui';
import 'package:jiffy/jiffy.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../Constants.dart';

class PrayerTimeTable extends StatefulWidget {
  @override
  _DataTable1 createState() => _DataTable1();
}

class _DataTable1 extends State<PrayerTimeTable> {
  var date = "data";
  var sayi;
  List months =
  ['Yanvar', 'Fevral', 'Mart', 'Aprel', 'May','İyun','İyul','Avqust','Sentyabr','Oktyabr','Noyabr','Dekabr'];
  List weekday = ["Bzr.ertəsi", "Çər.axşamı", "Çərşənbə", "Cümə.axşamı", "Cümə", "Şənbə", "Bazar"];
  GetStorage box = GetStorage();
  var zor;
  @override
  void initState() {

    zor = box.read("time");
    sayi = Jiffy.now().dayOfYear;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return
      Scaffold(
        appBar:  AppBar(
          scrolledUnderElevation: 3,
          centerTitle: true,
          backgroundColor: appBarColor,
          title: Text("Namaz Təqvimi", style: GoogleFonts.arimaMadurai(color: Colors.white, fontWeight: FontWeight.bold,),),

        ),
        body: Padding(
          padding: const EdgeInsets.all(1),
          child: DataTable2(
            border: TableBorder.all(color: Colors.indigo),
            isHorizontalScrollBarVisible: true,
              columnSpacing: 5,
              horizontalMargin: 5,
              minWidth: 1200,
              columns: [
                DataColumn2(
                  fixedWidth: 100,
                  label: Container(
                    decoration: BoxDecoration(
                      color: appBarColor.shade200,
                      borderRadius: BorderRadius.circular(6)
                    ),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text('Tarix', style: GoogleFonts.alata(fontSize: 20),),
                      )),
                  size: ColumnSize.L,
                ),
                DataColumn2(
                  fixedWidth: 200,
                  label: Container(
                      decoration: BoxDecoration(
                          color: appBarColor.shade200,
                          borderRadius: BorderRadius.circular(6)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text('Hicri Tarix', style: GoogleFonts.alata(fontSize: 20),),
                      )),
                  size: ColumnSize.L,
                ),
                DataColumn2(
                  fixedWidth: 200,
                  label: Container(
                      decoration: BoxDecoration(
                          color: appBarColor.shade200,
                          borderRadius: BorderRadius.circular(6)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text('Həftənin günü', style: GoogleFonts.alata(fontSize: 20),),
                      )),
                  size: ColumnSize.L,
                ),
                DataColumn2(
                  label: Container(
                      decoration: BoxDecoration(
                          color: appBarColor.shade200,
                          borderRadius: BorderRadius.circular(6)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text('İmsaq', style: GoogleFonts.alata(fontSize: 20),),
                      )),
                  size: ColumnSize.S,

                ),
                DataColumn2(
                  label: Container(
                      decoration: BoxDecoration(
                          color: appBarColor.shade200,
                          borderRadius: BorderRadius.circular(6)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text('Sübh', style: GoogleFonts.alata(fontSize: 20),),
                      )), size: ColumnSize.S,
                ),
                DataColumn2(
                  label: Container(
                      decoration: BoxDecoration(
                          color: appBarColor.shade200,
                          borderRadius: BorderRadius.circular(6)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text('Günəş', style: GoogleFonts.alata(fontSize: 20),),
                      )), size: ColumnSize.S,
                ),
                DataColumn2(
                  label: Container(
                      decoration: BoxDecoration(
                          color: appBarColor.shade200,
                          borderRadius: BorderRadius.circular(6)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text('Zöhr', style: GoogleFonts.alata(fontSize: 20),),
                      )), size: ColumnSize.S,
                ),
                DataColumn2(
                  label: Container(
                      decoration: BoxDecoration(
                          color: appBarColor.shade200,
                          borderRadius: BorderRadius.circular(6)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text('Əsr', style: GoogleFonts.alata(fontSize: 20),),
                      )), size: ColumnSize.S,
                ),
                DataColumn2(
                  label: Container(
                      decoration: BoxDecoration(
                          color: appBarColor.shade200,
                          borderRadius: BorderRadius.circular(6)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text('Axşam', style: GoogleFonts.alata(fontSize: 20),),
                      )), size: ColumnSize.S,
                ),
                DataColumn2(
                  label: Container(
                      decoration: BoxDecoration(
                          color: appBarColor.shade200,
                          borderRadius: BorderRadius.circular(6)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text('İşa', style: GoogleFonts.alata(fontSize: 20),),
                      )), size: ColumnSize.S,
                ),

                DataColumn2(
                  fixedWidth: 150,
                  label: Container(
                      decoration: BoxDecoration(
                          color: appBarColor.shade200,
                          borderRadius: BorderRadius.circular(6)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text('Gecə Yarısı', style: GoogleFonts.alata(fontSize: 20),),
                      )), size: ColumnSize.S,
                ),
              ],
              rows:
              List<DataRow>.generate(
                  Jiffy.now().month == 12 ? Jiffy.now().daysInMonth-Jiffy.now().date + 1 : 30,
                      (index) => DataRow(
                      selected: true,
                      cells: [
                        DataCell(
                            Text("${DateTime.parse("${zor['${sayi+index}']['baseTime']["todayDate"]}").day} ${months[DateTime.parse("${zor[''
                                '${sayi+index}']['baseTime']["todayDate"]}").month - 1]}",
                              style: weekday[DateTime.parse("${zor['${sayi+index}']['baseTime']["todayDate"]}").weekday - 1].toString()
                                  .isCaseInsensitiveContainsAny("Cümə ") ? GoogleFonts.alata(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 20) : GoogleFonts.alata(color: Colors.black, fontSize: 20),
                            )),
                        DataCell(
                            Text( "${zor['${sayi+index}']['baseTime']["todayHijrahDate"]}".capitalizeFirst.toString(),
                              style:
                              weekday[DateTime.parse("${zor['${sayi+index}']['baseTime']["todayDate"]}").weekday - 1].toString()
                                  .isCaseInsensitiveContainsAny("Cümə ")  ||
                                  "${zor['${sayi+index}']['baseTime']["todayHijrahDate"]}".capitalizeFirst.toString().isCaseInsensitiveContainsAny("ramez") ? GoogleFonts.alata(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 20) : GoogleFonts.alata(color: Colors.black, fontSize: 20),
                            )),
                        DataCell(Text(weekday[DateTime.parse("${zor['${sayi+index}']['baseTime']["todayDate"]}").weekday - 1].toString(),
                          style: weekday[DateTime.parse("${zor['${sayi+index}']['baseTime']["todayDate"]}").weekday - 1].toString()
                              .isCaseInsensitiveContainsAny("Cümə ") ? GoogleFonts.alata(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 20) : GoogleFonts.alata(color: Colors.black, fontSize: 20),


                        )) ,
                        DataCell(Text(zor['${sayi+index}']['baseTime']['imsaq'].toString(), style: GoogleFonts.alata(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 20),)),
                        DataCell(Text(zor['${sayi+index}']['baseTime']['sabah'].toString()?? "Tapılmadı", style: GoogleFonts.alata(color: Colors.black, fontSize: 20),)),
                        DataCell(Text(zor['${sayi+index}']['baseTime']['gunes'].toString()?? "Tapılmadı", style: GoogleFonts.alata(color: Colors.black, fontSize: 20),)),
                        DataCell(Text(zor['${sayi+index}']['baseTime']['gunorta'].toString()?? "Tapılmadı", style: GoogleFonts.alata(color: Colors.black, fontSize: 20),)),
                        DataCell(Text(zor['${sayi+index}']['baseTime']['ikindi'].toString()?? "Tapılmadı", style: GoogleFonts.alata(color: Colors.black, fontSize: 20),)),
                        DataCell(Text(zor['${sayi+index}']['baseTime']['axsam'].toString(), style: GoogleFonts.alata(color: Colors.red, fontWeight: FontWeight.bold , fontSize: 20))),
                        DataCell(Text(zor['${sayi+index}']['baseTime']['yatsi'].toString()?? "Tapılmadı", style: GoogleFonts.alata(color: Colors.black, fontSize: 20),)),
                        DataCell(Text(zor['${sayi+index}']['extraTime']['midnight'].toString()?? "Tapılmadı", style: GoogleFonts.alata(color: Colors.black, fontSize: 20),)),


                      ]))),




        ),
      );

  }
}