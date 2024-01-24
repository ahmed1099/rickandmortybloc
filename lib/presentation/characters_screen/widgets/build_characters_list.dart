import 'package:bloc_demo/data/models/characters_model.dart';
import 'package:bloc_demo/presentation/characters_screen/widgets/character_items_widget.dart';
import 'package:flutter/material.dart';

class BuildCharactersList extends StatelessWidget {
  const BuildCharactersList({
    super.key,
    required this.searchTextController,
    required this.searchedForCharacters,
    required this.allCharacters,
  });
  final TextEditingController searchTextController;
  final List<Character> searchedForCharacters;
  final List<Character> allCharacters;

  @override
  Widget build(
    BuildContext context,
  ) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2 / 3,
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
      ),
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: searchTextController.text.isEmpty
          ? allCharacters.length
          : searchedForCharacters.length,
      itemBuilder: (
        ctx,
        index,
      ) {
        return CharacterItem(
          character: searchTextController.text.isEmpty
              ? allCharacters[index]
              : searchedForCharacters[index],
        );
      },
    );
  }
}
