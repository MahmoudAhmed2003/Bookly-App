import 'package:bookly_app/core/errors/failure.dart';
import 'package:bookly_app/features/homeScreen/data/models/booksModel/books_model.dart';
import 'package:dartz/dartz.dart';

abstract class Homerepo {
  Future<Either<Failure, BooksModel>> getNewestBooks();
  Future<Either<Failure, BooksModel>> getFeaturedBooks();
}
