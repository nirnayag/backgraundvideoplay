import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final VideoPlayerController videoPlayerController =
      VideoPlayerController.asset('assets/vid.mp4');
  ChewieController? chewieController;

  @override
  void initState() {
    chewieController =
        ChewieController(videoPlayerController: videoPlayerController,
        aspectRatio: 9/20,
        autoPlay: true,
        looping: true,
        autoInitialize: true,
        showControls: false
        );
    super.initState();
  }

  @override
void dispose() {
  videoPlayerController.dispose();
  chewieController!.dispose();
  super.dispose();
}

  @override
  Widget build(BuildContext context) {
    
    double screenWidth = MediaQuery.of(context).size.width;
    //     double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Stack(
        children: [
          Chewie(controller: chewieController!,),
        ],
      ),
    );
  }
}
