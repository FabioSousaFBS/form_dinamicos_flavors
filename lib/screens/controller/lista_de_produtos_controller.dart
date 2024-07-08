// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:io';

import 'package:flavordinamico/core/helper/sembast/sb_produto.dart';
import 'package:flavordinamico/model/produto_model.dart';
import 'package:flutter/material.dart';

abstract class ListaProdutoController{}

class InicialListaProdutoController extends ListaProdutoController{}

class CarregandoListaProdutoController extends ListaProdutoController{}

class ErrorListaProdutoController extends ListaProdutoController{}

class SucessoListaProdutoController extends ListaProdutoController {

  final List<Produto> produtos;
    
  SucessoListaProdutoController(this.produtos);

}

class ListaProdutoState extends ValueNotifier<ListaProdutoController> {

  ValueNotifier<String> errorMessage = ValueNotifier<String>("");
  ListaProdutoState() : super(InicialListaProdutoController());

  ValueNotifier<List<Produto>> produtosList =  ValueNotifier<List<Produto>>([]);
  
  Future<void> obterProdutos() async {
    try {
      value = CarregandoListaProdutoController();

      errorMessage.value = "";
      notifyListeners();
      
      ProdutoStoreSB prodStore = ProdutoStoreSB();
      produtosList.value = await prodStore.getAll();
      notifyListeners();

      value = SucessoListaProdutoController(produtosList.value);
      
    } catch (e) {
      errorMessage.value = "Algo deu errado no processo para obter os produtos.";
      notifyListeners();

      value = ErrorListaProdutoController();
    }

  }


}
