import 'package:bookly_app/core/utils/assets.dart';
import 'package:bookly_app/core/utils/bookRating.dart';
import 'package:bookly_app/core/utils/customBookPic.dart';
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
               Text(
                'Harry Potter \nand the Goblet of Fire',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
               Text('J.K.Rowling',
                  style: TextStyle(fontSize: 16, color: Colors.grey)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   Text('19.9\$',
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


