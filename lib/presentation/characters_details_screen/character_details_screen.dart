import 'package:bloc_demo/constants/colors.dart';
import 'package:bloc_demo/data/models/characters_model.dart';
import 'package:flutter/material.dart';

class CharacterDetailsScreen extends StatelessWidget {
  final Character character;

  const CharacterDetailsScreen({
    Key? key,
    required this.character,
  }) : super(
          key: key,
        );

  Widget buildSliverAppBar() {
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

  Widget characterInfo(
    String title,
    String value,
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

  Widget buildDivider(
    double endIndent,
  ) {
    return Divider(
      height: 30,
      endIndent: endIndent,
      color: MyColors.myYellow,
      thickness: 2,
    );
  }

  Widget showProgressIndicator() {
    return const Center(
      child: CircularProgressIndicator(
        color: MyColors.myYellow,
      ),
    );
  }

  String getAllEpisodeNumbers(List<String> links) {
    List<String> episodeNumbers =
        links.map((link) => getEpisodeNumber(link)).toList();
    return episodeNumbers.join(' / ');
  }

  String getEpisodeNumber(String link) {
    List<String> parts = link.split('/');
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
          buildSliverAppBar(),
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
                      characterInfo(
                        'Episodes : ',
                        getAllEpisodeNumbers(
                          character.episode!,
                        ),
                      ),
                      buildDivider(
                        315,
                      ),
                      characterInfo(
                        'Gender : ',
                        character.gender!,
                      ),
                      buildDivider(
                        250,
                      ),
                      characterInfo(
                        'Status : ',
                        character.status!,
                      ),
                      buildDivider(
                        300,
                      ),
                      characterInfo(
                        'Species : ',
                        character.species!,
                      ),
                      buildDivider(
                        235,
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
