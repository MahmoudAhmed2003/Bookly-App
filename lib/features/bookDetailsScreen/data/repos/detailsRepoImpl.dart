import 'package:bookly_app/core/errors/failure.dart';
import 'package:bookly_app/core/utils/apiService.dart';
import 'package:bookly_app/features/bookDetailsScreen/data/repos/detailsRepo.dart';
import 'package:bookly_app/features/homeScreen/data/models/booksModel/books_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class DetailsRepoImpl extends DetailsRepo {
  final Apiservice apiservice;

  DetailsRepoImpl(this.apiservice);

  @override
  Future<Either<Failure, BooksModel>> getSimilarBooks(
      {required String category}) async {
    try {
      final data = await apiservice.get(
          endPoint:
              'volumes?q=subject:$category&download=epub&sorting=relevance');
      BooksModel books;
      // log('data= ' + data.toString());
      books = BooksModel.fromJson(data);

      return Right(books);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioExp(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
