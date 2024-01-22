import 'package:bloc_demo/business_logic/cubit/cubit/characters_cubit.dart';
import 'package:bloc_demo/constants/strings.dart';
import 'package:bloc_demo/data/models/characters_model.dart';
import 'package:bloc_demo/data/repository/characters_repository.dart';
import 'package:bloc_demo/data/web_services/character_web_sevices.dart';
import 'package:bloc_demo/presentation/characters_details_screen/character_details_screen.dart';
import 'package:bloc_demo/presentation/characters_screen/characters_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  late CharactersRepository charactersRepository;
  late CharactersCubit charactersCubit;
  AppRouter() {
    charactersRepository = CharactersRepository(CharactersWebServices());
    charactersCubit = CharactersCubit(charactersRepository);
  }
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case charactersScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (BuildContext contxt) => charactersCubit,
                  child: const CharactersScreen(),
                ));
      case characterDetailsScreen:
        final character = settings.arguments as Character;

        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) =>
                CharactersCubit(charactersRepository),
            child: CharacterDetailsScreen(
              character: character,
            ),
          ),
        );
    }
  }
}
