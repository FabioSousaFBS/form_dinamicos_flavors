// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flavordinamico/model/form_configuration_entity.dart';
import 'package:flutter/material.dart';

class HamonTextField extends StatelessWidget {
  
  final FormConfiguration form;
  TextEditingController myController;
  final String classFieldName; 
  final String id; 

  HamonTextField({
    Key? key,    
    required this.classFieldName,
    required this.form,    
    required this.myController,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: myController,
        decoration: InputDecoration(
          labelText: form.description,          
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
