import 'package:bookly_app/core/utils/assets.dart';
import 'package:bookly_app/features/bookDetails/presention/view/widgets/widgets.dart';
import 'package:bookly_app/features/home/presention/views/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Bookdetailsscreen extends StatelessWidget {
  const Bookdetailsscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: w * 0.08),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CustomBookDetailsAppbar(),
              SizedBox(
                height: h * 0.04,
              ),
              SizedBox(
                height: h * 0.3,
                child: const BookPic(),
              ),
              SizedBox(
                height: h * 0.04,
              ),
              const Text(
                'The Jungle Book',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.normal,
                ),
              ),
              // SizedBox(
              //   height: h * 0.02,
              // ),
              const Text(
                'Rudyard Kipling',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    color: Colors.grey),
              ),
              const BookRating(),
              
            ],
          ),
        ),
      ),
    );
  }
}
