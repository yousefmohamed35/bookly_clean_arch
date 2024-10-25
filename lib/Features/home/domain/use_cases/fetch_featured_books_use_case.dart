import 'package:booklycleanarch/Features/home/domain/entities/book_entity.dart';
import 'package:booklycleanarch/Features/home/domain/repos/home_repo.dart';
import 'package:booklycleanarch/core/errors/failure.dart';
import 'package:booklycleanarch/core/use_case/no_param_use_case.dart';

import 'package:dartz/dartz.dart';

class FetchFeaturedBooksUseCase extends UseCase<List<BookEntity>> {
  final HomeRepo homeRepo;

  FetchFeaturedBooksUseCase({required this.homeRepo});
  @override
  Future<Either<Failure, List<BookEntity>>> call() {
    return homeRepo.fetchFeaturedBooks();
  }
}





