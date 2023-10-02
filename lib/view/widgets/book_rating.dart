import 'package:bookly_app/view/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookRating extends StatelessWidget {
  const BookRating({super.key, required this.rating, required this.count});
  final dynamic rating;
  final dynamic count;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
            onPressed: () {},
            icon: const Icon(
              FontAwesomeIcons.solidStar,
              color: Color(0xffFFDD4F),
            )),
        Text(
          rating.toString(),
          style: MyStyles.textstyle16,
        ),
        Text(
          ' ($count)',
          style: MyStyles.textstyle14.copyWith(
              color: const Color(0xFF707070), fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
