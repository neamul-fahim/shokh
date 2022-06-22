
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sokh/provider/my_home_page_provider.dart';
import 'my_home_page/my_home_page.dart';



    Future <void> main() async{
  runApp(
      MultiProvider(
    providers: [
      ChangeNotifierProvider<MyHomePageProvider>
        (create: (_)=>MyHomePageProvider()),
    ],
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       home: MyHomePage()

    );
  }
}






