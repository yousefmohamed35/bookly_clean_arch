

import 'package:bloc/bloc.dart';
import 'package:booklycleanarch/Features/home/domain/entities/book_entity.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit() : super(FeaturedBooksInitial());

  
}
