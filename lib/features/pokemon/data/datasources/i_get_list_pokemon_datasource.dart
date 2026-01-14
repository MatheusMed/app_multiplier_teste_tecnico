import 'package:app_multiplier_teste_tecnico/features/pokemon/domain/entities/pokemon_entity.dart';

abstract interface class IGetListPokemonDatasource {
  Future<List<PokemonEntity>> call({
    required String offset,
    required String limit,
  });
}
