// ignore_for_file: sort_child_properties_last, avoid_print, depend_on_referenced_packages

import 'package:cripto_moedas/models/moeda.dart';
import 'package:cripto_moedas/repositories/moedas_repository.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MoedasPage extends StatefulWidget {
  const MoedasPage({super.key});

  @override
  State<MoedasPage> createState() => _MoedasPageState();
}

class _MoedasPageState extends State<MoedasPage> {
    final tabela = MoedaRepository.tabela;
    NumberFormat real = NumberFormat.currency(locale: 'pt_BR', name: 'R\$');
    List<Moeda> selecionadas = [];

appBarDinamica() {
  if (selecionadas.isEmpty) {
    return AppBar(
        title: const Text('Cripto Moedas'),
        
        
      );
  } else {
    return AppBar(
      title: Text('${selecionadas.length} selecionadas'),
      backgroundColor: Colors.amberAccent,
        elevation: 1,
        iconTheme: const IconThemeData(color: Colors.black87),
        titleTextStyle: const TextStyle(
        color: Colors.black87,
        fontSize: 20,
        fontWeight: FontWeight.bold),
      leading: IconButton(
        onPressed: () {
          setState(() {
            selecionadas = [];
          });
        },
        icon: const Icon(Icons.close),
    ));
  }
  
}


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: appBarDinamica(),
      body: ListView.separated(
        itemBuilder: (BuildContext context, int moeda) {
          return ListTile(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12))
            ) ,
            leading: (selecionadas.contains(tabela[moeda]))
              ? const CircleAvatar(
                child: Icon(Icons.check),
              )            
            : SizedBox(
              child: Image.asset(tabela[moeda].icone),
              width: 40,
            ),
            title: Text(tabela[moeda].nome,
            style: 
            const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              
            ),),
            trailing: Text(
              real.format(tabela[moeda].preco)),
              selected: (selecionadas.contains(tabela[moeda])) ,
              //selected: false,
              selectedTileColor: Colors.indigo[50],
            onLongPress: () {
                setState(() {
                  (selecionadas.contains(tabela[moeda]))
                  ? selecionadas.remove(tabela[moeda])
                  : selecionadas.add(tabela[moeda]);
                  
                });
                
              },
            //trailing: Text(tabela[moeda].preco.toString()),
          );
        },
        padding: const EdgeInsets.all(16),
        separatorBuilder: (_, ___) => const Divider(),
        itemCount: tabela.length),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat ,
        floatingActionButton: selecionadas.isNotEmpty
        ? FloatingActionButton.extended(
          onPressed: (){},
          icon: const Icon(Icons.star),

          label: const Text('Favoritar'),
          backgroundColor: Colors.greenAccent,
          
          )
        : null,
          
    );
  }
}