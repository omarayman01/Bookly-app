import 'package:bookly_app/model/book_model/book_model.dart';
import 'package:bookly_app/view/constants/exteintion.dart';
import 'package:bookly_app/view/constants/fonts.dart';
import 'package:bookly_app/view/constants/styles.dart';
import 'package:bookly_app/view/views/book_details_view.dart';
import 'package:bookly_app/view/widgets/book_item.dart';
import 'package:bookly_app/view/widgets/book_rating.dart';
import 'package:flutter/material.dart';

class NewestBookItem extends StatelessWidget {
  const NewestBookItem({
    super.key,
    required this.book,
  });
  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(BookDetailsView(
          book: book,
        ));
      },
      child: SizedBox(
        height: 125,
        child: Row(
          children: [
            BookItem(
              book: book,
            ),
            const SizedBox(width: 30),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .5,
                    child: Text(book.volumeInfo!.title!,
                        style: MyStyles.textStyle20
                            .copyWith(fontFamily: MyFonts.kGTSectraFine),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    book.volumeInfo!.authors![0],
                    style: MyStyles.textstyle14,
                    maxLines: 2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Free',
                        style: MyStyles.textStyle20
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      BookRating(
                        rating: book.volumeInfo!.averageRating ?? "N/A",
                        count: book.volumeInfo!.ratingsCount ?? "??",
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
