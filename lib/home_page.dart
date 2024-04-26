import 'package:flutter/material.dart';
import 'package:video_player_flutter/widgets/flutter_video_player.dart';
import 'package:video_player_flutter/youtube_player_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        title: const Text(
          "Video Players",
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              videoPlayerWidget("Play Normal Video", 1),
              const SizedBox(
                height: 20,
              ),
              videoPlayerWidget("Play Youtube Video", 2),
            ],
          ),
        ),
      ),
    );
  }

  videoPlayerWidget(String title, int index) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: const BorderRadius.all(Radius.circular(8.0)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(
                Icons.play_circle_outline,
                color: Colors.blue,
                size: MediaQuery.of(context).size.height * 0.05,
              ),
              onPressed: () {
                if (index == 1) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FlutterVideoPlayer(
                          videoUrl:
                              "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4"),
                    ),
                  );
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const YoutubePlayerPage(),
                    ),
                  );
                }
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.02,
            ),
            Text(
              title,
              style: const TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
