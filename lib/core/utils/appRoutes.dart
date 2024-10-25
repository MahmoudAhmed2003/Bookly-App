import 'package:bookly_app/core/utils/serviceLocator.dart';
import 'package:bookly_app/features/bookDetailsScreen/data/repos/detailsRepoImpl.dart';
import 'package:bookly_app/features/bookDetailsScreen/presention/view/bookDetailsSCreen.dart';
import 'package:bookly_app/features/bookDetailsScreen/presention/viewModel/cubit/similar_books_cubit.dart';
import 'package:bookly_app/features/homeScreen/data/models/booksModel/item.dart';
import 'package:bookly_app/features/homeScreen/presention/views/homeScreen.dart';
import 'package:bookly_app/features/searchScreen/presention/views/searchScreen.dart';
import 'package:bookly_app/features/splash/presentation/viewModel/splashScreen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRoutes {
  static const homeScreenRout = '/homeScreen';
  static const detailsScreenRout = '/detailsScreen';
  static const searchScreenRout = '/searchScreen';
  static final router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => SplashScreen(),
    ),
    GoRoute(
      path: homeScreenRout,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: detailsScreenRout,
      builder: (context, state) => BlocProvider(
        create: (context) => SimilarBooksCubit(getIt.get<DetailsRepoImpl>()),
          
        child:  Bookdetailsscreen(bookData: state.extra as Item,),
      ),
    ),
    GoRoute(
      path: searchScreenRout,
      builder: (context, state) => const SearchScreen(),
    ),
  ]);
}
