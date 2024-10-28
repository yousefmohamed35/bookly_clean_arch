import 'package:booklycleanarch/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'best_seller_list_view_bloc_builder.dart';
import 'custom_app_bar.dart';
import 'featured_books_list_view_bloc_builder.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      SliverToBoxAdapter(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 30,
              ),
              child: CustomAppBar(),
            ),
            FeaturedBookListViewBlocBuilder(),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                'Best Seller',
                style: Styles.textStyle18,
              ),
            ),
          ],
        ),
      ),
      SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: BestSellerListViewBlocBuilder(),
              );
            },
            childCount: 1, // Display BestSellerListViewBlocBuilder once
          ),
        ),
    ]);
  }
}
