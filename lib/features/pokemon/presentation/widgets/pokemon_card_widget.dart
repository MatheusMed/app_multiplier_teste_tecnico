import 'package:app_multiplier_teste_tecnico/features/pokemon/domain/entities/pokemon_entity.dart';
import 'package:app_multiplier_teste_tecnico/features/pokemon/presentation/pages/home_list_pokemon/pokemon_detail_page.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PokemonCardWidget extends StatelessWidget {
  final PokemonEntity pokemon;

  const PokemonCardWidget({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => PokemonDetailPage(pokemon: pokemon),
          ),
        );
      },
      child: Container(
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
            CachedNetworkImage(
              imageUrl: pokemon.imagem,
              fit: BoxFit.cover,
              placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
              errorWidget: (context, url, error) =>
                  const Icon(Icons.image_not_supported_outlined),
            ),
            const SizedBox(height: 12),
            Text(
              pokemon.nome.toUpperCase(),
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 6),
          ],
        ),
      ),
    );
  }
}
