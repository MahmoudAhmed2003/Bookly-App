import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/homeScreen/data/models/booksModel/books_model.dart';
import 'package:bookly_app/features/homeScreen/data/repos/homeRepo.dart';
import 'package:equatable/equatable.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.homeRepo) : super(NewestBooksInitial());
  final Homerepo homeRepo;

  Future<void> getNewestBooks() async {
    emit(NewestBooksLoading());
    final result = await homeRepo.getNewestBooks();
    result.fold(
      (failure) => emit(NewestBooksFailure(errMessage: failure.errMessage)),
      (books) => emit(NewestBooksSuccess(books: books)),
    );
  }
}
