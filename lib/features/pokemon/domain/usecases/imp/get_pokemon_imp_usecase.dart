import 'package:app_multiplier_teste_tecnico/features/pokemon/domain/entities/pokemon_entity.dart';
import 'package:app_multiplier_teste_tecnico/features/pokemon/domain/repositories/i_get_list_pokemon_repository.dart';
import 'package:app_multiplier_teste_tecnico/features/pokemon/domain/usecases/i_get_list_pokemon_usecase.dart';

class GetPokemonImpUsecase implements IGetListPokemonUsecase {
  final IGetListPokemonRepository _repository;
  GetPokemonImpUsecase(this._repository);
  @override
  Future<List<PokemonEntity>> call({
    required int offset,
    required int limit,
  }) async {
    return await _repository(offset: offset, limit: limit);
  }
}
