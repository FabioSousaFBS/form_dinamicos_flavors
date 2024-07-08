// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:io';

import 'package:flavordinamico/core/constants/constants.dart';
import 'package:flavordinamico/core/constants/global_variables.dart';
import 'package:flavordinamico/core/helper/sembast/sb_produto.dart';
import 'package:flavordinamico/core/services/dio/dio_client_implementation.dart';
import 'package:flavordinamico/core/widgets/textfield/harmon_textfield.dart';
import 'package:flavordinamico/model/form_configuration_entity.dart';
import 'package:flavordinamico/model/produto_model.dart';
import 'package:flutter/material.dart';

abstract class FormularioController{}

class InicialFormularioController extends FormularioController{}

class CarregandoFormularioController extends FormularioController{}

class ErrorFormularioController extends FormularioController{}

class SucessoFormularioController extends FormularioController {

  final List<Widget> componentes;
  //final List<dynamic> controllers;
  
  SucessoFormularioController(this.componentes,); // this.controllers);

}

class FormularioState extends ValueNotifier<FormularioController> {

  ValueNotifier<String> errorMessage = ValueNotifier<String>("");
  FormularioState() : super(InicialFormularioController());

  ValueNotifier<List<HamonTextField>> myForms =  ValueNotifier<List<HamonTextField>>([]);
  ValueNotifier<List<TextEditingController>> myControllers = ValueNotifier<List<TextEditingController>>([]);  

  var listForm = {
    "fields": [
      {
        "id": 001,
        "name": "code",
        "description": "código",
        "position": 1,
        "required": true
      },
      {
        "id": 002,
        "name": "description",
        "description": "descrição",
        "position": 2,
        "required": true
      },
      {
        "id": 003,
        "name": "unit",
        "description": "unidade",
        "position": 3,
        "required": false
      },
      {
        "id": 004,
        "name": "value",
        "description": "valor",
        "position": 4,
        "required": false
      },
    ]  
  };

  Future<void> authentication() async {

    errorMessage.value = "";
    notifyListeners();
    
    DioClientImplementation dio = DioClientImplementation();

    var response = await dio.get(
      url: "${GlobalVariables().urlBase}${Constants.endpointLogin}",
      dataParameters: {
        "email": "dev10@harmonit.com.br",
        "password": "string",
        "ip": "string",
        "languageId": 1,
        "applicationId": 3
      }
    );

    if (response.statusCode == 200) {
      GlobalVariables().token = response.data['value']['result']['token'] ?? "";
    } else {
      errorMessage.value = "Algo deu errado na requisição";
      notifyListeners();
    }

  }


  Future<void> SalvarProduto() async {
    try {
      errorMessage.value = ""; 
      
      notifyListeners();
      Map<String, dynamic> produtoMap = {};      
      
      for (int i = 0; i < myForms.value.length; i++) { 
        produtoMap.putIfAbsent(myForms.value[i].classFieldName, () => myForms.value[i].myController.text);
      }

      if (produtoMap.isNotEmpty) {        
        
        ProdutoStoreSB prodStore = ProdutoStoreSB();
        
        var bSave = await prodStore.insert(Produto.fromMap(produtoMap));

        print(bSave);

      }else{
        errorMessage.value = "Preecha o formulário para salvar";
      }

    } catch (e) {
      errorMessage.value = e.toString();
      value = ErrorFormularioController();
    }
  }

  Future<void> obterForm() async {

    errorMessage.value = "";
    notifyListeners();

    value = CarregandoFormularioController();

    // DioClientImplementation dio = DioClientImplementation();    
    
    // var response = await dio.get(
    //   url: "${GlobalVariables().urlBase}${Constants.endpointLogin}",      
    //   dataParameters: {
    //     "email": "dev10@harmonit.com.br",
    //     "password": "string",
    //     "ip": "string",
    //     "languageId": 1,
    //     "applicationId": 3
    //   }
    // );

    // if (response.statusCode == 200) {
    //   GlobalVariables().token = response.data['value']['result']['token'] ?? "";
    // } else {
    //   errorMessage.value = "Algo deu errado na requisição";
    //   notifyListeners();
    // }

    try {

      for (var e in listForm["fields"]!) { 
        //myControllers.value.add(TextEditingController());      
        FormConfiguration form = FormConfiguration.fromMap(e);      
        myForms.value.add(HamonTextField(
          form: form, 
          //myController: myControllers.value.last, 
          myController: TextEditingController(),
          classFieldName: form.name, 
          id: form.id,)
        );
      }
      
      //myForms.value.map((e) => myControllers.value.add(TextEditingController()));    
      //value = SucessoFormularioController(myForms.value, myControllers.value);  
      value = SucessoFormularioController(myForms.value);  

      notifyListeners();
    } catch (e) {
      value = ErrorFormularioController();    
    }
  }

  

}
