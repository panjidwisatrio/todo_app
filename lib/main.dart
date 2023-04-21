import 'package:exploration_app/detail_screen.dart';
import 'package:exploration_app/login.dart';
import 'package:exploration_app/register.dart';
import 'package:exploration_app/create_screen.dart';
import 'package:exploration_app/main_screen.dart';
import 'package:exploration_app/all_activities.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Exploration',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark,
          ),
        ),
        primarySwatch: Colors.blue,
      ),
      home: const Login(),
      routes: {
        '/login': (context) => const Login(),
        '/register': (context) => const Register(),
        '/Main': (context) => const MainScreen(),
        '/DetailScreen': (context) => const DetailScreen(),
        '/CreateActivity': (context) => const CreateActivity(),
        '/AllActivities': (context) => const AllActivities(),
      },
    );
  }
}
