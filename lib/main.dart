

import 'dart:ui';
import 'package:intl/intl_standalone.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sokh/signin_login/login.dart';
import 'package:sokh/signin_login/signin.dart';
import 'package:sokh/firebase_options.dart';
import 'package:sokh/provider/app_drawer_provider.dart';
import 'package:sokh/provider/my_home_page_provider.dart';
import 'my_home_page/my_home_page.dart';
import 'firebase_options.dart';



    Future <void> main() async{
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
  runApp(
      MultiProvider(
         providers: [
        ChangeNotifierProvider<MyHomePageProvider>(create: (_)=>MyHomePageProvider()),
        ChangeNotifierProvider<AppDrawerProvider>(create: (_)=>AppDrawerProvider()),
        ChangeNotifierProvider<WeatherProvider>(create: (_)=>WeatherProvider()),
    ],
       child: MyApp())
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       home: MyHomePage()
       ///FirebaseAuth.instance.currentUser==null? LogIN():MyHomePage() ///comment out if you want to show the login page on start
    );
  }
}






