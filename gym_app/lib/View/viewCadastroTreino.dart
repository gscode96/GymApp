import 'package:flutter/material.dart';

List<String> itens = ['Supino reto', 'Supino Inclinado', 'Rosca direta'];

class ViewCadastroTreino extends StatefulWidget {
  const ViewCadastroTreino({super.key});

  @override
  State<ViewCadastroTreino> createState() => _ViewCadastroTreinoState();
}

class _ViewCadastroTreinoState extends State<ViewCadastroTreino> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    height: 150,
                    decoration: const BoxDecoration(
                        color: Colors.blueAccent, shape: BoxShape.rectangle),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {});
                              },
                              backgroundColor: Colors.blueAccent,
                              shape: CircleBorder(),
                              mouseCursor: MaterialStateMouseCursor.clickable,
                              tooltip: 'Voltar',
                              child: const Icon(
                                Icons.arrow_back,
                                size: 20,
                              ),
                            ),
                          ],
                        ),
                        const Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Text(
                                'Cadastro de treinos',
                                style: TextStyle(
                                    color: Colors.black87, fontSize: 20),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const Row(
              children: [
                Padding(padding: EdgeInsets.all(30)),
                Text(
                  'Lista de treinos - Treino A',
                  style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
                )
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: itens.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(itens[index]),
                    mouseCursor: MaterialStateMouseCursor.clickable,
                    selected: true,
                    tileColor: Colors.black45,
                    shape: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black45)),
                    contentPadding: const EdgeInsets.all(10),
                    visualDensity: VisualDensity.adaptivePlatformDensity,
                    leading: const Icon(Icons.fitness_center_outlined,
                        color: Colors.black45),
                    onTap: () {
                      print('Clicou no ${itens[index]}');
                    },
                  );
                },
              ),
            ),
            Row(
              children: [
                ButtonBar(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {});
                      },
                      style: const ButtonStyle(
                          mouseCursor: MaterialStateMouseCursor.clickable),
                      child: const Text('+ Exercicios'),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
