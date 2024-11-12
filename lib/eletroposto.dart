class Eletroposto {
  final int id;
  final String nome;
  final String informacoes;
  final String endereco;
  final String telefone;
  final List<String> conectores;

  Eletroposto({
    required this.id,
    required this.nome,
    required this.informacoes,
    required this.endereco,
    required this.telefone,
    required this.conectores,
  });

  factory Eletroposto.fromJson(Map<String, dynamic> json) {
    return Eletroposto(
      id: json['id'],
      nome: json['nome'],
      informacoes: json['informacoes'] ?? '',
      endereco: json['endereco'],
      telefone: json['telefone'] ?? '',
      conectores: List<String>.from(json['conectores']),
    );
  }
}

