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
              // 3 modes: phone setting, dark, light
              _showThemeDialog();
            },
          )
        ],
      ),
    );
  }

  ThemeMode theme = ThemeMode.system;

  Future<ThemeMode?> _showThemeDialog() async {
    return await showDialog(
      context: context, 
      builder: (context) => AlertDialog(
        content: SegmentedButton(
          segments: [
            ButtonSegment(value: ThemeMode.light, icon: Icon(Icons.sunny)),
            ButtonSegment(value: ThemeMode.system, icon: Icon(Icons.sunny)),
            ButtonSegment(value: ThemeMode.dark, icon: Icon(Icons.sunny)),
          ], 
          selected: 
            Set()
        ),
      )
    );
  }

}