import 'package:bookly_app/core/errors/failure.dart';
import 'package:bookly_app/features/homeScreen/data/models/booksModel/books_model.dart';
import 'package:dartz/dartz.dart';

abstract class Homerepo {
  Future<Either<Failure, List<BooksModel>>> getBestSellerBooks();
  Future<Either<Failure, List<BooksModel>>> getFeaturedBooks();
}
