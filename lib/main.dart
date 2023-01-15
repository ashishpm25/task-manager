import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:task_manager/mainscreen/main_screen.dart';
import 'package:task_manager/tab_bar_pages/AddNotes.dart';
import 'package:task_manager/tab_bar_pages/Timeline.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainScreen(),
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(scaffoldBackgroundColor: const Color(0xFFEFEFEF)),
      initialRoute: '/',
      routes: {
        '/AddNote':(context)=>AddNotes(),
      },
    );
  }
}
