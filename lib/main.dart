import 'package:bookly_app/features/bookDetailsScreen/presention/view/bookDetailsSCreen.dart';
import 'package:bookly_app/features/homeScreen/presention/views/homeScreen.dart';
import 'package:bookly_app/features/searchScreen/presention/views/searchScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bookly',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0xff100B20),
      ),
      home: const Homescreen(),
    );
  }
}
