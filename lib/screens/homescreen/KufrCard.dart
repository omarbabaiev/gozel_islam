
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gozel_islam/Constants.dart';


class KufrCard extends StatefulWidget {

  @override
  State<KufrCard> createState() => _KufrCardState();
}

class _KufrCardState extends State<KufrCard> {
  int maxLines = 4;
  var visual = "Oxu";
  var zor = true;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        decoration: BoxDecoration(
            color: appBarColor.shade100,
            borderRadius: BorderRadius.circular(15)
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child:
             Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Icon(Icons.info_outline_rounded, color: Colors.blue),
                SizedBox(width: 10,),
                  Text("Çox mühüm açıqlama", style: GoogleFonts.poppins(fontSize: 17 ,  ),),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  OutlinedButton(
                      onPressed: (){
                        showModalBottomSheet(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15))),
                            context: context,
                            builder: ( BuildContext context ) {
                              return StatefulBuilder(
                                builder: (BuildContext context, StateSetter setState) {
                                  return Stack(
                                    alignment: Alignment.topCenter,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric( horizontal: 15),
                                        child: SingleChildScrollView(
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(height: 60,),
                                              SizedBox(height: 20,),
                                              Text("Küfrə düşən nə etməlidir?",
                                                style: GoogleFonts.poppins(fontSize: 15 ,  fontWeight: FontWeight.bold  ),),
                                              SizedBox(height: 20,),
                                              Text("Sual",
                                                style: GoogleFonts.poppins(fontSize: 15 ,  fontWeight: FontWeight.bold  ),),
                                              Text(textAlign: TextAlign.justify,"  Bilib-bilmədən çox söz danışır, doğru-yanlış çox iş görürük. Özümüz də bilmədən küfrə düşmüşüksə nə etməliyik?",
                                                style: GoogleFonts.poppins(fontSize: 15 ,  ),),
                                              SizedBox(height: 10,),

                                              Text("Cavab",
                                                style: GoogleFonts.poppins(fontSize: 15 ,  fontWeight: FontWeight.bold  ),),
                                              Text(textAlign: TextAlign.justify,"""  İslam alimləri buyururlar ki:"""
                                                  """Hər Müsəlman Allahü təalanın əmrlərinə tabe olmalı, qadağan etdiyi şeylərdən çəkinməlidir. İbadətləri yerinə yetirməyə, haramlardan çəkinməyə əhəmiyyət verməyənin imanı gedər, kafir olar. Kafir olaraq ölən insan axirətdə sonsuz olaraq Cəhənnəmdə çeşidli əzablara məruz qalar. Əfv edilməsinə və Cəhənnəmdən çıxmasına imkan və ehtimal yoxdur.
   Bir Müsəlmanın küfrə düşməsi, yəni kafir olması çox asanlıqla olur. Çünki hər sözdə və hər işdə kafir olmaq ehtimalı çoxdur. Buna görə də küfrün səbəbi bilinməsə də, hər gün bir dəfə “Ya Rəbbi, bilərək və ya bilməyərək küfrə [kafirliyə] səbəb olan bir söz söylədim və ya bir iş etdimsə, peşman oldum, məni əfv et” demək lazımdır. Belə tövbə edən Müsəlman mütləq ki, əfv olunar, Cəhənnəmdən xilas olar. Cəhənnəmdə sonsuz qalmamaq üçün hər gün mütləq tövbə etmək lazımdır. Müsəlmanın bu tövbədən daha vacib vəzifəsi yoxdur.""",
                                                style: GoogleFonts.poppins(fontSize: 15 ,  ),),
                                              SizedBox(height: 10,),
                                              Text("Bilmədən küfrə girmək",
                                                style: GoogleFonts.poppins(fontSize: 15 ,  fontWeight: FontWeight.bold  ),),
                                              SizedBox(height: 10,),

                                              Text("Sual",
                                                style: GoogleFonts.poppins(fontSize: 15 ,  fontWeight: FontWeight.bold  ),),
                                              Text(textAlign: TextAlign.justify,"  Bir söz və ya işin küfür olduğunu bilmədən işləyən, sonra da, “Ya Rəbbi bilərək-bilməyərək işlədiyim küfürlərə tövbə etdim” desə, küfrü əfv olarmı?",
                                                style: GoogleFonts.poppins(fontSize: 15 ,  ),),
                                              SizedBox(height: 10,),

                                              Text("Cavab",
                                                style: GoogleFonts.poppins(fontSize: 15 ,  fontWeight: FontWeight.bold  ),),
                                              Text("  Bəli, əfv olar.",
                                                style: GoogleFonts.poppins(fontSize: 15 ,  ),),

                                              SizedBox(height: 10,),



                                              Text(textAlign: TextAlign.justify,"Küfürdən, inkardan qorunmaq üçün",
                                                style: GoogleFonts.poppins(fontSize: 15 ,   fontWeight: FontWeight.bold  ),),
                                              SizedBox(height: 10,),

                                              Text(textAlign: TextAlign.justify,"  Muhamməd əleyhissalamın Allahü təaladan gətirib bildirdiyi şeylərin hamısına qəlb ilə inanıb dil ilə söyləməyə iman deyilir. İmanın yeri qəlbdir. Qəlb, ürək adlanan ət parçasında olan bir qüvvədir, buna könül də deyilir. İmanı söyləməyə maneə olduğu zaman söyləməmək əfv olur. Məsələn, qorxudulduğu, xəstə, dilsiz olduğu, söyləyəcək vaxt olmadan öldüyü zaman söyləmək lazım gəlməz. Anlamadan, təqlid edərək inanmaq da iman sayılır. Allahü təalanın var olduğunu anlamamaq, düşünməmək günah olar. Peyğəmbər əfəndimiz tərəfindən açıq-aşkar bildirilənlərdən birinə belə inanmamaq, hamısına inanmamaq sayılır. Hər birini bilmədən “Hamısına inandım” demək də iman sayılır."""

                                                  """İmanın hasil olması üçün İslamiyyətin küfür, inkar əlaməti dediyi şeylərdən çəkinmək də lazımdır. İslamiyyətin əmr və qadağalarından birini zəif görmək, Qurani-kərimlə, mələklərlə, Peyğəmbərlərdən biri ilə lağ etmək, küfür, inkar əlamətlərindəndir. İnkar etmək, yəni eşitdikdən sonra inanmamaq, təsdiq etməmək deməkdir. Şübhə etmək də inkar sayılır.
    Küfür, yəni imanın getməsinə səbəb olduğunu hər kəsin bildiyi bir şeyi, eşitmədiyi, düşünmədiyi üçün kafir olanların, imanı gedənlərin küfrü “küfri-cəhli”dir. Cəhalət də iki cürdür:
    Birincisi, cahil olduğunu bilir, lakin bu cəhalətinin getməsi üçün çalışmır. Belə olanlar üçün “Heyvan kimidirlər, hətta heyvandan da aşağıdırlar” deyilmişdir. Çünki insanı heyvandan ayıran elm və idrakdır. Heyvanlar yaradıldıqları şeydə irəlidədirlər. Özlərinə faydalı şeyləri anlayır və onlara yaxınlaşırlar. Zərərli olanları da anlayıb onlardan uzaqlaşırlar. Halbuki belə cahillər bilmədiklərini bildikləri halda bu çirkin haldan uzaqlaşmaz, elmə yaxınlaşmazlar. Cəhalətin ikincisi “cəhli-mürəkkəb”dir. Yunan filosoflarından və Müsəlmanlardan yetmiş iki bidət firqəsindən imanı gedənlər belədirlər. Bu cəhalət birincisindən daha pisdir. Əlacı bilinməyən bir xəstəlikdir. İsa əleyhissalam “Karı, lalı müalicə etdim, ölünü diriltdim, ancaq cəhli-mürəkkəbin əlacını tapa bilmədim” buyurmuşdur. Çünki belə adamlar cəhalətini elm və kamillik, üstünlük zənn edir. Cahil və ruh xəstəsi olduğunu bilmir ki, əlacını axtarsın! Ancaq Allahü təalanın hidayəti ilə xəstəliyini anlayan adam bu dərddən qurtula bilər.
    İman ediləcək şeyləri və fərzlərdən, haramlardan məşhur olanları, lazımi qədər öyrənmək fərzdir. Bunları öyrənməmək haramdır. Eşidib, amma öyrənməyə əhəmmiyyət, dəyər verməmək küfrə, yəni imanın getməsinə səbəb olur. Cəhalətdən qurtulmağın əlacı isə Əhli-sünnət alimlərinin kitablarını oxuyaraq öyrənməkdir.""",
                                                style: GoogleFonts.poppins(fontSize: 15 ,  ),),




                                              SizedBox(height: 10,),
                                              Text("Küfrə düşməmək üçün",
                                                style: GoogleFonts.poppins(fontSize: 15 ,  fontWeight: FontWeight.bold  ),),
                                              SizedBox(height: 10,),

                                              Text("Sual",
                                                style: GoogleFonts.poppins(fontSize: 15 ,  fontWeight: FontWeight.bold  ),),
                                              Text(textAlign: TextAlign.justify,"  Küfrə düşməmək üçün nə etmək lazımdır?",
                                                style: GoogleFonts.poppins(fontSize: 15 ,  ),),
                                              SizedBox(height: 10,),

                                              Text("Cavab",
                                                style: GoogleFonts.poppins(fontSize: 15 ,  fontWeight: FontWeight.bold  ),),
                                              Text(textAlign: TextAlign.justify,"  Küfrə salan söz və işləri öyrənərək bunlardan çəkinmək lazımdır. Müsəlman bilə-bilə küfrə düşməz, qəsdən özünü kafir etməz, amma bilmədən düşə bilər. Bilmədən küfrə düşən bu duanı ixlasla oxuyarsa, imanı təkrar geri gələr:",
                                              ),
                                              SizedBox(height: 10,),
                                              Text(textAlign: TextAlign.justify,"“Allahümmə inni ə'uzü bikə min ən üşrikə bikə şəy'ən və ənə əa'ləmü və əstəğfirükə li-mə lə əa'ləmü innəkə əntə allamül quyub.”",
                                                style: GoogleFonts.poppins(fontSize: 15 ,  fontWeight: FontWeight.bold  ),),
                                              SizedBox(height: 40,),







                                            ],
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.topRight,
                                        child: Container(
                                          decoration: BoxDecoration(  
                                            borderRadius: BorderRadius.circular(15),
                                            color: appBarColor.shade100,
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text("Çox mühüm açıqlama", style: GoogleFonts.poppins(fontSize: 17 , fontWeight: FontWeight.bold  ),),
                                                IconButton.filledTonal(
                                                    onPressed: (){
                                                  Navigator.pop(context);
                                                }, icon: Icon(Icons.cancel_outlined, size: 30,)),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),



                                    ],
                                  );
                                } ,
                              );;
                            }
                        );
                      },

                      child: Text("Oxu", style: GoogleFonts.poppins(fontSize: 15 ,fontWeight: FontWeight.bold, ),)),



                ],
              )
            ],
          )




      ),
    ));
  }
}
