// ignore_for_file: file_names
import 'package:bookly_app/model/book_model/book_model.dart';
import 'package:bookly_app/view/constants/fonts.dart';
import 'package:bookly_app/view/constants/styles.dart';
import 'package:bookly_app/view/widgets/book_item.dart';
import 'package:bookly_app/view/widgets/book_rating.dart';
import 'package:bookly_app/view/widgets/books_action.dart';
import 'package:bookly_app/view/widgets/custom_appbar_bookdetails.dart';
import 'package:bookly_app/view/widgets/similar_books_listview.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.book});
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            children: [
              const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: CustomAppBarBookDetails()),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.31),
                child: BookItem(
                  book: book,
                ),
              ),
              const SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  book.volumeInfo!.title ?? '',
                  style: MyStyles.textStyle30
                      .copyWith(fontFamily: MyFonts.kGTSectraFine),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                book.volumeInfo!.authors![0],
                style: MyStyles.textstyle18.copyWith(
                    color: const Color(0xFF707070),
                    fontStyle: FontStyle.italic),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 5),
              Align(
                  alignment: Alignment.center,
                  child: BookRating(
                    rating: book.volumeInfo!.averageRating ?? 'N/A',
                    count: book.volumeInfo!.ratingsCount ?? "??",
                  )),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: BooksActions(book: book),
              ),
              const Expanded(child: SizedBox(height: 50)),
              Padding(
                padding: const EdgeInsets.only(left: 24),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text('You can also like',
                      style: MyStyles.textstyle16
                          .copyWith(fontWeight: FontWeight.bold)),
                ),
              ),
              const SizedBox(height: 15),
              const Padding(
                padding: EdgeInsets.only(left: 24),
                child: SimilarBooksListView(),
              ),
              const SizedBox(height: 30),
            ],
          ),
        )
      ],
    );
  }
}
