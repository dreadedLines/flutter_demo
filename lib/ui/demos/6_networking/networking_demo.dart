import 'package:demo/ui/demos/6_networking/networking_manager.dart';
import 'package:flutter/material.dart';

class NetworkingDemo extends StatefulWidget {
  const NetworkingDemo({super.key});

  @override
  State<NetworkingDemo> createState() => _NetworkingDemoState();
}

class _NetworkingDemoState extends State<NetworkingDemo> {
  final manager = NetworkingManager();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Networking"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ValueListenableBuilder(
              valueListenable: manager.catNotifier, 
              builder: (context, value, child) {
                // return Text(value);
                return Text(value);
              },),
            const SizedBox(height: 30,),
            ElevatedButton(onPressed: () {
              manager.getRequest();
            }, child: Text("GET")),
            const SizedBox(height: 30,),
            ElevatedButton(onPressed: () {
              manager.postRequest();
            }, child: Text("POST")),
          ],
        ),
      )
    );
  }
}