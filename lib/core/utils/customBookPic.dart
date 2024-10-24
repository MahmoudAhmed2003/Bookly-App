import 'package:bookly_app/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BookPic extends StatelessWidget {
  const BookPic({
    required this.imageUrl,
    super.key,
  });
  final imageUrl;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.36,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: imageUrl != ''
              ? DecorationImage(
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.contain,
                )
              : const DecorationImage(
                  image: AssetImage(AssetsData.theJungleBookPic),
                  fit: BoxFit.contain,
                ),
        ),
      ),
    );
  }
}
