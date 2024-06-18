import 'package:flutter/material.dart';

class ListaSliver extends StatefulWidget {
  @override
  State<ListaSliver> createState() => _ListaSliverState();
}

class _ListaSliverState extends State<ListaSliver> {
  List<String> items = List<String>.generate(50, (index) => 'Item ${index + 1}');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            expandedHeight: 200.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Lista Sliver'),
              background: Container(
                color: Colors.blue, // Define a cor de fundo
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return ListTile(
                  title: Text(items[index]),
                  onTap: () {
                    final removedItem = items[index];
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Você selecionou: ${items[index]}'),
                        duration: Duration(seconds: 10),
                        action: SnackBarAction(
                          label: 'Remover',
                          onPressed: () {
                            setState(() {
                              items.removeAt(index);
                            });
                          },
                        ),
                      ),
                    );
                  },
                );
              },
              childCount: items.length,
            ),
          ),
        ],
      ),
    );
  }
}

class ListaGrid extends StatefulWidget {
  @override
  State<ListaGrid> createState() => _ListaGridState();
}

class _ListaGridState extends State<ListaGrid> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Grade de Itens'),
      ),
      body: GridView.builder(
        itemCount: 50,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Center(
              child: Text('Item $index'),
            ),
          );
        },
      ),
    );
  }
}
