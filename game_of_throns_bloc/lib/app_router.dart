import 'package:flutter/material.dart';
import 'package:game_of_throns_bloc/business_logic/cubit/characters_cubit.dart';
import 'package:game_of_throns_bloc/constant/constants.dart';
import 'package:game_of_throns_bloc/data/repositorys/characters_repository.dart';
import 'package:game_of_throns_bloc/presentation/screens/characters_details_screen.dart';
import 'package:game_of_throns_bloc/presentation/screens/characters_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './data/web_services/characters_web_servers.dart';

class AppRouter {
  late CharactersRepository charactersRepository;
  late CharactersCubit charactersCubit;

  AppRouter() {
    charactersRepository = CharactersRepository(CharacterWebServices());
    charactersCubit = CharactersCubit(charactersRepository);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case allCharactersRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext contxt) => charactersCubit,
            child: const CharactersScreen(),
          ),
        );

      case characterDetailsScreen:
        return MaterialPageRoute(
            builder: (_) => const CharacterDetailsScreen());
    }
  }
}
