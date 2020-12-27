//App side panel
import 'package:flutter/material.dart';

class DrawerBuilder extends StatelessWidget {
  final list;

  DrawerBuilder(
      {this.list: const [
        {'type': 'header', 'label': 'Drawer'},
        {'type': 'item', 'label': 'Settings'},
        {'type': 'item', 'label': 'Logout'},
        {'type': 'item', 'label': 'Item 3'},
        {'type': 'item', 'label': 'Item 4'},
        {'type': 'item', 'label': 'Item 5'}
      ]});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: list.length,
        itemBuilder: (BuildContext ctxt, int index) {
          if (list[index]['type'] == 'header') {
            return DrawerHeader(
              child: Text(list[index]['label']),
              decoration: BoxDecoration(color: Colors.blueAccent),
            );
          } else {
            return ListTile(
              title: Text(list[index]['label']),
            );
          }
        },
      ),
    );
  }
}
