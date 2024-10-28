part of 'featured_books_cubit.dart';

abstract class FeaturedBooksState {}

class FeaturedBooksInitial extends FeaturedBooksState {}

class FeaturedBooksLoading extends FeaturedBooksState {}

class FeaturedBooksPaginationLoading extends FeaturedBooksState {}

class FeaturedBooksSuccess extends FeaturedBooksState {
  final List<BookEntity> books;
  FeaturedBooksSuccess({required this.books});
}

class FeaturedBooksPaginationFailure extends FeaturedBooksState {
  final String errorMessage;

  FeaturedBooksPaginationFailure({required this.errorMessage});
}

class FeaturedBooksFailure extends FeaturedBooksState {
  final String errorMessage;

  FeaturedBooksFailure({required this.errorMessage});
}
