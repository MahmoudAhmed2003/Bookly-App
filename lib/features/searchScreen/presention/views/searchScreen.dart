import 'package:bookly_app/core/utils/bookListItem.dart';
import 'package:bookly_app/features/searchScreen/presention/views/widgets/customSearchTextField.dart';
import 'package:flutter/cupertino.dart';
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomSearchTextField(),
              SizedBox(
                height: h * 0.02,
              ),
              const Text('Result',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(
                height: h * 0.02,
              ),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.zero,

                  // shrinkWrap: true,
                  itemCount: 8,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: h * 0.01),
                      child: const BookLIstItem(),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
