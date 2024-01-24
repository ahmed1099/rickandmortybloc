import 'package:bloc_demo/constants/colors.dart';
import 'package:flutter/material.dart';

class BuildDivider extends StatelessWidget {
  const BuildDivider({
    super.key,
    required this.endIndent,
  });
  final double endIndent;

  @override
  Widget build(
    BuildContext context,
  ) {
    return Divider(
      height: 30,
      endIndent: endIndent,
      color: MyColors.myYellow,
      thickness: 2,
    );
  }
}
