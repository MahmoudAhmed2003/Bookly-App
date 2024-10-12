import 'package:bookly_app/features/bookDetails/presention/view/bookDetailsSCreen.dart';
import 'package:bookly_app/features/splash/presentation/viewModel/splashScreen.dart';
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
      home: Bookdetailsscreen(),
        
    );
  }
}

