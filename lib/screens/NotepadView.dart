import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

class MyNote extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          /*
        title: Text(
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        */
          ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            padding: EdgeInsets.all(15),
            child: ConstrainedBox(
              constraints: new BoxConstraints(
                  minHeight: constraints.maxHeight,
                  minWidth: constraints.maxWidth),
              /*    
              child: Text(
                maxLines: null,
              ),
              */
            ),
          );
        },
      ),
    );
  }
}
