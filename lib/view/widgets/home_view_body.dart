import 'package:bookly_app/view/constants/styles.dart';
import 'package:bookly_app/view/widgets/newestbooks_listview.dart';
import 'package:bookly_app/view/widgets/custom_appbar.dart';
import 'package:bookly_app/view/widgets/item_listview.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: CustomAppBar(),
              ),
              Padding(
                padding: EdgeInsets.only(left: 24),
                child: ItemListView(),
              ),
              SizedBox(height: 50),
              Padding(
                padding: EdgeInsets.only(left: 24),
                child: Text('Newest', style: MyStyles.textstyle18),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
        SliverToBoxAdapter(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: NewestBookListView(),
        ))
      ],
    );
  }
}
