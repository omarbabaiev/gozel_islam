import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gozel_islam/screens/menu_pages/youtube_card/screens/home_screen.dart';
import '../../../../../../Constants.dart';
import 'package:shimmer/shimmer.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../menu_pages/youtube_card/models/channel_model.dart';
import '../menu_pages/youtube_card/models/video_model.dart';
import '../menu_pages/youtube_card/services/api_service.dart';

class SohbetCard extends StatefulWidget {
  @override
  State<SohbetCard> createState() => _SohbetCardState();
}

class _SohbetCardState extends State<SohbetCard> {
  Channel? _channel;
  bool _isLoading = false;
  late YoutubePlayerController _controller;
  Video? video;
  @override
  void initState() {
    super.initState();

    _initChannel();
  }

  _initChannel() async {
    Channel channel = await APIService2.instance
        .fetchChannel(channelId: 'UCV5G4F5n17ZCVWtGUxJ6z4A');
    setState(() {
      _channel = channel;
      video = _channel!.videos[0];
    });
  }

  Future<void> sss() async {
    _controller.pause();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, right: 10, left: 10, bottom: 10) ,
        child: Container(
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onInverseSurface,
              borderRadius: BorderRadius.circular(15)
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _isLoading
                  ? ClipRRect(
                borderRadius: BorderRadius.only(topRight: Radius.circular(10), topLeft: Radius.circular(10)),
                    child: YoutubePlayer(
                topActions: [],
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
                  )
                  : InkWell(
                onTap: () {
                  setState(() {
                    _isLoading = true;
                    _controller = YoutubePlayerController(
                      initialVideoId: video!.id,
                      flags: YoutubePlayerFlags(
                        showLiveFullscreenButton: false,
                        mute: false,
                        autoPlay: true,
                      ),
                    );
                  });
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.only(topRight:  Radius.circular(10) , topLeft: Radius.circular(10)),
                  child: _channel != null
                      ? SizedBox(
                    height: 220,
                        child: Stack(
                    alignment: Alignment.center,
                    children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: FadeInImage(
                            fit: BoxFit.fitHeight,
                            placeholder: AssetImage("assets/logi.jpg",),
                           image: NetworkImage("${video!.thumbnailUrl}"),
                          ),
                        ),
                    ],
                  ),
                      )
                      : Image.asset(
                        "assets/logi.jpg",
                        width: MediaQuery.of(context)
                            .size
                            .width /
                            3,
                      ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: OutlinedButton(
                        onPressed: () async {
                          sss();
                          Navigator.push(context, CupertinoPageRoute(builder: (context)=>YouTubeCard()));
                        },
                        child: Text(
                          "Daha çox", style: GoogleFonts.poppins(),

                        )),
                  ),
                  IconButton(
                      onPressed: () async {

                        // await Share.share("https://www.youtube.com/watch?v=${video!.id}");
                      },
                      icon: Icon(
                        Icons.share,
                        color: appBarColor,
                      )),
                ],
              ),
              SizedBox(height: 10,)

            ],
          ),
        ),
    );
  }
}
