import 'package:flavordinamico/screens/controller/forms_controller.dart';
import 'package:flutter/material.dart';

class Formulario extends StatefulWidget {
  const Formulario({super.key});

  @override
  State<Formulario> createState() => _FormularioState();
}

class _FormularioState extends State<Formulario> {

  late FormularioState controller;

  @override
  void initState() {
    
    controller = FormularioState();
    controller.obterForm();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meu formulário"),
      ),
      body: SingleChildScrollView(
        child: ValueListenableBuilder(
          valueListenable: controller, 
          builder: (context, value, child){
            
            if (value is CarregandoFormularioController) {
              return const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: CircularProgressIndicator(),
                  ),
                ],
              );
            }

            if (value is ErrorFormularioController) {
              return const Center(
                child: Text("Ocorreu uma inconsistência :( "),
              );
            }

            if (value is SucessoFormularioController) {              
              return Column(                
                children: value.componentes,
              );
            }

            return Container();
          }
        )
      ),
      bottomNavigationBar: BottomAppBar(
        child: ElevatedButton(
          onPressed: () async {
            await controller.SalvarProduto();
          }, 
          child: const Text("Salvar")
        ),      
      )
    );
  }
}