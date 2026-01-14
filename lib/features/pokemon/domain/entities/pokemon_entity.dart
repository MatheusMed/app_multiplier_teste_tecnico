class PokemonEntity {
  final String nome;
  final String imagem;
  final List<String> tipos;
  final int altura;
  final int peso;

  PokemonEntity({
    required this.nome,
    required this.imagem,
    required this.tipos,
    required this.altura,
    required this.peso,
  });
}
