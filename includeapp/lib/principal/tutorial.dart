import 'package:flutter/material.dart';
import 'package:includeapp/%20funcoes_widgets/widgets.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class Tutorial extends StatefulWidget {
  const Tutorial({super.key});

  @override
  State<Tutorial> createState() => _TutorialState();
}

class _TutorialState extends State<Tutorial> {
  final List<List<String>> videos = [
    ["tUdmis47FPU", "Receba"],
    ["_ZABVI2ph0Y", "Como ser feliz"],
    ["4EoPvizY1Jk", "É o Tetra"]
  ];
  late final List<YoutubePlayerController> guardadorDosVideos;

  @override
  void initState() {
    super.initState();
    guardadorDosVideos = videos
        .map((video) => YoutubePlayerController.fromVideoId(
          videoId: video[0],
          autoPlay: false,
        ))
        .toList();
  }

  @override
  void dispose() {
    for (final guardar in guardadorDosVideos) {
      guardar.close();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(context, "Tutorial", ""),
      body: SingleChildScrollView(
        child: Column(
          children: [
            for (int i = 0; i < videos.length; i++)
              Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Text(videos[i][1]),
                    SizedBox(height: 8),
                    YoutubePlayer(controller: guardadorDosVideos[i]),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}