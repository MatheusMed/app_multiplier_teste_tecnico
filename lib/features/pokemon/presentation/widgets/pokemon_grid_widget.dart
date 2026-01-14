import 'package:app_multiplier_teste_tecnico/features/pokemon/domain/entities/pokemon_entity.dart';
import 'package:app_multiplier_teste_tecnico/features/pokemon/presentation/widgets/pokemon_card_widget.dart';
import 'package:flutter/material.dart';

class PokemonGridWidget extends StatelessWidget {
  final List<PokemonEntity> listaPokemon;
  final ScrollController controller;

  const PokemonGridWidget({
    super.key,
    required this.listaPokemon,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      controller: controller,
      padding: const EdgeInsets.all(16),
      itemCount: listaPokemon.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 0.85,
      ),
      itemBuilder: (context, index) {
        return PokemonCardWidget(pokemon: listaPokemon[index]);
      },
    );
  }
}
