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

  static Map<String, dynamic> toMap(PokemonEntity entity) {
    return {
      'name': entity.nome,
      'sprites': {'front_default': entity.imagem},
      'types': entity.tipos
          .map(
            (e) => {
              'type': {'name': e},
            },
          )
          .toList(),
      'height': entity.altura,
      'weight': entity.peso,
    };
  }
}
