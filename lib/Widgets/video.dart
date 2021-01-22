import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/Screens/homescreen.dart';
import 'package:video_player/video_player.dart';

class Video extends StatefulWidget {
  final VideoPlayerController videoPlayerController;
  final bool loop;
  Video({@required this.videoPlayerController, this.loop, Key key})
      : super(key: key);
  @override
  _VideoState createState() => _VideoState();
}

class _VideoState extends State<Video> {
  ChewieController _chewieController;
  @override
  void initState() {
    super.initState();
    _chewieController = ChewieController(
        videoPlayerController: widget.videoPlayerController,
        looping: widget.loop,
        aspectRatio: 16 / 9,
        autoPlay: true,
        autoInitialize: true);
  }

  @override
  Widget build(BuildContext context) {
    return Chewie(controller: _chewieController);
  }

  @override
  void dispose() {
    super.dispose();
    widget.videoPlayerController.dispose();
    _chewieController.dispose();
  }
}

class VideoPlayer extends StatefulWidget {
  final String videoData;

   VideoPlayer({this.videoData});
  @override
  _VideoPlayerState createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        // leading: IconButton(
        //   icon: Icon(Icons.arrow_back_ios),
        //   onPressed:()=> Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>HomeScreen())),
        // ),
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Video(
            videoPlayerController: VideoPlayerController.network(widget.videoData),
          ),
        ),
      ),
    );
  }
}
