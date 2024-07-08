import 'package:flavordinamico/core/constants/global_variables.dart';
import 'package:flavordinamico/core/services/pre_loading.dart';
import 'package:flavordinamico/flavors.dart';
import 'package:flavordinamico/screens/formulario.dart';
import 'package:flavordinamico/screens/lista_de_produtos.dart';
import 'package:flutter/material.dart';

void main() async {

  GlobalVariables().urlBase = "http://vmbees02.brazilsouth.cloudapp.azure.com:1150/";

  await PreLoading.obterThema();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: GlobalVariables().temaClaro,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, 
          children: [
            Text(Flavor.flavorMessage, style: const TextStyle(fontSize: 24),),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Formulario()));
              }, 
              child: const Text("Meu Formulário")
            ),
            const SizedBox(height: 5,),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ListaDeProdutos()));
              }, 
              child: const Text("Lista de produtos")
            )   
          ],
        ),
      ),      
    );
  }
}
