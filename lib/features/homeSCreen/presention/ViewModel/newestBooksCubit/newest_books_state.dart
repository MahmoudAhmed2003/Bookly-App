part of 'newest_books_cubit.dart';

sealed class NewestBooksState extends Equatable {
  const NewestBooksState();

  @override
  List<Object> get props => [];
}

final class NewestBooksInitial extends NewestBooksState {}
final class NewestBooksFailure extends NewestBooksState {

  const NewestBooksFailure({
     required String errMessage
  });
}
final class NewestBooksLoading extends NewestBooksState {}
final class NewestBooksSuccess extends NewestBooksState {
  final List<BooksModel> books;

  const NewestBooksSuccess({
    required this.books,
  });

}