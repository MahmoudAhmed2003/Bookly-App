import 'package:bookly_app/core/utils/apiService.dart';
import 'package:bookly_app/core/utils/serviceLocator.dart';
import 'package:bookly_app/features/bookDetailsScreen/presention/view/bookDetailsSCreen.dart';
import 'package:bookly_app/features/homeScreen/data/repos/homeRepoImpl.dart';
import 'package:bookly_app/features/homeScreen/presention/ViewModel/featuredBooksCubit/featured_books_cubit.dart';
import 'package:bookly_app/features/homeScreen/presention/ViewModel/newestBooksCubit/newest_books_cubit.dart';
import 'package:bookly_app/features/homeScreen/presention/views/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  getItInit();
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FeaturedBooksCubit(getIt.get<Homerepoimpl>()),
        ),
        BlocProvider(
          create: (context) => NewestBooksCubit(getIt.get<Homerepoimpl>()),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Bookly',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Color(0xff100B20),
        ),
        home: const Homescreen(),
      ),
    );
  }
}
