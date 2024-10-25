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
          icon: const Icon(Icons.close, size: 24),
        ),
        IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart_outlined, size: 28)),
      ],
    );
  }
}

class bookPreviewButton extends StatelessWidget {
  const bookPreviewButton({
    required this.onPressed,
    super.key,
  });
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    final double w = MediaQuery.of(context).size.width;

    return SizedBox(
      width: w * 0.7,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: TextButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8.0),
                    bottomLeft: Radius.circular(8.0),
                  ),
                ),
              ),
              child: const Text(
                'Get For Free',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            child: TextButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xffEF8262),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(8.0),
                    bottomRight: Radius.circular(8.0),
                  ),
                ),
              ),
              child: const Text(
                'Free preview',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
