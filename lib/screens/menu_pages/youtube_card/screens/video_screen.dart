import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../../../Constants.dart';
import '../models/video_model.dart';

class VideoScreen extends StatefulWidget {

  final Video id;

  VideoScreen({required this.id, });

  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {

  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.id.id,
      flags: YoutubePlayerFlags(
        showLiveFullscreenButton: false,
        mute: false,
        autoPlay: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        actions: [IconButton( onPressed: () {  }, icon: Icon(Icons.share),)],
        scrolledUnderElevation: 3,
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        backgroundColor: appBarColor,
        title: Text("${widget.id.title}", style: GoogleFonts.arimaMadurai(color: Colors.white, fontWeight: FontWeight.bold, ),),

      ),


      body: Center(
        child: YoutubePlayer(
          bottomActions: [
            CurrentPosition(),
            ProgressBar(isExpanded: true),
            RemainingDuration()
          ],
          controller: _controller,
          showVideoProgressIndicator: true,
          onReady: () {
            print('Player is ready.');
          },
        ),
      ),
    );
  }
}