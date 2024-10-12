
import 'package:flutter/material.dart';

class CustomBookDetailsAppbar extends StatelessWidget {
  const CustomBookDetailsAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            onPressed: () {},
          icon:const Icon(Icons.close, size: 24),),
        IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart_outlined, size: 28)),
      ],
    );
  }
}
