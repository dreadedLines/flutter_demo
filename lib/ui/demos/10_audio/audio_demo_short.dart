import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class AudioDemoShort extends StatefulWidget {
  const AudioDemoShort({super.key});

  @override
  State<AudioDemoShort> createState() => _AudioDemoShortState();
}

// sounds are from pixabay.com
class _AudioDemoShortState extends State<AudioDemoShort> {
  late AudioPlayer player;
  late AudioPlayer player2; // player2 allows playing second track at the same time

  @override
  void initState() {
    super.initState();
    player = AudioPlayer();
    player2 = AudioPlayer();
  }

  @override
  void dispose() {
    player.dispose();
    player2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Short sounds"),),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                // BUG: player doesn't change asset from the first one
                // this is fixed by putting await player.stop();
                onPressed: () async {
                  await player.setAsset('assets//audio//cow_moo.mp3');
                  player.play();
                },
                child: const Text('Cow'),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: () async {
                  await player2.setAsset('assets/audio/dog_bark.mp3');
                  await player2.stop();
                  player2.play();
                },
                child: const Text('Dog'),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: () async {
                  const url = "https://cdn.pixabay.com/audio/2026/01/12/audio_0b6e6e3fc0.mp3";
                  await player2.stop();
                  await player2.setUrl(url);
                  player2.play();
                },
                child: const Text('Cat'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}