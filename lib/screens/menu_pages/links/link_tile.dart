import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../Constants.dart';


class LinkTile  extends StatelessWidget {
  String name;
  String path;
  String subtitle;

  LinkTile({required this.name, this.path = "", required this.subtitle, });

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
                _launchUrl("https://$path",);

              },
              leading: Icon(Icons.link, color: appBarColor.shade200),
              title: Text(name,  maxLines: 1, style: GoogleFonts.poppins(fontWeight: FontWeight.w500), ),
              trailing: Icon(Icons.chevron_right, color: appBarColor.shade200),
              subtitle: Text(subtitle, maxLines: 1, style: GoogleFonts.poppins()),

            )));
  }
}
