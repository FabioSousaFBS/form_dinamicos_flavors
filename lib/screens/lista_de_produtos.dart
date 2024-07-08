import 'package:flavordinamico/core/constants/constants.dart';
import 'package:flavordinamico/model/produto_model.dart';
import 'package:flavordinamico/screens/controller/lista_de_produtos_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ListaDeProdutos extends StatefulWidget {
  const ListaDeProdutos({super.key});

  @override
  State<ListaDeProdutos> createState() => _ListaDeProdutosState();
}

class _ListaDeProdutosState extends State<ListaDeProdutos> {

  late ListaProdutoState controller;

  @override
  void initState() {
    
    controller = ListaProdutoState();
    controller.obterProdutos();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Produtos"),
      ),
      body: SafeArea(

        child: ValueListenableBuilder(
          valueListenable: controller, 
          builder: (context, value, child) {
            if (value is CarregandoListaProdutoController) {
              return const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: CircularProgressIndicator(color: Colors.blue,),                    
                  ),
                ],
              );
            }

            if (value is ErrorListaProdutoController) {
              return const Center(
                child: Text("Ocorreu uma inconsistência :( "),
              );
            }

            if (value is SucessoListaProdutoController) {
              
              return Column(
                children: [
                  ListView.builder(                    
                    shrinkWrap: true,                    
                    itemCount: value.produtos.length,
                    itemBuilder: (context, index) {
                      Produto item = value.produtos[index];
                      return Card(
                        elevation: 0,
                        color: Theme.of(context).brightness == Brightness.dark 
                            ? Color.fromARGB(255, 66, 66, 66)
                            : Colors.grey.shade300,
                        child: ListTile(
                          title: Text("${item.code} - ${item.description}", style: Constants.kTituloLista,),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,                     
                            children: [
                              RichText(
                                text: TextSpan(
                                  style: DefaultTextStyle.of(context).style,
                                  children: [
                                    TextSpan(
                                      text: "Unidade: ",
                                      style: Constants.kSubTituloLista.copyWith(fontWeight: FontWeight.bold),
                                    ),
                                    TextSpan(
                                      text: item.unit,
                                      style: Constants.kSubTituloLista
                                    ),
                                  ]
                                ),
                              ),
                              const SizedBox(height: 5,),
                              RichText(
                                text: TextSpan(
                                  style: DefaultTextStyle.of(context).style,
                                  children: [
                                    TextSpan(
                                      text: "Valor: ",
                                      style: Constants.kSubTituloLista.copyWith(fontWeight: FontWeight.bold),
                                    ),
                                    TextSpan(
                                      text: item.value,
                                      style: Constants.kSubTituloLista.copyWith(color: Colors.orange)
                                    ),
                                  ]
                                ),
                              ),
                        
                            ],
                          ),
                        
                        ),
                      );
                    },
                  ),
                ],
              );
            }

            return Container();


          },
        ),
      ),
    );
  }
}