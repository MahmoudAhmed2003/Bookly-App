import 'package:bookly_app/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePageRecentListItem extends StatelessWidget {
  const HomePageRecentListItem({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return SizedBox(
      // color: Colors.white,
      width: w * 0.3,
      child: BookPic(),
    );
  }
}

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

class HomePageBestSellerLIstItem extends StatelessWidget {
  const HomePageBestSellerLIstItem({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Image(
            image: const AssetImage(AssetsData.theJungleBookPic),
            width: w * 0.2),
        SizedBox(
          width: w * 0.04,
        ),
        SizedBox(
          width: w * 0.6,
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Harry Potter \nand the Goblet of Fire',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const Text('J.K.Rowling',
                  style: TextStyle(fontSize: 16, color: Colors.grey)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('19.9\$',
                      style: TextStyle(fontSize: 16, color: Colors.white)),
                  BookRating(),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}

class BookRating extends StatelessWidget {
  const BookRating({
    super.key,
  });

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
        const Text((' (2390)'),
            style: TextStyle(fontSize: 16, color: Colors.grey))
      ],
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: w * 0.05, vertical: h * 0.035),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(AssetsData.logo, height: 20),
          IconButton(
              onPressed: () {},
              icon: const Icon(FontAwesomeIcons.magnifyingGlass, size: 24)),
        ],
      ),
    );
  }
}
