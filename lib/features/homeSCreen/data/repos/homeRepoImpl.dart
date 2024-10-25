import 'dart:developer';

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
  Future<Either<Failure, BooksModel>> getNewestBooks() async {
    try {
      final data = await apiservice.get(
          endPoint:
              'volumes?q=subject:computer Science&Filtering=free-ebooks&download=epub&sorting=newest');
      BooksModel books;

      books = BooksModel.fromJson(data);

      return Right(books);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioExp(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, BooksModel>> getFeaturedBooks() async {
    try {
      final data = await apiservice.get(
          endPoint:
              'volumes?q=subject:programming&Filtering=free-ebooks&download=epub&sorting=featured');
      BooksModel books;
      log('data= ' + data.toString());
      books = BooksModel.fromJson(data);

      return Right(books);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioExp(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, BooksModel>> getSimilardBooks(
      {required String category}) async {
    try {
      final data = await apiservice.get(
          endPoint:
              'volumes?q=subject:programming&Filtering=free-ebooks&download=epub&sorting=relevance');
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
