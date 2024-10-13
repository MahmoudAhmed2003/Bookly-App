import 'package:bookly_app/core/utils/assets.dart';
import 'package:bookly_app/features/bookDetails/presention/view/widgets/widgets.dart';
import 'package:bookly_app/features/home/presention/views/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Bookdetailsscreen extends StatelessWidget {
  const Bookdetailsscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: w * 0.06),
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
                  SizedBox(
                    height: h * 0.02,
                  ),
                  const bookPreviewButton(),
                  SizedBox(
                    height: h * 0.04,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'You can also like',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: h * 0.02,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: w * 0.06),
              child: SizedBox(
                height: h * 0.15,
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(right: w * 0.05),
                      child: SizedBox(
                        // color: Colors.white,
                        width: w * 0.2,
                        child: const BookPic(),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
