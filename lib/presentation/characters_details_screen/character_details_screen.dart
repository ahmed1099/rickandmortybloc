import 'package:bloc_demo/constants/colors.dart';
import 'package:bloc_demo/data/models/characters_model.dart';
import 'package:bloc_demo/presentation/characters_details_screen/widgets/build_divider.dart';
import 'package:bloc_demo/presentation/characters_details_screen/widgets/build_sliver_app_bar.dart';
import 'package:bloc_demo/presentation/characters_details_screen/widgets/character_info.dart';
import 'package:flutter/material.dart';

class CharacterDetailsScreen extends StatelessWidget {
  final Character character;

  const CharacterDetailsScreen({
    super.key,
    required this.character,
  });

  String getAllEpisodeNumbers(
    List<String> links,
  ) {
    List<String> episodeNumbers = links
        .map(
          (
            link,
          ) =>
              getEpisodeNumber(
            link,
          ),
        )
        .toList();
    return episodeNumbers.join(
      ' / ',
    );
  }

  String getEpisodeNumber(
    String link,
  ) {
    List<String> parts = link.split(
      '/',
    );
    return parts.last;
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      backgroundColor: MyColors.myGrey,
      body: CustomScrollView(
        slivers: [
          BuildSliverAppBar(
            character: character,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  margin: const EdgeInsets.fromLTRB(
                    14,
                    14,
                    14,
                    0,
                  ),
                  padding: const EdgeInsets.all(
                    8,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CharacterInfo(
                        title: 'Episodes : ',
                        value: getAllEpisodeNumbers(
                          character.episode!,
                        ),
                      ),
                      const BuildDivider(
                        endIndent: 315,
                      ),
                      CharacterInfo(
                        title: 'Gender : ',
                        value: character.gender!,
                      ),
                      const BuildDivider(
                        endIndent: 250,
                      ),
                      CharacterInfo(
                        title: 'Status : ',
                        value: character.status!,
                      ),
                      const BuildDivider(
                        endIndent: 300,
                      ),
                      CharacterInfo(
                        title: 'Species : ',
                        value: character.species!,
                      ),
                      const BuildDivider(
                        endIndent: 235,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 600,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
