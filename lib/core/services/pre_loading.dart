import 'package:flavordinamico/core/constants/constants.dart';
import 'package:flavordinamico/core/constants/global_variables.dart';
import 'package:flavordinamico/core/services/dio/dio_client_implementation.dart';
import 'package:flavordinamico/model/preloading_model.dart';
import 'package:flutter/material.dart';

class PreLoading {

  static Future<void> obterThema() async {

    try {

      DioClientImplementation dio = DioClientImplementation();    
      
      var response = await dio.get(
        url: Constants.endpointThema,
      );

      if (response.statusCode == 200) {
        
        List<PreloadingModel> lista = [];

        for (var e in response.data) {
          lista.add(PreloadingModel.fromMap(e));
        }        
        
        PreloadingModel item = lista.where((e) => e.companyId.toString() == GlobalVariables().companyID).first;
        Color baseColor = hexToColor(item.primaryColor); 

        GlobalVariables().temaClaro = ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: baseColor),
          useMaterial3: true,
        );

      }
    } catch (e) {
      throw Exception(e);
    }
  
  }

  static Color hexToColor(String hexString) {
    // Remove o caractere '#' se ele estiver presente
    hexString = hexString.replaceAll('#', '');
    
    // Adiciona 'FF' no início da string para definir a opacidade como 100% se não estiver presente
    if (hexString.length == 6) {
      hexString = 'FF' + hexString;
    }
    
    // Converte a string hexadecimal para um inteiro
    int hexValue = int.parse(hexString, radix: 16);
    
    // Retorna um objeto Color
    return Color(hexValue);
  }

  

}