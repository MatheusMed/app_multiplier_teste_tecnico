import 'package:app_multiplier_teste_tecnico/features/pokemon/domain/entities/pokemon_entity.dart';
import 'package:app_multiplier_teste_tecnico/features/pokemon/presentation/widgets/info_card_widget.dart';
import 'package:flutter/material.dart';

class PokemonDetailPage extends StatelessWidget {
  final PokemonEntity pokemon;

  const PokemonDetailPage({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F7FB),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Hero(
            tag: pokemon.nome,
            child: Image.network(
              pokemon.imagem,
              height: 180,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    pokemon.nome.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 8,
                    children: pokemon.tipos
                        .map(
                          (e) => Chip(
                            label: Text(e),
                            backgroundColor: Colors.blue.shade50,
                          ),
                        )
                        .toList(),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InfoCard(title: 'Altura', value: '${pokemon.altura}'),
                      InfoCard(title: 'Peso', value: '${pokemon.peso}'),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
