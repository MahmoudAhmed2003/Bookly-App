import 'package:bookly_app/core/errors/failure.dart';
import 'package:bookly_app/features/homeScreen/data/models/booksModel/books_model.dart';
import 'package:bookly_app/features/homeScreen/data/repos/homeRepo.dart';
import 'package:dartz/dartz.dart';

class Homerepoimpl extends Homerepo {


  @override
  Future<Either<Failure, List<BooksModel>>> getBestSellerBooks() {
    // TODO: implement getBestSellerBooks
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<BooksModel>>> getFeaturedBooks() {
    // TODO: implement getFeaturedBooks
    throw UnimplementedError();
  }
}