import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Settings"),),
      body: ListView(
        children: [
          ListTile(
            title: Text("Theme"),
            subtitle: Text("Light mode"),
            onTap: () {
              // TODO: switch between dark mode and light mode
            },
          )
        ],
      ),
    );
  }
}