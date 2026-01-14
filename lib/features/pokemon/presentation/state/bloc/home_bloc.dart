import 'package:app_multiplier_teste_tecnico/features/pokemon/data/datasources/i_get_list_pokemon_datasource.dart';
import 'package:app_multiplier_teste_tecnico/features/pokemon/domain/entities/pokemon_entity.dart';
import 'package:app_multiplier_teste_tecnico/features/pokemon/presentation/state/states/pokemon_home_state.dart';
import 'package:flutter/material.dart';

class HomeBloc {
  final IGetListPokemonDatasource _datasourceImp;

  HomeBloc(this._datasourceImp);

  final ValueNotifier<PokemonHomeState> state = ValueNotifier<PokemonHomeState>(
    InitState(),
  );

  final List<PokemonEntity> _pokemons = [];

  int _offset = 0;
  final int _limit = 20;
  bool _isFetching = false;

  Future<void> getlistPokemon({bool loadMore = false}) async {
    if (_isFetching) return;

    _isFetching = true;

    if (!loadMore) {
      state.value = LoadingState();
      _offset = 0;
      _pokemons.clear();
    } else {
      state.value = SucessState(_pokemons, isLoadingMore: true);
    }

    try {
      final response = await _datasourceImp(limit: _limit, offset: _offset);

      _pokemons.addAll(response);
      _offset += _limit;

      state.value = SucessState(List.from(_pokemons));
    } catch (e) {
      state.value = FailureState('Erro ao buscar pokémons');
    } finally {
      _isFetching = false;
    }
  }
}
