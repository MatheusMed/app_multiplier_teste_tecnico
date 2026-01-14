import 'package:app_multiplier_teste_tecnico/features/pokemon/data/datasources/i_get_list_pokemon_datasource.dart';
import 'package:app_multiplier_teste_tecnico/features/pokemon/domain/entities/pokemon_entity.dart';
import 'package:app_multiplier_teste_tecnico/features/pokemon/domain/repositories/i_get_list_pokemon_repository.dart';

class GetListPokemonRepositoryImp implements IGetListPokemonRepository {
  final IGetListPokemonDatasource _datasource;
  GetListPokemonRepositoryImp(this._datasource);
  @override
  Future<List<PokemonEntity>> call({
    required String offset,
    required String limit,
  }) async {
    return await _datasource(limit: limit, offset: offset);
  }
}
