
import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {

  MyWidget();

  @override
  State<StatefulWidget> createState() {
    return _MyWidgetState();
  }
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home',
          textAlign: TextAlign.center,
        ),
      ),
      body: Container(
        child: Text('hello')
      ),
    );
  }

}