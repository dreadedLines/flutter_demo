import 'package:demo/ui/demos/10_audio/audio_demo_short.dart';
import 'package:demo/ui/demos/10_audio/audio_demo_streaming.dart';
import 'package:flutter/material.dart';

class AudioDemo extends StatefulWidget {
  const AudioDemo({super.key});

  @override
  State<AudioDemo> createState() => _AudioDemoState();
}

class _AudioDemoState extends State<AudioDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Audio demooo"),),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(onPressed: () {
              Navigator.push(
                context, 
                MaterialPageRoute(builder: (context) => const AudioDemoShort(),),
              );
            }, child: Text("Short sounds")),
            const SizedBox(width: 10),
            ElevatedButton(onPressed: () {
              Navigator.push(
                context, 
                MaterialPageRoute(builder: (context) => const AudioDemoStreaming(),),
              );
            }, child: Text("Streaming")),
            const SizedBox(width: 10),
          ],
        ),
      ),
    );
  }
}