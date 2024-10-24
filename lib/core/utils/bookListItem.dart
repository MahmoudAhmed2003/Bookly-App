import 'package:bookly_app/core/utils/assets.dart';
import 'package:bookly_app/core/utils/bookRating.dart';
import 'package:bookly_app/core/utils/customBookPic.dart';
import 'package:bookly_app/features/homeScreen/data/models/booksModel/books_model.dart';
import 'package:bookly_app/features/homeScreen/data/models/booksModel/item.dart';
import 'package:flutter/material.dart';

class BookLIstItem extends StatelessWidget {
  const BookLIstItem({super.key, required this.bookData});
  final Item bookData;

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Row(
      children: [
        SizedBox(
            height: h * 0.13,
            width: w * 0.2,
            child: BookPic(
                w: w, imageUrl: bookData.volumeInfo!.imageLinks!.thumbnail)),
        SizedBox(
          width: w * 0.04,
        ),
        SizedBox(
          width: w * 0.6,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                bookData.volumeInfo!.title.toString(),
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              Text(bookData.volumeInfo!.authors!.join(', '),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 16, color: Colors.grey)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('0.0\$',
                      style: TextStyle(fontSize: 16, color: Colors.white)),
                  BookRating(
                      pageCount: bookData.volumeInfo!.pageCount.toString()),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
