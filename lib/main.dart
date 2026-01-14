import 'package:app_multiplier_teste_tecnico/features/core/di/injector_di.dart';
import 'package:app_multiplier_teste_tecnico/features/pokemon/presentation/pages/home_list_pokemon/home_list_pokemon.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await InjectorDi.init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: Scaffold(body: HomeListPokemon()));
  }
}
