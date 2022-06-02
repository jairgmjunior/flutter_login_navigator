import 'package:flutter/material.dart';
import 'package:splash_screen_login/pages/datails_page.dart';
import 'package:splash_screen_login/pages/home_page.dart';
import 'package:splash_screen_login/pages/login_page.dart';
import 'package:splash_screen_login/pages/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Splash',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.blueGrey,
          accentColor: Colors.lightBlue,
        ),
        textTheme: const TextTheme(
          bodyText2: TextStyle(color: Colors.black),
          bodyText1: TextStyle(color: Colors.blue),
        ),
      ),
      initialRoute: '/splash',
      routes: {
        '/splash': (_) => const SplashPage(),
        '/login': (_) => LoginPage(),
        '/home': (_) => const HomePage(),
        '/details': (_) => const DetailsPage(),
      },
    );
  }
}
