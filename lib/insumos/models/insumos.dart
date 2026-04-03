// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Insumo {
  //variáveis de instância
  int? id;
  String? nome;

  int? estoqueMinimo;
  String? descricao;
  String? categoria;
  String? unidadeMedida;
  String? imagem;
  Insumo({
    this.id,
    this.nome,
    this.estoqueMinimo,
    this.descricao,
    this.categoria,
    this.unidadeMedida,
    this.imagem,
  });

  Insumo copyWith({
    int? id,
    String? nome,
    int? estoqueMinimo,
    String? descricao,
    String? categoria,
    String? unidadeMedida,
    String? imagem,
  }) {
    return Insumo(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      estoqueMinimo: estoqueMinimo ?? this.estoqueMinimo,
      descricao: descricao ?? this.descricao,
      categoria: categoria ?? this.categoria,
      unidadeMedida: unidadeMedida ?? this.unidadeMedida,
      imagem: imagem ?? this.imagem,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'nome': nome,
      'estoqueMinimo': estoqueMinimo,
      'descricao': descricao,
      'categoria': categoria,
      'unidadeMedida': unidadeMedida,
      'imagem': imagem,
    };
  }

  factory Insumo.fromMap(Map<String, dynamic> map) {
    return Insumo(
      id: map['id'] != null ? map['id'] as int : null,
      nome: map['nome'] != null ? map['nome'] as String : null,
      estoqueMinimo: map['estoqueMinimo'] != null ? map['estoqueMinimo'] as int : null,
      descricao: map['descricao'] != null ? map['descricao'] as String : null,
      categoria: map['categoria'] != null ? map['categoria'] as String : null,
      unidadeMedida: map['unidadeMedida'] != null ? map['unidadeMedida'] as String : null,
      imagem: map['imagem'] != null ? map['imagem'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Insumo.fromJson(String source) =>
      Insumo.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Insumo(id: $id, nome: $nome, estoqueMinimo: $estoqueMinimo, descricao: $descricao, categoria: $categoria, unidadeMedida: $unidadeMedida, imagem: $imagem)';
  }

  @override
  bool operator ==(covariant Insumo other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.nome == nome &&
      other.estoqueMinimo == estoqueMinimo &&
      other.descricao == descricao &&
      other.categoria == categoria &&
      other.unidadeMedida == unidadeMedida &&
      other.imagem == imagem;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      nome.hashCode ^
      estoqueMinimo.hashCode ^
      descricao.hashCode ^
      categoria.hashCode ^
      unidadeMedida.hashCode ^
      imagem.hashCode;
  }
}
