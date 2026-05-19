import 'package:demo/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class LocalisationDemo extends StatefulWidget {
  const LocalisationDemo({super.key});

  @override
  State<LocalisationDemo> createState() => _LocalisationDemoState();
}

class _LocalisationDemoState extends State<LocalisationDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Localisation demo"),),
      body: Center(
        child: Text(AppLocalizations.of(context)!.helloWorld, style: TextStyle(fontSize: 30),),
      ),
    );
  }
}