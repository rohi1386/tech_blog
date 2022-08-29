
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:tech_blog/my_colors.dart';

class My_Divider extends StatelessWidget {
  const My_Divider({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: SolidColors.dividerColor,
      indent: size.width/6,
      endIndent: size.width/6,
    );
  }
}