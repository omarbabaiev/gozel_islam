import 'dart:ui';

import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gozel_islam/screens/menu_pages/youtube_card/screens/video_screen.dart';
import '../../../../../../../Constants.dart';
import '../models/channel_model.dart';
import '../models/video_model.dart';
import '../services/api_service.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';



class YouTubeCard extends StatefulWidget {
  @override
  _YouTubeCardState createState() => _YouTubeCardState();
}

class _YouTubeCardState extends State<YouTubeCard> {
  Channel? _channel;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _initChannel();
  }

  _initChannel() async {
    Channel channel = await APIService.instance
        .fetchChannel(channelId: 'UCV5G4F5n17ZCVWtGUxJ6z4A');
    setState(() {
      _channel = channel;
    });
  }
  void _launchUrl(String patha) async {
    if (!await launch(Uri.parse(patha).toString(), forceSafariVC: true, forceWebView: false )) throw 'Could not launch $patha';
  }
  _buildProfileInfo() {
    return Container(

      margin: EdgeInsets.all(3.0),
      padding: EdgeInsets.all(10.0),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 1),
            blurRadius: 6.0,
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(

                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 60.0,
                  backgroundImage: AssetImage("assets/youtube_logo.jpg"),
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.red.shade100, width: 5),
                    color: Colors.tealAccent,
                    shape: BoxShape.circle
                ),
              ),

              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    _channel!.title,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    '${_channel!.subscriberCount} abunəçi',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    '${_channel!.videoCount} video',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  ElevatedButton( style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    onPressed: (){
                    _launchUrl("https://www.youtube.com/channel/UCV5G4F5n17ZCVWtGUxJ6z4A");

                  }, child: Text("Abunə Ol", style: GoogleFonts.alata(color: Colors.white),),)
                ],
              )
            ],
          ),
          Divider(),
          SizedBox(height: 10,),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(color: appBarColor.shade100),
              borderRadius: BorderRadius.circular(20)
            ),
            child: Text("Əhli-sünnət alimlərinin qiymətli əsərlərini qaynaq alaraq "
                "əhli-sünnət etiqadına uyğun olaraq hazırlanmışdır. Kanalımızdakı məlumatlar bütün insanların "
                "istifadəsi üçün hazırlanmışdır. Əslinə sadiq qalmaq şərtilə, icazə almadan hər kəs istədiyi kimi "
                "istifadə edə bilər.", style: GoogleFonts.alata(fontSize: 16), textAlign: TextAlign.start,),
          )
        ],
      ),
    );
  }

  _buildVideo(Video video, int index) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Stack(
        children: [
         InkWell(
           onTap: (){Navigator.push(context, CupertinoPageRoute(builder: (context) =>VideoScreen(id: video, hero: index.toString(), )),);},
           child: Container(
                  margin: EdgeInsets.symmetric( ),
                  height: 88.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.red.shade100,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        offset: Offset(0, 1),
                        blurRadius: 6.0,
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        flex: 6,
                        child: Stack(
                          children: [
                            ClipRRect(child: Hero(
                              tag: index.toString(),
                              child: FadeInImage(
                                placeholder: AssetImage("assets/logi.jpg"),
                                image: NetworkImage(video.thumbnailUrl),),
                            ),

                              borderRadius: BorderRadius.circular(10),
                            ),
                          ],
                        ),
                      ),
                      Expanded(child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: VerticalDivider(thickness: 2,),
                      )),
                      Expanded(
                        flex: 7,
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                              video.title,
                              style: GoogleFonts.alata(fontSize: 14, fontWeight: FontWeight.w500)
                          ),
                        ),
                      ),
                    ],
                  ),

            ),
         ),


        ],
      ),
    );
  }

  _loadMoreVideos() async {
    setState((){
      _isLoading = true;

    });

   var moreVideos = await APIService.instance
        .fetchVideosFromPlaylist(playlistId: _channel!.uploadPlaylistId);
    List<Video> allVideos = _channel!.videos..addAll(moreVideos);
    setState(() {
      _channel!.videos = allVideos;
      _isLoading = false;
    });

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
        title: Text("Dini Videolar", style: GoogleFonts.arimaMadurai(color: Colors.white, fontWeight: FontWeight.bold, ),),

      ),
      body: _channel != null
          ? NotificationListener<ScrollNotification>(
              onNotification: (ScrollNotification scrollDetails) {
                if (!_isLoading &&
                    _channel!.videos.length != int.parse(_channel!.videoCount) &&
                    scrollDetails.metrics.pixels ==
                        scrollDetails.metrics.maxScrollExtent) {
                  _loadMoreVideos();
                }
                return false;
              },
              child: SizedBox(
                child:Animate(
                  effects: [FadeEffect(), ],
                  child:
                  Stack(
                  children: [
                    Scrollbar(
                      child: ListView.builder(
                        padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width /30, vertical: 100),
                        itemCount: 1 + _channel!.videos.length,
                        itemBuilder: (BuildContext context, int index) {
                          if (index == 0) {
                            return _buildProfileInfo();
                          }
                          Video video = _channel!.videos[index - 1];
                          return _buildVideo(video, index);
                        },
                      ),
                    ),
                    _isLoading ? Container(
                      child: Center(
                        child: CircularProgressIndicator()
                      ),
                      color: Colors.black54,
                      width: double.infinity,
                      height: double.infinity,
                    ) : SizedBox()
                  ],
                ),
              ),)
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
