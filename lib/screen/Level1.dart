import 'package:animation/services/my_class.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const kMyTextStyle = TextStyle(fontSize: 40, color: Colors.blue);

class Level1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MyClass myClass = Provider.of<MyClass>(context);
    return Container(
      width: double.infinity,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            myClass.first.toString(),
            style: kMyTextStyle,
          ),
          Level2(),
        ],
      ),
    );
  }
}

class Level2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MyClass myClass = Provider.of<MyClass>(context);
    return Container(
      child: Column(
        children: [
          Text(
            myClass.second.toString(),
            style: kMyTextStyle,
          ),
          Level3()
        ],
      ),
    );
  }
}

class Level3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MyClass myClass = Provider.of<MyClass>(context);
    return Container(
      child: FloatingActionButton(onPressed: () {
        myClass.changeAllProperties();
      },
        child: Text('Random'),
      ),
    );
  }

}