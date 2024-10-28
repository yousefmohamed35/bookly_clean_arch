import 'package:bloc/bloc.dart';
import 'package:booklycleanarch/Features/home/domain/entities/book_entity.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit() : super(NewestBooksInitial());

  
}
