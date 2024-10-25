import 'package:bookly_app/core/utils/appRoutes.dart';
import 'package:bookly_app/core/utils/serviceLocator.dart';
import 'package:bookly_app/features/homeScreen/data/repos/homeRepoImpl.dart';
import 'package:bookly_app/features/homeScreen/presention/ViewModel/featuredBooksCubit/featured_books_cubit.dart';
import 'package:bookly_app/features/homeScreen/presention/ViewModel/newestBooksCubit/newest_books_cubit.dart';
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
          create: (context) =>
              FeaturedBooksCubit(getIt.get<Homerepoimpl>())..getFeaturedBooks(),
        ),
        BlocProvider(
          create: (context) =>
              NewestBooksCubit(getIt.get<Homerepoimpl>())..getNewestBooks(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRoutes.router,
        debugShowCheckedModeBanner: false,
        title: 'Bookly',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Color(0xff100B20),
        ),
      ),
    );
  }
}

