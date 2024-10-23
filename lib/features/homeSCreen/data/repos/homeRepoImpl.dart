import 'package:bookly_app/core/errors/failure.dart';
import 'package:bookly_app/core/utils/apiService.dart';
import 'package:bookly_app/features/homeScreen/data/models/booksModel/books_model.dart';
import 'package:bookly_app/features/homeScreen/data/repos/homeRepo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class Homerepoimpl extends Homerepo {
  final Apiservice apiservice;
  Homerepoimpl(this.apiservice);

  @override
  Future<Either<Failure, List<BooksModel>>> getNewestBooks() async {
    try {
      final data = await apiservice.get(
          endPoint:
              'volumes?q=subject:programming&Filtering=free-ebooks&download=epub&sorting=newest');
      List<BooksModel> books = [];
      for (var item in data['items']) {
        books.add(BooksModel.fromJson(item));
      }
      return Right(books);
    } catch (e ) {
      if(e is DioException){
              return Left(ServerFailure.fromDioExp(e));
      }
        return Left(ServerFailure(e.toString()));

      
    }
  }

  @override
  Future<Either<Failure, List<BooksModel>>> getFeaturedBooks() {
    // TODO: implement getFeaturedBooks
    throw UnimplementedError();
  }
}
