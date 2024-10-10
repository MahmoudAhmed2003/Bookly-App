import 'dart:io';

import 'package:bookly_app/core/utils/assets.dart';
import 'package:bookly_app/features/home/presention/views/widgets/customAppBar.dart';
import 'package:flutter/material.dart';

class Homescreenbody extends StatelessWidget {
  const Homescreenbody({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        children: [
          const CustomAppBar(),
          Padding(
            padding: EdgeInsets.only(left: w * 0.04),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // const HomePageListViewItem(),
                SizedBox(
                  height: h * 0.2,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(right: w * 0.05),
                        child: const HomePageRecentListItem(),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 40),
                const Text('Best Sellers',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),

                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: h * 0.02),
                      child: const HomePageBestSellerLIstItem(),
                    );
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class HomePageRecentListItem extends StatelessWidget {
  const HomePageRecentListItem({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return SizedBox(
      // color: Colors.white,
      width: w * 0.3,
      child: AspectRatio(
        aspectRatio: 1.36,
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AssetsData.theJungleBookPic),
              fit: BoxFit.contain,
            ),
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Harry Potter \nand the Goblet of Fire',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const Text('J.K.Rowling',
                  style: TextStyle(fontSize: 16, color: Colors.grey)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('19.9\$',
                      style: TextStyle(fontSize: 16, color: Colors.white)),
                  Row(
                    children: [
                      Image.asset(AssetsData.ratingStar, width: w * 0.04),
                      SizedBox(
                        width: w * 0.01,
                      ),
                      const Text('4.5',
                          style: TextStyle(fontSize: 16, color: Colors.white)),
                      SizedBox(
                        width: w * 0.01,
                      ),
                      const Text((' (2390)'),
                          style: TextStyle(fontSize: 16, color: Colors.grey))
                    ],
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
