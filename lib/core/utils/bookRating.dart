import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookRating extends StatelessWidget {
  const BookRating({
    required this.pageCount,
    super.key,
  });
  final String pageCount;
  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(FontAwesomeIcons.solidStar, size: 16, color: Colors.yellow),
        // Image.asset(AssetsData.ratingStar, width: w * 0.04),
        SizedBox(
          width: w * 0.01,
        ),
        const Text('4.5', style: TextStyle(fontSize: 16, color: Colors.white)),
        SizedBox(
          width: w * 0.01,
        ),
         Text((' ($pageCount)'),
            style: const TextStyle(fontSize: 16, color: Colors.grey))
      ],
    );
  }
}
