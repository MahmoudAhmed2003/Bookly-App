import 'dart:developer';

import 'package:bookly_app/core/utils/appRoutes.dart';
import 'package:bookly_app/core/utils/assets.dart';
import 'package:bookly_app/core/utils/bookRating.dart';
import 'package:bookly_app/core/utils/customBookPic.dart';
import 'package:bookly_app/core/utils/serviceLocator.dart';
import 'package:bookly_app/features/bookDetailsScreen/data/repos/detailsRepoImpl.dart';
import 'package:bookly_app/features/bookDetailsScreen/presention/view/widgets/widgets.dart';
import 'package:bookly_app/features/bookDetailsScreen/presention/viewModel/cubit/similar_books_cubit.dart';
import 'package:bookly_app/features/homeScreen/data/models/booksModel/item.dart';
import 'package:bookly_app/features/homeScreen/presention/views/widgets/resentBooksItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

class Bookdetailsscreen extends StatefulWidget {
  const Bookdetailsscreen({super.key, required this.bookData});
  final Item bookData;

  @override
  State<Bookdetailsscreen> createState() => _BookdetailsscreenState();
}

class _BookdetailsscreenState extends State<Bookdetailsscreen> {
  @override
  void initState() {
    BlocProvider(
      create: (context) => SimilarBooksCubit(getIt.get<DetailsRepoImpl>())
        ..getSimilarBooks(category: widget.bookData.volumeInfo!.categories![0]),
    );
    BlocProvider.of<SimilarBooksCubit>(context)
        .getSimilarBooks(category: 'fiction');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: w * 0.06),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const CustomBookDetailsAppbar(),
                        SizedBox(
                          height: h * 0.04,
                        ),
                        SizedBox(
                          height: h * 0.3,
                          child: BookPic(
                            w: 2,
                            imageUrl: widget
                                .bookData.volumeInfo!.imageLinks!.thumbnail
                                .toString(),
                          ),
                        ),
                        SizedBox(
                          height: h * 0.04,
                        ),
                        Text(
                          widget.bookData.volumeInfo!.title.toString() ?? '',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        // SizedBox(
                        //   height: h * 0.02,
                        // ),
                        Text(
                          widget.bookData.volumeInfo!.authors!.join('\n') ?? '',
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                              color: Colors.grey),
                        ),
                        SizedBox(
                          height: h * 0.02,
                        ),
                        BookRating(
                            pageCount: widget.bookData.volumeInfo!.pageCount
                                    .toString() ??
                                ''),
                        SizedBox(
                          height: h * 0.02,
                        ),
                        bookPreviewButton(
                          onPressed: () async {
                            
                            
                            if (!await launchUrl(Uri.parse(widget
                                .bookData.volumeInfo!.previewLink

                                .toString()??''))) {
                              throw Exception(
                                  'Could not launch ${widget.bookData.volumeInfo!.previewLink}');
                            }
                          },
                        )
                      ],
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: EdgeInsets.only(left: w * 0.06),
                    child: const Text(
                      'You can also like',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: h * 0.02,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: w * 0.06),
                    child: BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
                      builder: (context, state) {
                        if (state is SimilarBooksSuccess) {
                          return SizedBox(
                            height: h * 0.15,
                            child: ListView.builder(
                              padding: EdgeInsets.zero,
                              scrollDirection: Axis.horizontal,
                              itemCount: state.books.items!.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.only(right: w * 0.03),
                                  child: SizedBox(
                                    // color: Colors.white,
                                    width: w * 0.25,
                                    child: GestureDetector(
                                      onTap: () {
                                        GoRouter.of(context).push(
                                            AppRoutes.detailsScreenRout,
                                            extra: state.books.items![index]);
                                      },
                                      child: BookPic(
                                        w: w,
                                        imageUrl: state.books.items![index]
                                            .volumeInfo!.imageLinks!.thumbnail
                                            .toString(),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        } else if (state is SimilarBooksLoading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (state is SimilarBooksFailure) {
                          return Center(
                            child: Text(state.errMessage),
                          );
                        } else {
                          return const Center(
                            child: Text(
                                'Opps! Something went wrong, please try again later'),
                          );
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    height: h * 0.02,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
