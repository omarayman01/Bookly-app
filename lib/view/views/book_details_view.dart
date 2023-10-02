import 'package:bookly_app/model/book_model/book_model.dart';
import 'package:bookly_app/view/constants/service_locator.dart';
import 'package:bookly_app/view/widgets/Book_details_view_body.dart';
import 'package:bookly_app/view_model/cubits/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly_app/view_model/repos/home_repo_implementation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetailsView extends StatelessWidget {
  const BookDetailsView({super.key, required this.book});
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => SimilarBooksCubit(getIt.get<HomeRepImpl>())
          ..fetchSimilarBooks(category: book.volumeInfo!.categories![0]),
        child: BookDetailsViewBody(
          book: book,
        ),
      ),
    );
  }
}
