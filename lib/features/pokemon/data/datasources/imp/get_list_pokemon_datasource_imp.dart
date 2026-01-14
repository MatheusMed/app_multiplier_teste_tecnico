import 'package:app_multiplier_teste_tecnico/features/core/error/erro_exception.dart';
import 'package:app_multiplier_teste_tecnico/features/core/network/http/i_http_service.dart';
import 'package:app_multiplier_teste_tecnico/features/pokemon/data/datasources/i_get_list_pokemon_datasource.dart';
import 'package:app_multiplier_teste_tecnico/features/pokemon/data/models/pokemon_adpter.dart';
import 'package:app_multiplier_teste_tecnico/features/pokemon/domain/entities/pokemon_entity.dart';

class GetListPokemonDatasourceImp implements IGetListPokemonDatasource {
  final IHttpService _httpService;
  GetListPokemonDatasourceImp(this._httpService);
  @override
  Future<List<PokemonEntity>> call({
    required String offset,
    required String limit,
  }) async {
    try {
      final response = await _httpService.get(
        url: "https://pokeapi.co/api/v2/pokemon?offset=$offset&limit=$limit",
      );

      final listaPokemon = (response.data["results"] as List);

      final listaPokemoDetails = listaPokemon.map((item) async {
        final datailPokemon = await _httpService.get(url: item["url"]);
        return PokemonAdpter.fromMap(datailPokemon.data);
      }).toList();
      final listaPokemonCompleta = await Future.wait(listaPokemoDetails);

      return listaPokemonCompleta;
    } catch (e) {
      throw ErroException(e.toString());
    }
  }
}
