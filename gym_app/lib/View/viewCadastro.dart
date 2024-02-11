import 'package:flutter/material.dart';

List<String> treinos = <String>['Treino A', 'Treino B', 'Treino C', 'Treino D'];
List<String> exercicios = <String>[
  'Supino Reto',
  'Supino Inclinado',
  'Crusifixo com Halter',
  'Rosca direta barra',
  'Rosca direta com halter',
  'Rosca Martelo',
  'Abdominal supra prancha'
];

List<String> series = <String>['1', '2', '3', '4', '5', '6', '7'];

class ViewCadastro extends StatefulWidget {
  const ViewCadastro({super.key});

  @override
  State<ViewCadastro> createState() => _ViewCadastroState();
}

class _ViewCadastroState extends State<ViewCadastro> {
  String Menu = treinos.first;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Progresso'),
            backgroundColor: Colors.black45,
            centerTitle: true,
            scrolledUnderElevation: 4.0,
          ),
          body: Column(
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        DropdownMenu(
                          initialSelection: treinos.first,
                          onSelected: (String? value) => setState(() {
                            Menu = value!;
                          }),
                          dropdownMenuEntries: treinos
                              .map<DropdownMenuEntry<String>>((String value) {
                            return DropdownMenuEntry<String>(
                                value: value, label: value);
                          }).toList(),
                        )
                      ]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    DropdownMenu(
                      initialSelection: exercicios.first,
                      onSelected: (String? value) => setState(() {
                        Menu = value!;
                      }),
                      dropdownMenuEntries: exercicios
                          .map<DropdownMenuEntry<String>>((String value) {
                        return DropdownMenuEntry<String>(
                            value: value, label: value);
                      }).toList(),
                    ),
                    DropdownMenu(
                      helperText: 'Qtd Repetições',
                      initialSelection: series.first,
                      onSelected: (String? value) => setState(() {
                        Menu = value!;
                      }),
                      dropdownMenuEntries:
                          series.map<DropdownMenuEntry<String>>((String value) {
                        return DropdownMenuEntry<String>(
                            value: value, label: value);
                      }).toList(),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
