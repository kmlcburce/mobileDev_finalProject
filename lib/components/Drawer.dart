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

  Widget build(BuildContext context) {}
}
