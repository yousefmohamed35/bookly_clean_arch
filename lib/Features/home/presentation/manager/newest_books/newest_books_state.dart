part of 'newest_books_cubit.dart';

abstract class NewestBooksState {}

class NewestBooksInitial extends NewestBooksState {}

class NewestBooksLoading extends NewestBooksState {}

class NewestBooksSuccess extends NewestBooksState {
  final List<BookEntity> books;

  NewestBooksSuccess({required this.books});
}

class NewestBooksFailure extends NewestBooksState {
  final String errorMessage;

  NewestBooksFailure({required this.errorMessage});
}
