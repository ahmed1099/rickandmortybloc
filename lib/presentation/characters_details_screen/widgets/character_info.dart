import 'package:bloc_demo/constants/colors.dart';
import 'package:flutter/material.dart';

class CharacterInfo extends StatelessWidget {
  const CharacterInfo({
    super.key,
    required this.title,
    required this.value,
  });
  final String title;
  final String value;
  @override
  Widget build(
    BuildContext context,
  ) {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        children: [
          TextSpan(
            text: title,
            style: const TextStyle(
              color: MyColors.myWhite,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          TextSpan(
            text: value,
            style: const TextStyle(
              color: MyColors.myWhite,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
