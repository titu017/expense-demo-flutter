import 'package:flutter/material.dart';

class CustomHeight extends StatelessWidget {
  const CustomHeight(this.height, {super.key});
  final double height;

  @override
  Widget build(BuildContext context) {
    final customHeight = (MediaQuery.of(context).size.height) / (height * 10);
    return SizedBox(
      height: customHeight,
    );
  }
}
