import 'package:flutter/material.dart';

class StateManagementDemo  extends StatelessWidget {
  const StateManagementDemo ({super.key});

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
                        color: Colors.blueGrey,
                        width: 200,
                        height: 200,
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
}