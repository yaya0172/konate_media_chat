import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'theme.dart';
import 'screens/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const KonateMediaChatApp());
}

class KonateMediaChatApp extends StatelessWidget {
  const KonateMediaChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KONATE MEDIA CHAT',
      debugShowCheckedModeBanner: false,
      theme: KMTheme.lightTheme,
      home: const SplashScreen(),
    );
  }
}
