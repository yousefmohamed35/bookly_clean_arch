

import 'package:booklycleanarch/Features/home/domain/entities/book_entity.dart';
import 'package:booklycleanarch/Features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.fetchFeaturedBooksUseCase)
      : super(FeaturedBooksInitial());
  final FetchFeaturedBooksUseCase fetchFeaturedBooksUseCase;
  Future<void> fetchFeaturedBooks({int pageNumer = 0}) async {
    if (pageNumer == 0) {
      emit(FeaturedBooksLoading());
    } else {
      emit(FeaturedBooksPaginationLoading());
    }
    var result = await fetchFeaturedBooksUseCase.call(pageNumber: pageNumer);
    result.fold((failure) {
      if (pageNumer == 0) {
        emit(FeaturedBooksFailure(errorMessage: failure.message));
      } else {
        emit(FeaturedBooksPaginationFailure(errorMessage: failure.message));
      }
    }, (books) {
      emit(
        FeaturedBooksSuccess(books: books),
      );
    });
  }
}
