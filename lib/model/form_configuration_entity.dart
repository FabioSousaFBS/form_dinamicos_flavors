// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class FormConfiguration {

  String id;
  String name;
  String description;
  int position;
  bool isRequire;

  FormConfiguration({
    required this.id,
    required this.name,
    required this.description,
    required this.position,
    required this.isRequire,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'position': position,
      'isRequire': isRequire,
    };
  }

  factory FormConfiguration.fromMap(Map<String, dynamic> map) {
    return FormConfiguration(
      id: map['id'].toString(),
      name: map['name'] as String,
      description: map['description'] as String,
      position: map['position'] as int,
      isRequire: map['required'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory FormConfiguration.fromJson(String source) => FormConfiguration.fromMap(json.decode(source) as Map<String, dynamic>);
}
