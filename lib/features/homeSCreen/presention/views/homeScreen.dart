import 'package:bookly_app/core/utils/bookListItem.dart';
import 'package:bookly_app/core/utils/customAppBar.dart';
import 'package:bookly_app/features/homeScreen/presention/views/widgets/widgets.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
                        padding: EdgeInsets.zero,
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
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),

                    ListView.builder(
                      padding: EdgeInsets.zero,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: h * 0.01),
                          child: const BookLIstItem(),
                        );
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
