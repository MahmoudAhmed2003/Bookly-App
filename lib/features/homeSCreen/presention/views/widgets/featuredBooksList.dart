import 'package:bookly_app/core/utils/appRoutes.dart';
import 'package:bookly_app/features/homeScreen/data/models/booksModel/books_model.dart';
import 'package:bookly_app/features/homeScreen/presention/views/widgets/resentBooksItem.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FeaturedBooksList extends StatelessWidget {
  const FeaturedBooksList({
    super.key,
    required this.h,
    required this.w,
    required this.booksList,
  });

  final double h;
  final double w;
  final BooksModel booksList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: h * 0.25,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        scrollDirection: Axis.horizontal,
        itemCount: booksList.items!.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(right: w * 0.05),
            child: GestureDetector(
                onTap: () {
                  GoRouter.of(context).push(AppRoutes.detailsScreenRout,
                      extra: booksList.items![index]);
                },
                child:
                    HomePageRecentListItem(bookData: booksList.items![index])),
          );
        },
      ),
    );
  }
}
