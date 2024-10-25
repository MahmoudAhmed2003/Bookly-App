import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/bookDetailsScreen/data/repos/detailsRepo.dart';
import 'package:equatable/equatable.dart';
import 'package:bookly_app/features/homeScreen/data/models/booksModel/books_model.dart';


part 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit(this.detailsRepo) : super(SimilarBooksInitial());
   final DetailsRepo detailsRepo;

  Future<void> getSimilarBooks({required String category}) async {
    emit(SimilarBooksLoading());
    final result = await detailsRepo.getSimilarBooks(category: category);
    result.fold(
      (failure) => emit(SimilarBooksFailure(errMessage: failure.errMessage)),
      (books) => emit(SimilarBooksSuccess(books: books)),
    );
  }
}
