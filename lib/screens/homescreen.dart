import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:card_swiper/card_swiper.dart';
import '../constants.dart';

class HomeScreen extends StatefulWidget {

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: Drawer(
        backgroundColor: Theme.of(context).colorScheme.onInverseSurface,
        child: ListView(
          shrinkWrap: true,
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: DrawerHeader(
                  decoration: BoxDecoration(color: appBarColor, borderRadius: BorderRadius.circular(15)),
                  child: Center(child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Gözəl İslam", style: GoogleFonts.arimaMadurai(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 40),),
                      Text("Dini kitablar, dini mövzular, sual cavab" , style: GoogleFonts.arimaMadurai(color: Colors.white, fontWeight: FontWeight.bold, ),),
                      Text("www.gozelislam.com", style: GoogleFonts.arimaMadurai(color: Colors.white60, fontWeight: FontWeight.bold, ),),],
                  ))),
            ),
            ListTile(
              leading: Icon(Icons.home_outlined),
              title: Text("Əsas səhifə", style: GoogleFonts.poppins(fontWeight: FontWeight.w500,),), ),
            ListTile(
              leading: Icon(Icons.book_outlined),
              title: Text("Dini kitablar", style: GoogleFonts.poppins(fontWeight: FontWeight.w500,),), ),
            ListTile(
              leading: Icon(Icons.shopping_bag_outlined),
              title: Text("Mağazamız", style: GoogleFonts.poppins(fontWeight: FontWeight.w500,),), ),
            ListTile(
              leading: Icon(Icons.image_aspect_ratio),
              title: Text("E-kart", style: GoogleFonts.poppins(fontWeight: FontWeight.w500,),), ),
            ListTile(
              leading: Icon(Icons.image_aspect_ratio),
              title: Text("Hikmətli sözlər", style: GoogleFonts.poppins(fontWeight: FontWeight.w500,),), ),
            ListTile(
              leading: Icon(Icons.video_library_outlined),
              title: Text("Dini filmlər", style: GoogleFonts.poppins(fontWeight: FontWeight.w500,),), ),
            ListTile(
              leading: Icon(Icons.music_note),
              title: Text("İlahilər", style: GoogleFonts.poppins(fontWeight: FontWeight.w500,),), ),
            ListTile(
              leading: Icon(Icons.link_rounded),
              title: Text("Linklər", style: GoogleFonts.poppins(fontWeight: FontWeight.w500,),), ),
            ListTile(
              leading: Icon(Icons.video_collection_outlined),
              title: Text("Video", style: GoogleFonts.poppins(fontWeight: FontWeight.w500,),), ),
            ListTile(
              leading: Icon(Icons.question_answer_outlined),
              title: Text("Sual göndər", style: GoogleFonts.poppins(fontWeight: FontWeight.w500,),), ),
            ListTile(
              leading: Icon(Icons.home_outlined),
              title: Text("Haqqımızda", style: GoogleFonts.poppins(fontWeight: FontWeight.w500,),), ),

          ],
        ),
      ),
      appBar: AppBar(
        actions: [IconButton( onPressed: () {  }, icon: Icon(Icons.share),)],
        scrolledUnderElevation: 3,
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        backgroundColor: appBarColor,
        title: Text("Gözəl İslam", style: GoogleFonts.arimaMadurai(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),),

      ),
      body: Scrollbar(
        child: ListView(
          padding: EdgeInsets.only(bottom: 50),
          children: [

          SizedBox(
            height: 200,
            child: Swiper(
              autoplay: true,
              autoplayDelay: 3,
              pagination: SwiperPagination(builder: DotSwiperPaginationBuilder(activeColor: appBarColor, color: Colors.white),
                  alignment: Alignment.bottomCenter),
              indicatorLayout: PageIndicatorLayout.SCALE,
              itemCount: 4,
                itemBuilder: (context, index){
              return Image.asset("assets/dinikitablar3.png", fit: BoxFit.fill,);
            }),
          ),


            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Container(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ListTile(
                        isThreeLine: true,
                        title: Text("Hikmət əhli buyurdu ki,", style: GoogleFonts.arimaMadurai(fontWeight: FontWeight.bold, color: appBarColor, fontSize: 18),),
                        subtitle: Text(
                          "Dünya malı üçün çalışmaq asan, lakin hesabından qurtulmaq çətindir. (Fudayl bin İyad “rahmətullahi aleyh)",
                           textAlign: TextAlign.justify,
                           style: GoogleFonts.poppins(fontSize: 18) ,)),
                    Row(mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton.outlined(onPressed: (){}, icon: Icon(Icons.copy)),
                        IconButton.outlined(onPressed: (){}, icon: Icon(Icons.share_rounded)),

                      ],
                    )
                  ],
                ),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onInverseSurface,
                  borderRadius: BorderRadius.circular(15)
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, ),
              child: Container(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ListTile(
                        isThreeLine: true,
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Günün mövzusu", style: GoogleFonts.arimaMadurai(fontWeight: FontWeight.bold, fontSize: 18, color: appBarColor),),
                            Text("Rəsm çəkmək", style: GoogleFonts.poppins(fontWeight: FontWeight.bold, color: Colors.green, fontSize: 18),),],),
                        subtitle: Text(daylyTopic, maxLines: 12, overflow: TextOverflow.ellipsis ,textAlign: TextAlign.justify, style: GoogleFonts.poppins(fontSize: 18) ,)),

                    Row(mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(onPressed: (){}, child: Text("Ardını oxu", style: GoogleFonts.actor(),),
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.transparent, elevation: 0, shadowColor: Colors.transparent, side: BorderSide(width: .8)),),
                        IconButton.outlined(onPressed: (){}, icon: Icon(Icons.copy)),
                        IconButton.outlined(onPressed: (){}, icon: Icon(Icons.share_rounded)),

                      ],
                    )
                  ],
                ),
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onInverseSurface,
                    borderRadius: BorderRadius.circular(15)
                ),
              ),
            ),


            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20 ),
              child: Container(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 19, top: 10),
                      child: Text("Yeni mövzular", style: GoogleFonts.arimaMadurai(fontWeight: FontWeight.bold, color: appBarColor , fontSize: 18),),
                    ),
                    ListView(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        ListTile(
                          leading: Icon(Icons.topic_outlined, color: appBarColor.shade600),
                          title: Text("Rəsm çəkmək..", style: GoogleFonts.poppins(fontSize: 18),), trailing: Icon(Icons.chevron_right, color: appBarColor.shade600,),),
                        ListTile(
                          leading: Icon(Icons.topic_outlined, color: appBarColor.shade600),
                          title: Text("Cümə günü və gecəsi nə oxunmalıdır..", style: GoogleFonts.poppins(fontSize: 18),), trailing: Icon(Icons.chevron_right, color: appBarColor.shade600)),
                        ListTile(
                          leading: Icon(Icons.topic_outlined, color: appBarColor.shade600),
                          title: Text("Xəstəyə qan vermək..", style: GoogleFonts.poppins(fontSize: 18),),trailing: Icon(Icons.chevron_right, color: appBarColor.shade600)),
                        ListTile(
                          leading: Icon(Icons.topic_outlined, color: appBarColor.shade600),
                          title: Text("Ən uca elm həddini bilməkdir..", style: GoogleFonts.poppins(fontSize: 18)), trailing: Icon(Icons.chevron_right, color: appBarColor.shade600)),
                        ListTile(
                          leading: Icon(Icons.topic_outlined, color: appBarColor.shade600),
                          title: Text("Gözəl əxlaq..", style: GoogleFonts.poppins(fontSize: 18),), trailing: Icon(Icons.chevron_right, color: appBarColor.shade600)),


                      ],
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onInverseSurface,
                    borderRadius: BorderRadius.circular(15)
                ),
              ),
            ),


            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10,  ),
              child: Container(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 19, top: 10),
                      child: Text("Yenilənən mövzular", style: GoogleFonts.arimaMadurai(fontWeight: FontWeight.bold, color: appBarColor , fontSize: 18),),
                    ),
                    ListView(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        ListTile(
                          leading: Icon(Icons.topic_outlined, color: appBarColor.shade600),
                          title: Text("Rəsm çəkmək..", style: GoogleFonts.poppins(fontSize: 18),), trailing: Icon(Icons.chevron_right, color: appBarColor.shade600,),),
                        ListTile(
                            leading: Icon(Icons.topic_outlined, color: appBarColor.shade600),
                            title: Text("Cümə günü və gecəsi nə oxunmalıdır..", style: GoogleFonts.poppins(fontSize: 18),), trailing: Icon(Icons.chevron_right, color: appBarColor.shade600)),
                        ListTile(
                            leading: Icon(Icons.topic_outlined, color: appBarColor.shade600),
                            title: Text("Xəstəyə qan vermək..", style: GoogleFonts.poppins(fontSize: 18),),trailing: Icon(Icons.chevron_right, color: appBarColor.shade600)),
                        ListTile(
                            leading: Icon(Icons.topic_outlined, color: appBarColor.shade600),
                            title: Text("Ən uca elm həddini bilməkdir..", style: GoogleFonts.poppins(fontSize: 18)), trailing: Icon(Icons.chevron_right, color: appBarColor.shade600)),
                        ListTile(
                            leading: Icon(Icons.topic_outlined, color: appBarColor.shade600),
                            title: Text("Gözəl əxlaq..", style: GoogleFonts.poppins(fontSize: 18),), trailing: Icon(Icons.chevron_right, color: appBarColor.shade600)),


                      ],
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                    color:Theme.of(context).colorScheme.onInverseSurface,
                    borderRadius: BorderRadius.circular(15)
                ),
              ),
            ),


            // Padding(
            //   padding: const EdgeInsets.symmetric(vertical: 20, ),
            //   child: SizedBox(
            //     height: 380,
            //     child: Swiper(
            //         autoplayDelay: 3,
            //         pagination: SwiperPagination(builder: DotSwiperPaginationBuilder(activeColor: appBarColor, color: Colors.white),
            //             alignment: Alignment.bottomCenter),
            //         indicatorLayout: PageIndicatorLayout.SCALE,
            //         autoplay: true, itemCount: 4,
            //         itemBuilder: (context, index){
            //           return  Padding(
            //             padding: const EdgeInsets.symmetric(horizontal: 10, ),
            //             child: Container(
            //               width: double.infinity,
            //               child: Column(
            //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                 children: [
            //                   ListTile(
            //                       isThreeLine: true,
            //                       title: Row(
            //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                         children: [
            //                           Text("Günün mövzusu", style: GoogleFonts.arimaMadurai(fontWeight: FontWeight.bold, fontSize: 18, color: appBarColor),),
            //                           Text("Rəsm çəkmək", style: GoogleFonts.poppins(fontWeight: FontWeight.bold, color: Colors.green, fontSize: 18),),],),
            //                       subtitle: Text(daylyTopic, maxLines: 12, overflow: TextOverflow.ellipsis ,textAlign: TextAlign.justify, style: GoogleFonts.poppins(fontSize: 18) ,)),
            //
            //                   Row(mainAxisAlignment: MainAxisAlignment.end,
            //                     children: [
            //                       ElevatedButton(onPressed: (){}, child: Text("Ardını oxu", style: GoogleFonts.actor(),),
            //                         style: ElevatedButton.styleFrom(backgroundColor: Colors.transparent, elevation: 0, shadowColor: Colors.transparent, side: BorderSide(width: .8)),),
            //                       IconButton.outlined(onPressed: (){}, icon: Icon(Icons.copy)),
            //                       IconButton.outlined(onPressed: (){}, icon: Icon(Icons.share_rounded)),
            //
            //                     ],
            //                   )
            //                 ],
            //               ),
            //               decoration: BoxDecoration(
            //                   color: Theme.of(context).colorScheme.onInverseSurface,
            //                   borderRadius: BorderRadius.circular(15)
            //               ),
            //             ),
            //           );
            //
            //         }),
            //   ),
            // ),






          ],
        ),
      ),

    );
  }
}
