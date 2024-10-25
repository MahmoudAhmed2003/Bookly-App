import 'package:bookly_app/core/utils/appRoutes.dart';
import 'package:bookly_app/features/searchScreen/presention/views/searchScreen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import 'assets.dart';

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
              onPressed: () {
                GoRouter.of(context).push(AppRoutes.searchScreenRout);
              },
              icon: const Icon(FontAwesomeIcons.magnifyingGlass, size: 22)),
        ],
      ),
    );
  }
}
