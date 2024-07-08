import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Produto {

  int? id;
  String code;
  String description;
  String unit;
  String value;
  
  Produto({
    this.id,
    required this.code,
    required this.description,
    required this.unit,
    required this.value,
  });  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'code': code,
      'description': description,
      'unit': unit,
      'value': value,
    };
  }

  factory Produto.fromMap(Map<String, dynamic> map) {
    return Produto(
      id: map['key'],
      code: map['code'] as String,
      description: map['description'] as String,
      unit: map['unit'] as String,
      value: map['value'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Produto.fromJson(String source) => Produto.fromMap(json.decode(source) as Map<String, dynamic>);
}
