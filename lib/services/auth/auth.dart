import 'package:demo/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

class Auth {
  
  Future<void> init() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }
}