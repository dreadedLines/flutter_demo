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
                      Container(
                        color: manager.myColors[colorIndexNotifier.value],
                        width: 200,
                        height: 200,
                        child: Align(
                          child: ValueListenableBuilder(
                            valueListenable: colorIndexNotifier,
                            builder: (context, value, child) {
                              return Text(myResponses[textIndex], 
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, fontFamily: "Arial", color: responseColors[responseIndex]));
                            }
                            ),
                        )
                          },
                        ),
                      ),
                      const SizedBox(height: 20,),
                      OutlinedButton(onPressed: changeText, child: Text("Change text")),
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