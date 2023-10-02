import 'package:bookly_app/model/book_model/book_model.dart';
import 'package:bookly_app/view/constants/colors.dart';
import 'package:bookly_app/view/widgets/custom_button.dart';
import 'package:bookly_app/view_model/database/network/lunch_url.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BooksActions extends StatelessWidget {
  const BooksActions({super.key, required this.book});
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
            child: CustomButton(
                backgroundColor: MyColors.whiteColor,
                textColor: MyColors.blackColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  bottomLeft: Radius.circular(16),
                ),
                text: 'Free',
                onPressed: () async {
                  launchCustomUrl(context, book.volumeInfo!.previewLink!);
                })),
        Expanded(
            child: CustomButton(
          backgroundColor: MyColors.pinky,
          textColor: MyColors.whiteColor,
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(16), bottomRight: Radius.circular(16)),
          text: 'Preview',
          fontSize: 18,
          onPressed: () async {
            Uri uri = Uri.parse(book.volumeInfo!.previewLink!);
            if (!await launchUrl(uri)) {
              throw Exception('Could not launch $uri');
            }
          },
        ))
      ],
    );
  }
}
