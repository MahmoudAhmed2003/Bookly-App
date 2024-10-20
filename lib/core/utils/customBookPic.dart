import 'package:bookly_app/core/utils/assets.dart';
import 'package:flutter/material.dart';

class BookPic extends StatelessWidget {
  const BookPic({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.36,
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AssetsData.theJungleBookPic),
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
