import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:video_player/video_player.dart';

class VideoListGenerator extends StatelessWidget {
  int index;

  VideoListGenerator({Key? key, required this.index}) : super(key: key);
   var videoUrlList = [
    'https://assets.mixkit.co/videos/preview/mixkit-girl-in-neon-sign-1232-large.mp4',
    'https://assets.mixkit.co/videos/preview/mixkit-portrait-of-a-woman-in-a-pool-1259-large.mp4',
    'https://assets.mixkit.co/videos/preview/mixkit-mother-with-her-little-daughter-eating-a-marshmallow-in-nature-39764-large.mp4',
    'https://assets.mixkit.co/videos/preview/mixkit-red-frog-on-a-log-1487-large.mp4',
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
         Container(
          // color: Colors.accents[index % Colors.accents.length],
          child: FastVideoPlayer(
            index: index,
            videoUrls: videoUrlList,
            onStateChanged: (bool) {},
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween ,
              //left
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.black.withOpacity(.5),
                  child: IconButton(onPressed: (){}, icon:Icon(Icons.volume_off,size: 30,)),
                ),
                //right
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage("https://www.themoviedb.org/t/p/w300_and_h450_bestv2/iwIdajr5Y4zq2ibvq75VnDAJBr.jpg"),
                        ),
                      ),
                      kHieght,
                    VideoActionWidgets(icon: Icons.emoji_emotions, title: "LOL"),
                   kHieght, 
                    VideoActionWidgets(icon: Icons.add, title: "My List"),
                              kHieght,
                    VideoActionWidgets(icon: Icons.share, title: "Share"),
                              kHieght,
                    VideoActionWidgets(icon: Icons.play_arrow, title: "Play"),
                              kHieght,
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
class VideoActionWidgets extends StatelessWidget {
  final IconData icon;
  final String title;
   VideoActionWidgets({Key? key,required this.icon,required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon,color: kWhiteColor,size: 30,),
        Text(title,style: TextStyle(fontSize: 16,))
      ],
    );
  }
}
class FastVideoPlayer extends StatefulWidget {
  final List<String> videoUrls;
  final index;
  final void Function(bool isPlaying) onStateChanged;
  const FastVideoPlayer({
    Key? key,
    required this.index,
    required this.videoUrls,
    required this.onStateChanged,
  }) : super(key: key);

  @override
  State<FastVideoPlayer> createState() => _FastVideoPlayerState();
}

class _FastVideoPlayerState extends State<FastVideoPlayer> {
  late VideoPlayerController _videoController;

  @override
  void initState() {
    _videoController = VideoPlayerController.network(
        widget.videoUrls[widget.index % widget.videoUrls.length]);
    _videoController.initialize().then((value) {
      setState(() {
        _videoController.play();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: _videoController.value.isInitialized
            ? AspectRatio(
                aspectRatio: _videoController.value.aspectRatio,
                child: VideoPlayer(_videoController),
              )
            : Center(child: CircularProgressIndicator()));
  }

  @override
  void dispose() {
    _videoController.dispose();
    super.dispose();
  }
}
