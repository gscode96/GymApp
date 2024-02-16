import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gym_app/Entidades/treino.dart';
import 'package:gym_app/View/viewCadastroTreino.dart';

List<String> repeticoes = <String>[
  '1',
  '2',
  '3',
  '4',
  '5',
  '6',
  '7',
  '8',
  '9',
  '10',
  '11',
  '12',
  '13',
  '14',
  '15',
  '16',
  '17',
  '18',
  '19',
  '20'
];
List<String> series = <String>['1', '2', '3', '4', '5', '6', '7', '8'];

class ViewCadastroExercicio extends StatefulWidget {
  const ViewCadastroExercicio({super.key});

  @override
  State<ViewCadastroExercicio> createState() => _ViewCadastroExercicioState();
}

final _formKey = GlobalKey<FormState>();

final descricaoSelecionada = TextEditingController();
int repeticoesSelecionada = 0;
int seriesSelecionada = 0;
int cargaSelecionada = 0;

class _ViewCadastroExercicioState extends State<ViewCadastroExercicio> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Cadastro de exercicio'),
          backgroundColor: Colors.black45,
        ),
        body: Form(
          key: _formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: descricaoSelecionada,
                  maxLength: 30,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Digite a descrição';
                    }
                  },
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: 'Descrição',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    DropdownMenu(
                      helperText: 'Series',
                      onSelected: (value) {
                        setState(() {
                          int valor = int.parse(value!);
                          seriesSelecionada = valor;
                        });
                      },
                      initialSelection: series.first,
                      dropdownMenuEntries:
                          series.map<DropdownMenuEntry<String>>((String value) {
                        return DropdownMenuEntry<String>(
                            value: value, label: value);
                      }).toList(),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        children: [
                          DropdownMenu(
                            helperText: 'Repetições',
                            menuHeight: 500,
                            onSelected: (value) {
                              setState(() {
                                int valor = int.parse(value!);
                                repeticoesSelecionada = valor;
                              });
                            },
                            initialSelection: repeticoes.first,
                            dropdownMenuEntries: repeticoes
                                .map<DropdownMenuEntry<String>>((String value) {
                              return DropdownMenuEntry<String>(
                                  value: value, label: value);
                            }).toList(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Treino treino = Treino(
                            descricao: descricaoSelecionada.text,
                            repeticoes: repeticoesSelecionada,
                            series: seriesSelecionada);

                        var db = FirebaseFirestore.instance;
                        db
                            .collection("treino")
                            .doc()
                            .set(treino.toMap())
                            .then((_) => print('Documento salvo com sucesso!'))
                            .catchError((error) =>
                                print('Erro ao salvar documento: $error'));
                        Navigator.of(context).pop(context);
                      },
                      child: const Text('Salvar'),
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
