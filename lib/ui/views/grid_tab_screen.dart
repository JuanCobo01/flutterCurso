import 'package:flutter/material.dart';
import '../widgets/base_view.dart';
import '../../models/item.dart';

class GridTabScreen extends StatelessWidget {
  const GridTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final items = List.generate(
      8,
      (i) => Item(titulo: "Item $i", descripcion: "Descripción $i"),
    );

    return DefaultTabController(
      length: 2,
      child: BaseView(
        title: "Grid + Tabs",
        child: Column(
          children: [
            const TabBar(
              tabs: [
                Tab(text: "Grid"),
                Tab(text: "Lista"),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  // GRIDVIEW
                  GridView.builder(
                    padding: const EdgeInsets.all(8),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 3 / 2,
                    ),
                    itemCount: items.length,
                    itemBuilder: (context, i) {
                      return Card(
                        child: Center(
                          child: Text(items[i].titulo),
                        ),
                      );
                    },
                  ),

                  // LISTVIEW (tercer widget)
                  ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context, i) => ListTile(
                      title: Text(items[i].titulo),
                      subtitle: Text(items[i].descripcion),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
