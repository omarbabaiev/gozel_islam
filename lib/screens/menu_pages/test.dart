import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:html/parser.dart' as parser;
import 'package:http/http.dart' as http;
import '../../../Constants.dart';
import 'package:flutter_html/flutter_html.dart';
class Test1 extends StatefulWidget {
  const Test1({Key? key}) : super(key: key);

  @override
  State<Test1> createState() => _Test1State();
}

class _Test1State extends State<Test1> {
  var htmlToParse;
  void makeRequest() async{
    var response = await http.get(Uri.parse('https://dinimizislam.com/detay.asp?Aid=2426'));
    //If the http request is successful the statusCode will be 200
    if(response.statusCode == 200){
      setState(() {
        htmlToParse = response.body;
      });
    }
  }

  @override
  void initState() {
    makeRequest();
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {

      },),
      body: htmlToParse == null ? Center(child: CircularProgressIndicator(),) :
      Html(
        data: htmlToParse,
        // Styling with CSS (not real CSS)
        style: {
          /* ... */
        },
      ),
    );
  }
}
