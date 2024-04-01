import 'package:flutter/material.dart';
import '../../contents/contents.dart';
import '../../state_bar/appbar.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../state_bar/bottombar.dart';

class VideoScreen extends StatefulWidget {
  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, String?>;

    final YoutubePlayerController _con = YoutubePlayerController(
        initialVideoId: args['video']!,
        flags: const YoutubePlayerFlags(
          autoPlay: true,
          mute: false,
          disableDragSeek: false,
          loop: true,
          isLive: false,
          forceHD: false,
          enableCaption: true,
        ));

    return Scaffold(
      appBar: Appbar_screen(isMainScreen: false),
      body: Column(
        children: [
          TitleBanner(
            text: '퀴즈! 퀴즈!',
          ),
          SizedBox(
            height: 30,
          ),
          Center(
            child: YoutubePlayer(
              bottomActions: [
                CurrentPosition(),
                ProgressBar(
                  isExpanded: true,
                  colors: ProgressBarColors(
                    playedColor: Colors.red, // 재생된 부분의 색상 설정
                    handleColor: Colors.redAccent, // 핸들의 색상 설정
                  ),
                ),
              ],
              controller: _con,
              showVideoProgressIndicator: true,
              progressColors: ProgressBarColors(playedColor: Colors.red),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: BottomFAB(),
      bottomNavigationBar: BottomScreen(),
    );
  }
}