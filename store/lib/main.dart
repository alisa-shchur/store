import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:store/ui/login_screen.dart';
import 'package:store/ui/splash_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder: (BuildContext context,child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Магазин электроники',
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.deepPurpleAccent.shade100,
            primarySwatch: Colors.deepPurple,
            textTheme: Theme.of(context).textTheme.apply(
              bodyColor: Colors.white,
              displayColor: Colors.white,
            )
          ),
          home: LoginScreen(),
        );
      },
    );
  }
}
