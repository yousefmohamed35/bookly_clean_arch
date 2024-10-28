import 'package:booklycleanarch/Features/home/domain/entities/book_entity.dart';
import 'package:booklycleanarch/Features/home/presentation/manager/featured_books/featured_books_cubit.dart';
import 'package:booklycleanarch/Features/home/presentation/views/widgets/featured_books_list_view_loading_indicator.dart';
import 'package:booklycleanarch/core/functions/build_error_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'featured_list_view.dart';

class FeaturedBookListViewBlocConsumer extends StatefulWidget {
  const FeaturedBookListViewBlocConsumer({
    super.key,
  });

  @override
  State<FeaturedBookListViewBlocConsumer> createState() =>
      _FeaturedBookListViewBlocConsumerState();
}

class _FeaturedBookListViewBlocConsumerState
    extends State<FeaturedBookListViewBlocConsumer> {
  List<BookEntity> books = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeaturedBooksCubit, FeaturedBooksState>(
      listener: (context, state) {
        if (state is FeaturedBooksSuccess) {
          books.addAll(state.books);
        }
        if (state is FeaturedBooksPaginationFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            buildErrorSnackBar(state.errorMessage),
          );
        }
      },
      builder: (context, state) {
        if (state is FeaturedBooksFailure) {
          return Text(state.errorMessage);
        } else if (state is FeaturedBooksSuccess ||
            state is FeaturedBooksPaginationLoading ||
            state is FeaturedBooksPaginationFailure) {
          return FeaturedBooksListView(
            books: books,
          );
        } else {
          return FeaturedBooksListViewLoadingIndicator();
        }
      },
    );
  }
}
