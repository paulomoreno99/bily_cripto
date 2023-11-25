import 'package:cripto_moedas/pages/moedas_page.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Moedas Page',
      theme: ThemeData(
        primarySwatch: Colors.indigo
        /*colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,*/
      ),
      home: const MoedasPage(),
      
    );
  }
}
