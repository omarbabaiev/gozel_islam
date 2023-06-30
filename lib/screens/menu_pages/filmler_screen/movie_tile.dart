import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gozel_islam/Constants.dart';
import 'package:url_launcher/url_launcher.dart';
class MoviesTile extends StatelessWidget {
  String movieName;
  String videoLink;

  MoviesTile(this.movieName, this.videoLink);

  void _launchUrl(String patha) async {
    if (!await launch(Uri.parse(patha).toString(), forceSafariVC: true, forceWebView: false )) throw 'Could not launch $patha';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: ListTile(
              onTap: (){
                _launchUrl("$videoLink",);
              },
              leading: Icon(Icons.movie_creation_outlined, color: appBarColor.shade200,),
              trailing: Icon(Icons.chevron_right, color: appBarColor.shade200),
              title: Text(movieName, maxLines: 1, style: GoogleFonts.poppins(fontWeight: FontWeight.w500),),

            )));
  }
}