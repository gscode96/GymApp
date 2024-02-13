class Treino {
  String descricao;
  int series;
  int repeticoes;

  Treino(
      {required this.descricao,
      required this.repeticoes,
      required this.series});

  Map<String, dynamic> toMap() {
    return {
      'descricao': descricao,
      'repeticoes': repeticoes,
      'series': series,
    };
  }
}
