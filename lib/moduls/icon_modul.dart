import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class IconModule extends StatelessWidget {
  IconModule(this.name);
  String? name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: Container(
        child: Text('${name}',style: Theme.of(context).textTheme.displayMedium,),
      )),
    );
  }
}
