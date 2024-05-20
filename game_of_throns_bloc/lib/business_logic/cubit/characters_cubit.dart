import 'package:bloc/bloc.dart';
import 'package:game_of_throns_bloc/data/models/character.dart';
import 'package:game_of_throns_bloc/data/repositorys/characters_repository.dart';
import 'package:meta/meta.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharactersRepository charactersRepository;
  //han42 el object da f3lin lma anadi ll constractor

  List<Character> characters = [];

  CharactersCubit(this.charactersRepository) : super(CharactersInitial());

  List<Character> getAllCharacters() {
    charactersRepository.getAllCharacters().then((characters) {
      emit(CharactersLoaded(characters));
      this.characters = characters;
    });

    return characters;
  }
}
