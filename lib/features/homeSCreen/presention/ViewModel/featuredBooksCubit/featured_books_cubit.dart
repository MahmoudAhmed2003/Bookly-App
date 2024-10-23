import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/homeScreen/data/models/booksModel/books_model.dart';
import 'package:bookly_app/features/homeScreen/data/repos/homeRepo.dart';
import 'package:bookly_app/features/homeScreen/data/repos/homeRepoImpl.dart';
import 'package:equatable/equatable.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.homerepo) : super(FeaturedBooksInitial());
  final Homerepo homerepo;
  Future<void> getFeaturedBooks() async {
    emit(FeaturedBooksLoading());
    final result = await homerepo.getFeaturedBooks();
    result.fold((failure) {
      emit(FeaturedBooksFailure(message: failure.errMessage));
    }, (books) {
      emit(FeaturedBooksSuccess(books: books));
    });
  }
}
