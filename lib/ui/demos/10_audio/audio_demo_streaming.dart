import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';

class AudioDemoStreaming extends StatefulWidget {
  const AudioDemoStreaming({super.key});

  @override
  State<AudioDemoStreaming> createState() => _AudioDemoStreamingState();
}

class _AudioDemoStreamingState extends State<AudioDemoStreaming> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Streaming"),),
      body: Center(
        child:
          Column(
            children: [
              Text("TEXT"),
              // const Spacer(),
              Container(
                // color: Colors.grey,
                child: 
                  const ProgressBar(progress: Duration.zero, total: Duration.zero),
              ),
              Text("TEXT"),
              IconButton(onPressed: () {
                
              }, icon: const Icon(Icons.panorama_fish_eye))
            ],
          )
      ),
    );
  }
}