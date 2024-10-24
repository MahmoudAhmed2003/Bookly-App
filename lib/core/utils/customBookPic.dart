import 'package:bookly_app/core/utils/assets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BookPic extends StatelessWidget {
  const BookPic({
    required this.imageUrl,
    required this.w,
    super.key,
  });
  final imageUrl;
  final double w;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.6 / 4,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: CachedNetworkImage(
          fit: BoxFit.fill,
          imageUrl: imageUrl,
          errorWidget: (context, url, error) => Icon(
            Icons.error,
            size: (w / 10),
          ),
        ),
      ),
    );
  }
}
