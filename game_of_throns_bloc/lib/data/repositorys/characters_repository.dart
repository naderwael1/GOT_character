import '../models/character.dart';
import '../web_services/characters_web_servers.dart';

class CharactersRepository {
  final CharacterWebServices charactersWebServices;

  CharactersRepository(this.charactersWebServices);

  Future<List<Character>> getAllCharacters() async {
    final characters = await charactersWebServices.getAllCharacters();
    return characters.map((hh) => Character.fromJson(hh)).toList();
  }
/*
  Future<List<Quote>> getCharacterQuotes(String charName) async {
    final quotes = await charactersWebServices.getCharacterQuotes(charName);
    return quotes.map((charQuotes) => Quote.fromJson(charQuotes)).toList();
  }

*/
}
