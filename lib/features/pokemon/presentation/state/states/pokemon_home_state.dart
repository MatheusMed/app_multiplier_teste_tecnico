import 'package:app_multiplier_teste_tecnico/features/pokemon/domain/entities/pokemon_entity.dart';

sealed class PokemonHomeState {}

class InitState extends PokemonHomeState {}

class SucessState extends PokemonHomeState {
  final List<PokemonEntity> listaPokemon;
  final bool isLoadingMore;
  SucessState(this.listaPokemon, {this.isLoadingMore = false});
}

class LoadingState extends PokemonHomeState {}

class FailureState extends PokemonHomeState {
  final String message;

  FailureState(this.message);
}
