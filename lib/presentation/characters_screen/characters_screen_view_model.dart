import 'package:bloc_demo/data/models/characters_model.dart';
import 'package:bloc_demo/data/models/failure.dart';
import 'package:bloc_demo/data/repository/shared_repo.dart';
import 'package:bloc_demo/generic_cubit/generic_cubit.dart';

class CharactersScreenViewModel {
  SharedRepo charactersRepo = SharedRepo();
  GenericCubit<List<Character>?> charactersCubit = GenericCubit(
    null,
  );
  initData() async {
    getCharacters(
      charactersCubit,
    );
  }

  getCharacters(
    GenericCubit<List<Character>?> charactersCubit, [
    String? params,
  ]) async {
    try {
      charactersCubit.onLoadingState();
      final charactersMap = await charactersRepo.getAllCharacters();
      charactersCubit.onUpdateData(
        List<Character>.from(
          charactersMap['results']
              .map(
                (
                  e,
                ) =>
                    Character.fromJson(
                  e,
                ),
              )
              .toList(),
        ),
      );
    } on Failure catch (failure) {
      charactersCubit.onErrorState(
        failure,
      );
    }
  }
}
