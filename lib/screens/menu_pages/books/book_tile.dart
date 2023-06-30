import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'book_details_screen.dart';

class BookTile extends StatelessWidget {

  BookTile(this.image, this.orederLink, this.linkDownload, this.bookName, this.author, this.description, this.hero);
  String image;
  String orederLink;
  String linkDownload;
  String bookName;
  String author;
  String description;
  String hero;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: InkWell(
        onTap: (){
          Navigator.of(context).push(CupertinoPageRoute(builder: (context)=> BookDetailsScreen(image, orederLink, linkDownload, bookName, author, description, hero )));
        },
        child: Container(
          decoration: BoxDecoration(
              color: Colors.red.shade100,
              borderRadius: BorderRadius.circular(10)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 10,),
              Hero(
                tag: hero,
                child: FadeInImage(
                    height: 150,
                    placeholder: AssetImage("assets/open-book.png"),
                    image: NetworkImage(image, )
                ),
              ),
              SizedBox(height: 10,),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Hero(
                      tag: "1$hero",
                      child: Text(bookName, maxLines: 2, overflow: TextOverflow.clip, textAlign: TextAlign.center, style: GoogleFonts.arima( fontWeight: FontWeight.bold, fontSize: 16 ),)),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}