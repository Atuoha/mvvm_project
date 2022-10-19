import 'package:flutter/material.dart';

import 'app/app.dart';

class Test extends StatelessWidget {
  const Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(App.instance.title),
    );
  }
}
