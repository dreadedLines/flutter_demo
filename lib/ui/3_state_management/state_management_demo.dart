import 'package:flutter/material.dart';
import './state_management_manager.dart';

class StateManagementDemo  extends StatefulWidget {
  const StateManagementDemo ({super.key});

  @override
  State<StateManagementDemo> createState() => _StateManagementDemoState();
}

class _StateManagementDemoState extends State<StateManagementDemo> {

  final manager = StateManagementManager();

  @override
  void initState() {
    super.initState();
    manager.init();
  }

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
              Center(
                child:
                  Column(
                    children: [
                      const SizedBox(height: 20,),
                      ValueListenableBuilder(
                        valueListenable: manager.textNotifier, builder: (context, value, child) {
                          return 
                        
                      Container(
                        width: 200,
                        height: 200,
                        child: Align(
                          child: ValueListenableBuilder(
                            valueListenable: manager.colorNotifier,
                            builder: (context, value, child) {
                              return Text(manager.myResponses[manager.textIndex], 
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, fontFamily: "Arial", color: manager.responseColors[manager.responseIndex]));
                            }
                          ),
                        )
                      );
                      }
                      ),
                      const SizedBox(height: 20,),
                      OutlinedButton(onPressed: manager.changeText, child: Text("Change text")),
                      const SizedBox(height: 20,),
                      OutlinedButton(onPressed: manager.changeColor, child: Text("Change color")), 
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