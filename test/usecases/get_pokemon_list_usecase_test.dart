import 'package:app_multiplier_teste_tecnico/features/pokemon/domain/entities/pokemon_entity.dart';
import 'package:app_multiplier_teste_tecnico/features/pokemon/domain/usecases/imp/get_pokemon_imp_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../mocks.dart';

void main() {
  late MockGetListPokemonRepository repository;
  late GetPokemonImpUsecase usecase;

  final pokemonMock = PokemonEntity(
    nome: 'pikachu',
    imagem: 'url',
    tipos: ['electric'],
    altura: 4,
    peso: 60,
  );

  setUp(() {
    repository = MockGetListPokemonRepository();
    usecase = GetPokemonImpUsecase(repository);
  });

  test('should return pokemon list from repository', () async {
    when(
      () => repository(offset: 0, limit: 20),
    ).thenAnswer((_) async => [pokemonMock]);

    final result = await usecase(offset: 0, limit: 20);

    expect(result, isA<List<PokemonEntity>>());
    expect(result.length, 1);
    expect(result.first.nome, 'pikachu');

    verify(() => repository(offset: 0, limit: 20)).called(1);
    verifyNoMoreInteractions(repository);
  });
}
