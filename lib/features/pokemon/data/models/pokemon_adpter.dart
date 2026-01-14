import 'package:app_multiplier_teste_tecnico/features/pokemon/domain/entities/pokemon_entity.dart';

extension PokemonAdpter on PokemonEntity {
  static PokemonEntity fromMap(Map json) {
    return PokemonEntity(
      nome: json['name'],
      imagem: json['sprites']['front_default'],
      tipos: (json['types'] as List)
          .map((t) => t['type']['name'] as String)
          .toList(),
      altura: json['height'],
      peso: json['weight'],
    );
  }
}
