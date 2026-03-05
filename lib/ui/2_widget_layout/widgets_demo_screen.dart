import 'package:flutter/material.dart';

class WidgetsLayoutDemo extends StatelessWidget {
  const WidgetsLayoutDemo({super.key});

  @override
  Widget build(BuildContext context) {
    const elevatedButtonName = "AAAAAAAAAAAAAAA";
    const outlinedButtonName = "BBBBBBBBB";
    return Scaffold(
      appBar: AppBar(title: Text("Layout of widgets"),),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            verticalDirection: VerticalDirection.up,
            children: [
              Text("Hello", textDirection: TextDirection.rtl,),
              ColoredBox(color: Color(0xFF00FF00), child: Text("World")),
              Icon(Icons.add_card_outlined, ),
              Row(children: [
                Icon(Icons.menu, ),
                Icon(Icons.home , ),
                Icon(Icons.arrow_back, ),
              ],),
              ElevatedButton(onPressed: () {
                // print("Elevated button $elevatedButton_name was clicked");
              }, child: Text(elevatedButtonName)),
              OutlinedButton(onPressed: () {
                // print("Outlined button $outlinedButton_name was clicked");
              }, child: Text(outlinedButtonName))
            ],
          ),
        ),
      ),
    );
  }
}