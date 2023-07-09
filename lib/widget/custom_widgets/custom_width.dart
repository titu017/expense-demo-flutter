import 'package:flutter/material.dart';

class CustomWidth extends StatelessWidget {
  const CustomWidth(this.width, {super.key});
  final double width;

  @override
  Widget build(BuildContext context) {
    final customWidth = (MediaQuery.of(context).size.width) / (width * 10);
    return SizedBox(
      width: customWidth,
    );
  }
}
