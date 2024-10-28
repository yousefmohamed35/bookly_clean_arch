import 'package:booklycleanarch/Features/home/presentation/manager/featured_books/featured_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'featured_list_view.dart';

class FeaturedBookListViewBlocBuilder extends StatelessWidget {
  const FeaturedBookListViewBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksFailure) {
          return Text(state.errorMessage);
        } else if (state is FeaturedBooksSuccess) {
          return FeaturedBooksListView(
            books: state.books,
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
