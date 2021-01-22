import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'Pages/firstpage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

//  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
//     systemNavigationBarColor: Colors.grey, // navigation bar color
//     statusBarColor: Colors.grey, // status bar color
//   ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // FlutterStatusbarcolor.setStatusBarColor(Colors.white);

    return MaterialApp(
      theme: ThemeData(fontFamily: "Cairo"),
      debugShowCheckedModeBanner: false,
      home: FirstPage(),
    );
  }
}
