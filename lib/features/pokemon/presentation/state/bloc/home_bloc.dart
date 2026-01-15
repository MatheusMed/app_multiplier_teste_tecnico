import 'package:app_multiplier_teste_tecnico/features/core/network/connectivity/i_connectivity_service.dart';
import 'package:app_multiplier_teste_tecnico/features/core/storage/i_local_storage.dart';
import 'package:app_multiplier_teste_tecnico/features/pokemon/data/datasources/i_get_list_pokemon_datasource.dart';
import 'package:app_multiplier_teste_tecnico/features/pokemon/data/models/pokemon_adpter.dart';
import 'package:app_multiplier_teste_tecnico/features/pokemon/domain/entities/pokemon_entity.dart';
import 'package:app_multiplier_teste_tecnico/features/pokemon/presentation/state/states/pokemon_home_state.dart';
import 'package:flutter/material.dart';

class HomeBloc {
  final IGetListPokemonDatasource _remoteDatasource;
  final ILocalStorage _localStorage;
  final IConnectivityService _connectivity;

  HomeBloc(this._remoteDatasource, this._localStorage, this._connectivity);

  final ValueNotifier<PokemonHomeState> state = ValueNotifier<PokemonHomeState>(
    InitState(),
  );

  final List<PokemonEntity> _pokemons = [];
  int _offset = 0;
  final int _limit = 20;
  bool _isFetching = false;

  static const _cacheKey = 'pokemon_list_ui';

  Future<void> getlistPokemon({bool loadMore = false}) async {
    if (_isFetching) return;
    _isFetching = true;

    final hasInternet = await _connectivity.isConnected;

    try {
      if (!hasInternet) {
        final cached = _localStorage.read<List<dynamic>>(_cacheKey) ?? [];

        if (cached.isEmpty) {
          state.value = FailureState('Sem internet e sem dados salvos');
        } else {
          _pokemons
            ..clear()
            ..addAll(
              cached.map(
                (e) => PokemonAdpter.fromMap(Map<String, dynamic>.from(e)),
              ),
            );

          state.value = SucessState(List.from(_pokemons));
        }
        return;
      }

      if (!loadMore) {
        state.value = LoadingState();
        _pokemons.clear();
        _offset = 0;
      }

      final response = await _remoteDatasource(offset: _offset, limit: _limit);

      _pokemons.addAll(response);
      _offset += _limit;

      await _localStorage.save(
        _cacheKey,
        _pokemons.map(PokemonAdpter.toMap).toList(),
      );
      state.value = SucessState(List.from(_pokemons));
    } catch (_) {
      state.value = FailureState('Erro ao buscar pokémons');
    } finally {
      _isFetching = false;
    }
  }

  void dispose() {
    state.dispose();
  }
}
