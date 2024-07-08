// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PreloadingModel {

  final String id;
  final int companyId;
  final String primaryColor;
  //final DateTime createdAt;

  PreloadingModel(this.id, this.companyId, this.primaryColor);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'companyId': companyId,
      'primaryColor': primaryColor,
      //'createdAt': createdAt.millisecondsSinceEpoch,
    };
  }

  factory PreloadingModel.fromMap(Map<String, dynamic> map) {
    return PreloadingModel(
      map['id'] as String,
      map['companyId'] as int,
      map['primaryColor'] as String,
      //DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory PreloadingModel.fromJson(String source) => PreloadingModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
