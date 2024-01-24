import 'package:bloc_demo/data/models/characters_model.dart';
import 'package:bloc_demo/presentation/characters_details_screen/character_details_screen.dart';
import 'package:bloc_demo/presentation/characters_screen/characters_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static const String charactersScreen = 'charactersScreen';
  static const String characterDetailsScreen = 'characterDetails';

  static Route<dynamic> generateRoute(
    RouteSettings settings,
  ) {
    switch (settings.name) {
      case charactersScreen:
        return appPage(
          const CharactersScreen(),
        );

      case characterDetailsScreen:
        final character = settings.arguments as Character;

        return appPage(
          CharacterDetailsScreen(
            character: character,
          ),
        );
      default:
        return appPage(
          Container(),
        );
    }
  }

  static appPage(
    Widget page,
  ) {
    return MaterialPageRoute(
      builder: (
        context,
      ) {
        return MediaQuery(
          data: MediaQuery.of(
            context,
          ).copyWith(
            textScaler: const TextScaler.linear(
              1.0,
            ),
          ),
          child: page,
        );
      },
    );
  }
}
