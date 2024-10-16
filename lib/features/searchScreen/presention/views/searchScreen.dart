import 'package:bookly_app/features/searchScreen/presention/views/widgets/customSearchTextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: w * 0.04, vertical: h * 0.01),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
               CustomSearchTextField()
            ],
          ),
        ),
      ),
    );
  }
}
