import 'package:bloc_demo/constants/colors.dart';
import 'package:bloc_demo/data/models/characters_model.dart';
import 'package:flutter/material.dart';

class BuildSliverAppBar extends StatelessWidget {
  const BuildSliverAppBar({
    super.key,
    required this.character,
  });
  final Character character;

  @override
  Widget build(
    BuildContext context,
  ) {
    return SliverAppBar(
      expandedHeight: 600,
      pinned: true,
      stretch: true,
      backgroundColor: MyColors.myGrey,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          character.name!,
          style: const TextStyle(
            color: MyColors.myWhite,
          ),
        ),
        background: Hero(
          tag: character.charId!,
          child: Image.network(
            character.image!,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
