import 'package:demo/app_state.dart';
import 'package:demo/services/auth/auth.dart';
import 'package:demo/services/local_storage/local_storage.dart';
import 'package:flutter/material.dart';

import 'theme.dart';

import './services/service_locator.dart';
import 'ui/settings/settings_screen.dart';
import 'ui/demos/1_dart/dart_demo_screen.dart';
import 'ui/demos/2_widget_layout/widgets_demo_screen.dart';
import 'ui/demos/3_state_management/state_management_demo.dart';
import 'ui/demos/4_user_login/user_login.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  setupServiceLocator();
  await getIt<LocalStorage>().init();
  await getIt<Auth>().init();
  await getIt<AppState>().init();

  runApp(FlutterDemoApp());
}

class FlutterDemoApp extends StatefulWidget {
  const FlutterDemoApp({super.key});

  @override
  State<FlutterDemoApp> createState() => _FlutterDemoAppState();
}

class _FlutterDemoAppState extends State<FlutterDemoApp> {
  final appState = getIt<AppState>();

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: appState,
      builder: (context, child) {
        return MaterialApp(home: const HomeScreen(), debugShowCheckedModeBanner: false, themeMode: appState.theme);
      }
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(child: Icon(Icons.settings, size: 150,)),
            ListTile(
              title: Text("Settings"),
              onTap: () {
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) => const SettingsScreen(),),
                );
              },
            )
          ],
        ),
      ),
      // A ListView for your items
      body: ListView(
        children: [
          // The single list item requested
          ListTile(
            title: const Text("1. Button"),
            leading: const Icon(Icons.code), // Optional: adds a little icon
            onTap: () {
              // Navigate to the new screen defined in the other file
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const DartDemoScreen()),
              );
            },
          ),
          ListTile(
            title: const Text("2. Another"),
            leading: const Icon(Icons.code), // Optional: adds a little icon
            onTap: () {
              // Navigate to the new screen defined in the other file
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const WidgetsLayoutDemo()),
              );
            },
          ),
          ListTile(
            title: const Text("3. State management"),
            leading: const Icon(Icons.air),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const StateManagementDemo())
              );
            }
          ),
          ListTile(
            title: const Text("4. User login"),
            leading: const Icon(Icons.dangerous),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen())
              );
            }
          ),
        ],
      ),
    );
  }
}