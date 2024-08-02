import 'package:flutter/material.dart';
import 'package:flutter_portfolio/constants/colors.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final int maxLines;

  const CustomTextField({
    Key? key,
    required this.hintText,
    this.maxLines = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      style: const TextStyle(color: CustomColor.scaffoldBg),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(16),
        filled: true,
        fillColor: CustomColor.whiteSecondary,
        focusedBorder: _getInputBorder(),
        enabledBorder: _getInputBorder(),
        border: _getInputBorder(),
        hintText: hintText,
        hintStyle: const TextStyle(color: CustomColor.hintDark),
      ),
    );
  }

  OutlineInputBorder _getInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide.none,
    );
  }
}
