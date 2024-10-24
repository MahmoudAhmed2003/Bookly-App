
import 'package:bookly_app/core/utils/bookListItem.dart';
import 'package:bookly_app/features/homeScreen/data/models/booksModel/books_model.dart';
import 'package:bookly_app/features/homeScreen/data/models/booksModel/item.dart';
import 'package:flutter/material.dart';

class BestSellersList extends StatelessWidget {
  const BestSellersList({
    super.key,
    required this.bookData,
    required this.h,
  });
  final BooksModel bookData;
  final double h;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: bookData.items!.length,
      itemBuilder: (context, index) {
        return Padding(
          padding:
              EdgeInsets.symmetric(vertical: h * 0.01),
          child: BookLIstItem(
              bookData: bookData.items![index]),
        );
      },
    );
  }
}
