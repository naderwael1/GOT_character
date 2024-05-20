import 'package:dio/dio.dart';
import 'package:game_of_throns_bloc/constant/constants.dart';
import 'package:game_of_throns_bloc/data/models/character.dart';

class CharacterWebServices {
  late Dio dio;

  var headers = {
    'X-RapidAPI-Key': '34881c3b38mshe00e7432d4f53d0p1646bajsnfd6ffda9e46a',
    'X-RapidAPI-Host': 'game-of-thrones1.p.rapidapi.com'
  };

  CharacterWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      headers: headers,
      receiveDataWhenStatusError: true,
      receiveTimeout: const Duration(seconds: 20),
      connectTimeout: const Duration(seconds: 10),
    );
    dio = Dio(options);
  }

  Future<List<dynamic>> getAllCharacters() async {
    try {
      Response response = await dio.get('Characters');
      print(response.data.toString());
      return response.data;
    } catch (e) {
      print('Error: $e');
      return [];
    }
  }
}
