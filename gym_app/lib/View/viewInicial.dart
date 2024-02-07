import 'package:flutter/material.dart';

class ViewInicial extends StatefulWidget {
  const ViewInicial({Key? key}) : super(key: key);

  @override
  State<ViewInicial> createState() => _ViewInicialState();
}

class _ViewInicialState extends State<ViewInicial> {
  final ColorScheme colorScheme = ThemeData().colorScheme;
  final Color oddItemColor = Colors.blue.withOpacity(0.05);
  final Color evenItemColor = Colors.blue.withOpacity(0.15);
  int linhas = 0;
  late final GlobalKey<AnimatedListState> _listKey1;
  late final GlobalKey<AnimatedListState> _listKey2;

  @override
  void initState() {
    super.initState();
    _listKey1 = GlobalKey();
    _listKey2 = GlobalKey();
  }

  @override
  Widget build(BuildContext context) {
    List<String> titulos = <String>['Progresso', 'Medidas'];

    int contagem = 2;

    return Container(
      padding: const EdgeInsets.all(20),
      child: DefaultTabController(
        initialIndex: 0,
        length: contagem,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            appBar: AppBar(
              title: const Text('Gym App'),
              centerTitle: true,
              backgroundColor: Colors.black12,
              notificationPredicate: (ScrollNotification notification) {
                return notification.depth == 1;
              },
              scrolledUnderElevation: 4.0,
              shadowColor: Theme.of(context).shadowColor,
              bottom: TabBar(
                tabs: <Widget>[
                  Tab(
                    icon: const Icon(Icons.sports_gymnastics),
                    text: titulos[0],
                  ),
                  Tab(
                    icon: const Icon(Icons.sports_gymnastics),
                    text: titulos[1],
                  ),
                ],
              ),
            ),
            body: TabBarView(
              children: <Widget>[
                AnimatedList(
                  key: _listKey1,
                  initialItemCount: linhas,
                  itemBuilder: (BuildContext context, int index,
                      Animation<double> animation) {
                    return _buildItem(context, index, animation);
                  },
                ),
                AnimatedList(
                  key: _listKey2,
                  initialItemCount: linhas,
                  itemBuilder: (BuildContext context, int index,
                      Animation<double> animation) {
                    return _buildItem(context, index, animation);
                  },
                ),
              ],
            ),
            floatingActionButton: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FloatingActionButton(
                    onPressed: () {
                      setState(() {
                        linhas += 1;
                      });
                      _listKey1.currentState!.insertItem(linhas - 1);
                      _listKey2.currentState!.insertItem(linhas - 1);
                    },
                    child: const Icon(Icons.add),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FloatingActionButton(
                    onPressed: () {
                      setState(() {
                        linhas -= 1;
                      });
                      _listKey1.currentState!.removeItem(linhas - 1,
                          (context, animation) => SizedBox.shrink());
                      _listKey2.currentState!.removeItem(linhas - 1,
                          (context, animation) => SizedBox.shrink());
                    },
                    child: const Icon(Icons.exposure_minus_1),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildItem(
      BuildContext context, int index, Animation<double> animation) {
    return SizeTransition(
      sizeFactor: animation,
      child: ListTile(
        tileColor: index.isOdd ? oddItemColor : evenItemColor,
        title: Text('Treino: $index'),
      ),
    );
  }
}
