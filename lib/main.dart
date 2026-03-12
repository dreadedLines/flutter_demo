import 'package:demo/services/auth/auth.dart';
import 'package:demo/services/local_storage/local_storage.dart';
import 'package:flutter/material.dart';

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

  runApp(FlutterDemoApp());
}

class FlutterDemoApp extends StatelessWidget {
  const FlutterDemoApp({super.key});

    @override
    Widget build(BuildContext context) {
        return MaterialApp(home: const HomeScreen(), debugShowCheckedModeBanner: false,);
    }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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

class DraggableContainer extends StatelessWidget {
  const DraggableContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}