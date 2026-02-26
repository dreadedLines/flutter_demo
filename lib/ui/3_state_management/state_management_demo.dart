import 'package:flutter/material.dart';

class StateManagementDemo  extends StatefulWidget {
  const StateManagementDemo ({super.key});

  @override
  State<StateManagementDemo> createState() => _StateManagementDemoState();
}

class _StateManagementDemoState extends State<StateManagementDemo> {
  var myColors = [Colors.red, Colors.orange, Colors.amber, Colors.lime, Colors.indigo, Colors.brown, Colors.white];
  final colorIndexNotifier = ValueNotifier(0);

  int textIndex = 0;
  int responseIndex = 0;
  final myResponses = ["Hello", "World", "How is your day?", "This works", "Good"];
  final responseColors = [
    Color(
      // 0xFFFFFFFF - myColors[textIndex].toARGB32()
      0x00000000
    ),
    Color(
      0xffffffff
    )
  ];

  @override
  Widget build(BuildContext context) {
    int myVal = 10;
    return Scaffold(
      appBar: AppBar(title: Text("Layout of widgets"),),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Text("Hello", textDirection: TextDirection.rtl,),
              ColoredBox(color: Color(0xFF00FF00), child: Text("World")),
              Icon(Icons.add_card_outlined, ),
              Row(children: [
                Icon(Icons.menu, ),
                Icon(Icons.home , ),
                Icon(Icons.arrow_back, ),
              ],),
              ColoredBox(color: Color(0xffffff00), child: Text(myVal.toString(), style: TextStyle(fontSize: 30),)),
              TextButton(onPressed: () {}, child: Text("Change color")),
              Center(
                child:
                  Column(
                    children: [
                      const SizedBox(height: 20,),
                      Container(
                        color: myColors[colorIndexNotifier.value],
                        width: 200,
                        height: 200,
                        child: Align(
                          child: 
                            Text(myResponses[textIndex], style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, fontFamily: "Arial", 
                            // color: responseColors[responseIndex]
                            ),),
                        ),
                      ),
                      const SizedBox(height: 20,),
                      OutlinedButton(onPressed: () {}, child: Text("Change text")),
                      const SizedBox(height: 20,),
                      OutlinedButton(onPressed: changeColor, child: Text("Change color")),
                      
                    ]
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void changeColor() {
    // setState(() {
      colorIndexNotifier.value = (colorIndexNotifier.value + 1) % myColors.length;
    // });
  }
  void changeText() {
    setState(() {
      textIndex = (textIndex + 1) % myResponses.length;
      responseIndex = (responseIndex + 1) % responseColors.length;
    });
  }
}