import 'package:demo/ui/settings/settings_manager.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final manager = SettingsManager();

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: manager.appState,
      builder: (builder, child) {
        return Scaffold(
          appBar: AppBar(title: Text("Settings"),),
          body: ListView(
            children: [
              ListTile(
                title: Text("Theme"),
                subtitle: Text(manager.currentThemeTitle),
                onTap: () {
                  _showThemeDialog();
                },
              )
            ],
          ),
      );}
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
            ButtonSegment(value: ThemeMode.system, icon: Icon(Icons.phone_android)),
            ButtonSegment(value: ThemeMode.dark, icon: Icon(Icons.bedtime)),
          ], 
          selected: 
            {manager.currentTheme},
          onSelectionChanged: (Set<ThemeMode> selection) {
            manager.setTheme(selection.first);
            
          },
        ),
      )
    );
  }

}