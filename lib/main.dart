import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterproject/firebase_options.dart';
import 'package:flutterproject/screens/home.page.dart';
import 'package:flutterproject/screens/login.page.dart';
import 'package:flutterproject/screens/profile.page.dart';
import 'package:flutterproject/screens/register.page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
          useMaterial3: true),
      title: "Ibtissam SAADALI Flutter App",
      //home: HomePage(),
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginPage(),
        '/home': (context) => HomePage(),
        '/register': (context) => RegisterPage(),
        '/profile': (context) => ProfilePage(),
      },
    );
  }
}
