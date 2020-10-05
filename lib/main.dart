import 'package:dailybio/services/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/bio_pages.dart';
import 'package:dailybio/screens/AuthScreens/login_screen.dart';
import 'package:dailybio/screens/AuthScreens/register_screen.dart';

void main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  } catch (e) {
    print(e);
  }
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthService()),
      ],
      child: MaterialApp(
        initialRoute: 'bios',
        routes: {
          'login': (context) => LoginScreen(),
          'register': (context) => RegisterScreen(),
          'bios': (context) => BioPages(),
        },
      ),
    ),
  );
}
