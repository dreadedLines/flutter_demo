import 'package:flutter/material.dart';
import './testing_manager.dart';

class TestingDemo extends StatefulWidget {
  const TestingDemo({super.key});

  @override
  State<TestingDemo> createState() => _TestingDemoState();
}

class _TestingDemoState extends State<TestingDemo> {
  final manager = TestingManager();
  final firstController = TextEditingController();
  final secondController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
      appBar: AppBar(),
      body: 
        Center(
          child:
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 50, width: 100, child:TextField(controller: firstController,),),
                Text("+"),
                SizedBox(height: 50, width: 100, child:TextField(controller: secondController,),),
                Text("="),
                ValueListenableBuilder(valueListenable: manager.result, builder: (context, result, child) {
                  return SizedBox(height: 50, width: 100, child: 
                    Text('$result'),
                  );
                },),
                ElevatedButton(
                  onPressed: () {
                    manager.add(firstController.text, secondController.text);
                  },
                  child: Text("Calculate"))
              ],
            ),
          
        )
    ,);
  }
}