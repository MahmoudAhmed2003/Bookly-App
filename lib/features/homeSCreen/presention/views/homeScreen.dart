import 'package:bookly_app/core/utils/bookListItem.dart';
import 'package:bookly_app/core/utils/customAppBar.dart';
import 'package:bookly_app/features/homeScreen/presention/ViewModel/featuredBooksCubit/featured_books_cubit.dart';
import 'package:bookly_app/features/homeScreen/presention/ViewModel/newestBooksCubit/newest_books_cubit.dart';
import 'package:bookly_app/features/homeScreen/presention/views/widgets/bestSellers.dart';
import 'package:bookly_app/features/homeScreen/presention/views/widgets/featuredBooksList.dart';
import 'package:bookly_app/features/homeScreen/presention/views/widgets/widgets.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const CustomAppBar(),
              Padding(
                padding: EdgeInsets.only(left: w * 0.04),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [ 
                    BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
                      builder: (context, state) {
                        if (state is FeaturedBooksSuccess) {
                          return FeaturedBooksList(
                              h: h, w: w, booksList: state.books);
                        } else if (state is FeaturedBooksLoading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (state is FeaturedBooksFailure) {
                          return Center(
                            child: Text(state.message),
                          );
                        }
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    ),

                    const SizedBox(height: 40),
                    const Text('Best Sellers',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),

                    BlocBuilder<NewestBooksCubit, NewestBooksState>(
                      builder: (context, state) {
                        if (state is NewestBooksSuccess) {
                          return BestSellersList(bookData: state.books, h: h);
                        } else if (state is NewestBooksLoading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (state is NewestBooksFailure) {
                          return Center(
                            child: Text(state.errMessage),
                          );
                        }
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
