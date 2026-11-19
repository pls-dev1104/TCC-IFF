import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';


class Tutorial extends StatefulWidget {
  const new({super.key});

  @override
  State<Tutorial> createState() => _TutorialState();
}

class _TutorialState extends State<Tutorial> {
  late final YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController.fromVideoId(
      videoId: 'JD6Y4PNThSI',
      autoPlay: false,
      params: const YoutubePlayerParams(
        showControls: true,
        showFullscreenButton: true,
      ),
    );
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text("Tutorial", style: TextStyle(color: Colors.white ),),),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
                YoutubePlayer(
            controller: _controller,
            aspectRatio: 16 / 9,
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text('Outros elementos da sua tela aqui...'),
          ),
            ],
          ),
        ),
      ),
    );
  }
}