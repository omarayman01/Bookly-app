import 'package:bookly_app/model/book_model/book_model.dart';
import 'package:bookly_app/view/constants/exteintion.dart';
import 'package:bookly_app/view/views/book_details_view.dart';
import 'package:flutter/material.dart';

class BookItem extends StatelessWidget {
  const BookItem({super.key, required this.book});
  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(BookDetailsView(
          book: book,
        ));
      },
      child: AspectRatio(
        aspectRatio: 2.7 / 4,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image:
                      NetworkImage(book.volumeInfo!.imageLinks!.thumbnail!))),
        ),
      ),
    );
  }
}
