import 'package:flutter/material.dart';

class StateManagementDemo  extends StatefulWidget {
  const StateManagementDemo ({super.key});

  @override
  State<StateManagementDemo> createState() => _StateManagementDemoState();
}

class _StateManagementDemoState extends State<StateManagementDemo> {
  final myColors = [Colors.red, Colors.orange, Colors.amber, Colors.lime, Colors.indigo, Colors.brown, Colors.white];

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
                        color: myColors[1],
                        width: 200,
                        height: 200,
                        child: Align(
                          child: 
                            Text("Hello", style: TextStyle(fontSize: 20),),
                        ),
                      ),
                      const SizedBox(height: 20,),
                      OutlinedButton(onPressed: () {}, child: Text("Change text")),
                      const SizedBox(height: 20,),
                      OutlinedButton(onPressed: () {}, child: Text("Change color")),
                      
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
    
  }
}