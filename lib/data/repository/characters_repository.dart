import 'package:bloc_demo/data/models/characters_model.dart';
import 'package:bloc_demo/data/web_services/character_web_sevices.dart';

class CharactersRepository {
  final CharactersWebServices charactersWebServices;

  CharactersRepository(
    this.charactersWebServices,
  );

  Future<List<Character>> getAllCharacters() async {
    final charactersMap = await charactersWebServices.getAllCharacters();
    final List<dynamic> charactersList = charactersMap['results'] ?? [];

    return charactersList
        .map(
          (characterData) => Character.fromJson(characterData),
        )
        .toList();
  }
}
