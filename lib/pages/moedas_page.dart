// ignore_for_file: sort_child_properties_last, avoid_print, depend_on_referenced_packages

import 'package:cripto_moedas/models/moeda.dart';
import 'package:cripto_moedas/repositories/moedas_repository.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MoedasPage extends StatelessWidget {
  const MoedasPage({super.key});

  @override
  Widget build(BuildContext context) {
    final tabela = MoedaRepository.tabela;
    NumberFormat real = NumberFormat.currency(locale: 'pt_BR', name: 'R\$');
    List<Moeda> selecionadas = [];



    return  Scaffold(
      appBar: AppBar(
        title: const Text('Cripto Moedas'),
      ),
      body: ListView.separated(
        itemBuilder: (BuildContext context, int moeda) {
          return ListTile(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12))
            ) ,
            leading: SizedBox(
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
              selectedTileColor: Colors.indigo.shade100,
              onLongPress: () {
                (selecionadas.contains(tabela[moeda]))
                  ? selecionadas.remove(tabela[moeda])
                  : selecionadas.add(tabela[moeda]);
                  print((tabela[moeda].nome));
              },
            //trailing: Text(tabela[moeda].preco.toString()),
          );
        },
        padding: const EdgeInsets.all(16),
        separatorBuilder: (_, ___) => const Divider(),
        itemCount: tabela.length)
    );
  }
}