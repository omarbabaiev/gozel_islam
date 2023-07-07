import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider_indicators.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Constants.dart';
class BookCard extends StatefulWidget {
  const BookCard({Key? key}) : super(key: key);

  @override
  State<BookCard> createState() => _BookCardState();
}

class _BookCardState extends State<BookCard> {
  CarouselSliderController _controller = CarouselSliderController();
  var slidePage = 0;
  var slidePage1 = 2200000;
  var _sliderKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 0),
      child: Container(
        decoration: BoxDecoration(
            color: appBarColor.shade100,
            borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.start,
              //   children: [
              //     SizedBox(width: 5,),
              //     Text("Dini kitablar", style: GoogleFonts.arimaMadurai(fontWeight: FontWeight.bold, color: appBarColor , fontSize: 20),),
              //   ],
              // ),
              InkWell(
                onTap: (){
                  // Navigator.push(context, SizeTransition2(BookReader(path: BookListDart.BookListView[slidePage].bookLink, pathWord: BookListDart.BookListView[slidePage].bookTitle,)));

                },
                child: Container(
                  height: 100,
                  child: CarouselSlider.builder(
                      controller: _controller,
                      onSlideChanged: (value){
                        setState(() {
                          slidePage = value - slidePage1;
                          if(slidePage == 22){
                            slidePage = 0;
                            slidePage1  = slidePage1 + 22;
                          }
                        });
                      },
                      key: _sliderKey,
                      unlimitedMode: true,
                      slideBuilder: (index) {
                        return Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Image.network(bookTileList[index].image),
                        );
                      },
                      slideTransform: FlipHorizontalTransform(),
                      slideIndicator:
                      CircularWaveSlideIndicator(
                        indicatorBackgroundColor: Colors.black.withOpacity(.01),
                        currentIndicatorColor: Colors.blue,
                        padding: EdgeInsets.only(bottom: 0),
                      ),
                    itemCount: bookTileList.length,
                      // itemCount: BookListDart.BookListView.length),
                ),
              ),),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     OutlinedButton(onPressed: () {
              //       // Navigator.push(context, SizeTransition2(BookList()));
              //
              //     },
              //         child: Row(
              //           children: [
              //             Icon(Icons.read_more_rounded),
              //             SizedBox(width: 10,),
              //             Text("Bütün kitablar", style: TextStyle(fontWeight: FontWeight.bold, ),),
              //           ],
              //         )),
              //     OutlinedButton(onPressed: () {
              //       // Navigator.push(context, SizeTransition2(BookReader(path: BookListDart.BookListView[slidePage].bookLink, pathWord: BookListDart.BookListView[slidePage].bookTitle,)));
              //
              //     },
              //         child: Row(
              //           children: [
              //             Icon(Icons.chrome_reader_mode_outlined),
              //             SizedBox(width: 10,),
              //             Text("Oxu", style: TextStyle(fontWeight: FontWeight.bold, ),),
              //           ],
              //         )),
              //
              //
              //
              //   ],
              // ),




              //
              // Swiper(
              //   autoplayDelay: 5000,
              //   indicatorLayout: PageIndicatorLayout.SLIDE,
              //   itemBuilder: (BuildContext context, int index) {
              //     return Card(child: Image.network((bookTileList[index].image)));
              //   },
              //   scrollDirection: Axis.horizontal,
              //   itemCount: bookTileList.length,
              //   autoplay: true,
              //   axisDirection: AxisDirection.right,
              //   itemHeight: 200,
              //   itemWidth: 300,
              //   pagination: new SwiperPagination(
              //
              //   ),
              //   layout: SwiperLayout.STACK,
              // ),
              ],
          ),
        ),
      ),
    );
  }
}
