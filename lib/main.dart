import 'package:animation/screen/Level1.dart';
import 'package:animation/screen/home_screen.dart';
import 'package:animation/screen/my_widget.dart';
import 'package:animation/services/my_class.dart';
import 'package:animation/services/my_provider.dart';
import 'package:animation/services/shared_object.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyAppChangeNotifier());
}

class MyAppChangeNotifier extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MyClass>(
      create: (context) => MyClass(),
      child: MaterialApp(
        home: Scaffold(
          body: Center(
            child: Level1(),
          ),
        ),
      ),
    );
  }

}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyProvider(
      sharedObject: SharedObject(),
      child: const MaterialApp(
        title: 'Animation',
        home: HomeScreen(),
      ),
    );
  }
}
