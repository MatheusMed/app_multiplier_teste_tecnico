import 'package:app_multiplier_teste_tecnico/features/pokemon/domain/entities/pokemon_entity.dart';
import 'package:flutter/material.dart';

class PokemonCardWidget extends StatelessWidget {
  final PokemonEntity pokemon;

  const PokemonCardWidget({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(pokemon.imagem, height: 90, fit: BoxFit.contain),
          const SizedBox(height: 12),
          Text(
            pokemon.nome.toUpperCase(),
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 6),
        ],
      ),
    );
  }
}
