import 'dart:developer';

import 'package:booklycleanarch/Features/home/presentation/manager/newest_books/newest_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'best_seller_list_view.dart';

class BestSellerListViewBlocBuilder extends StatelessWidget {
  const BestSellerListViewBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBooksFailure) {
          return Text(state.errorMessage);
        } else if (state is NewestBooksSuccess) {
          
          return BestSellerListView(
            books: state.books,
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
