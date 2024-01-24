import 'package:bloc_demo/constants/colors.dart';
import 'package:bloc_demo/data/models/characters_model.dart';
import 'package:bloc_demo/generic_cubit/generic_cubit.dart';
import 'package:bloc_demo/presentation/characters_screen/characters_screen_view_model.dart';
import 'package:bloc_demo/presentation/characters_screen/widgets/build_characters_list.dart';
import 'package:bloc_demo/presentation/characters_screen/widgets/build_no_internet_widget.dart';
import 'package:bloc_demo/presentation/characters_screen/widgets/show_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({
    super.key,
  });

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  CharactersScreenViewModel charactersScreenViewModel =
      CharactersScreenViewModel();
  List<Character> allCharacters = [];
  List<Character> searchedForCharacters = [];
  bool _isSearching = false;
  final searchTextController = TextEditingController();

  void addSearchedFOrItemsToSearchedList(
    String searchedCharacter,
  ) {
    searchedForCharacters = allCharacters
        .where(
          (
            character,
          ) =>
              character.name?.toLowerCase().startsWith(
                    searchedCharacter,
                  ) ??
              false,
        )
        .toList();

    setState(
      () {},
    );
  }

  List<Widget> _buildAppBarActions() {
    if (_isSearching) {
      return [
        IconButton(
          onPressed: () {
            _clearSearch();
            Navigator.pop(
              context,
            );
          },
          icon: const Icon(
            Icons.clear,
            color: MyColors.myGrey,
          ),
        ),
      ];
    } else {
      return [
        IconButton(
          onPressed: _startSearch,
          icon: const Icon(
            Icons.search,
            color: MyColors.myGrey,
          ),
        ),
      ];
    }
  }

  void _startSearch() {
    ModalRoute.of(
      context,
    )!
        .addLocalHistoryEntry(
      LocalHistoryEntry(
        onRemove: _stopSearching,
      ),
    );

    setState(
      () {
        _isSearching = true;
      },
    );
  }

  void _stopSearching() {
    _clearSearch();

    setState(
      () {
        _isSearching = false;
      },
    );
  }

  void _clearSearch() {
    setState(
      () {
        searchTextController.clear();
      },
    );
  }

  @override
  void initState() {
    charactersScreenViewModel.initData();
    super.initState();
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.myYellow,
        leading: _isSearching
            ? const BackButton(
                color: MyColors.myGrey,
              )
            : Container(),
        title: _isSearching
            ? TextField(
                controller: searchTextController,
                cursorColor: MyColors.myGrey,
                decoration: const InputDecoration(
                  hintText: 'Find a character...',
                  border: InputBorder.none,
                  hintStyle: TextStyle(
                    color: MyColors.myGrey,
                    fontSize: 18,
                  ),
                ),
                style: const TextStyle(
                  color: MyColors.myGrey,
                  fontSize: 18,
                ),
                onChanged: (
                  searchedCharacter,
                ) {
                  addSearchedFOrItemsToSearchedList(
                    searchedCharacter,
                  );
                },
              )
            : const Text(
                'Characters',
                style: TextStyle(
                  color: MyColors.myGrey,
                ),
              ),
        actions: _buildAppBarActions(),
      ),
      body: OfflineBuilder(
        connectivityBuilder: (
          BuildContext context,
          ConnectivityResult connectivity,
          Widget child,
        ) {
          final bool connected = connectivity != ConnectivityResult.none;

          if (connected) {
            return BlocBuilder<GenericCubit<List<Character>?>,
                    GenericCubitState<List<Character>?>>(
                bloc: charactersScreenViewModel.charactersCubit,
                builder: (
                  context,
                  state,
                ) {
                  return SingleChildScrollView(
                    child: Container(
                      color: MyColors.myGrey,
                      child: Column(
                        children: [
                          BuildCharactersList(
                            searchTextController: searchTextController,
                            searchedForCharacters: searchedForCharacters,
                            allCharacters: allCharacters,
                          ),
                        ],
                      ),
                    ),
                  );
                });
          } else {
            return const BuildNoInternetWidget();
          }
        },
        child: const ShowLoadingIndicator(),
      ),
    );
  }
}
