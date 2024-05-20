import 'package:flutter/material.dart';
import 'package:game_of_throns_bloc/app_router.dart';

void main() {
  runApp(GameOfThronsApp(
    appRouter: AppRouter(),
  ));
}

class GameOfThronsApp extends StatelessWidget {
  final AppRouter appRouter;

  const GameOfThronsApp({super.key, required this.appRouter});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 147, 179, 211),
        scaffoldBackgroundColor: const Color.fromARGB(255, 201, 231, 225),
        hintColor: const Color.fromARGB(255, 201, 231, 225),
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}
