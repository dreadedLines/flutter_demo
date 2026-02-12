import 'package:flutter/material.dart';

class WidgetsLayoutDemo extends StatelessWidget {
  const WidgetsLayoutDemo({super.key});

  @override
  Widget build(BuildContext context) {
    const ElevatedButton_name = "AAAAAAAAAAAAAAA";
    const OutlinedButton_name = "BBBBBBBBB";
    return Scaffold(
      appBar: AppBar(title: Text("Layout of widgets"),),
      body: Column(
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
            print("Elevated button $ElevatedButton_name was clicked");
          }, child: Text(ElevatedButton_name)),
          OutlinedButton(onPressed: () {
            print("Outlined button $OutlinedButton_name was clicked");
          }, child: Text(OutlinedButton_name))
        ],
      ),

      // bottomNavigationBar: BottomNavigationBar(items: [
      //   BottomNavigationBarItem(
      //       label: ,
      //       icon: const Icon(Icons.code), // Optional: adds a little icon
      //       tooltip: () {
      //         // Navigate to the new screen defined in the other file
      //         Navigator.push(
      //           context,
      //           MaterialPageRoute(builder: (context) => const WidgetsLayoutDemo()),
      //         );
      //       },
      //     ),
      // ]),
    );
  }
}