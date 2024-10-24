import 'package:bookly_app/core/utils/assets.dart';
import 'package:bookly_app/core/utils/bookRating.dart';
import 'package:bookly_app/core/utils/customBookPic.dart';
import 'package:bookly_app/features/homeScreen/data/models/booksModel/item.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePageRecentListItem extends StatelessWidget {
  const HomePageRecentListItem({super.key, required this.bookData});
  final Item bookData;

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return SizedBox(
      // color: Colors.white,

      width: w * 0.35,
      child: BookPic(imageUrl: bookData.volumeInfo!.imageLinks!.thumbnail!),
    );
  }
}
