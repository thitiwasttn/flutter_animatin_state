import 'package:animation/services/my_provider.dart';
import 'package:animation/services/my_singleton.dart';
import 'package:animation/services/shared_object.dart';
import 'package:animation/widgets/ball.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late Animation<double> ballAnimation;
  late AnimationController ballAnimationController;
  int test = 0;

  @override
  void initState() {
    super.initState();
    ballAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 2000),
    );
    // 0-300 pixed
    ballAnimation = Tween(begin: 0.0, end: 300.0).animate(
      CurvedAnimation(
        parent: ballAnimationController,
        curve: Curves.bounceOut,
      ),
    );

    ballAnimation.addStatusListener((status) {
      print('status $status');
      /*
      if (ballAnimation.status == AnimationStatus.completed) {
        ballAnimationController.reverse();
      } else if (ballAnimation.status == AnimationStatus.dismissed) {
        ballAnimationController.forward();
      }
      */
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    ballAnimationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SharedObject sharedObject = MyProvider.of(context);
    print('sharedObject: $sharedObject');
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home',
          textAlign: TextAlign.center,
        ),
      ),
      body: Container(
        child: myAnimationBuilder(),
      ),
    );
  }

  Widget myAnimationBuilder() {
    return AnimatedBuilder(
      animation: ballAnimation,
      builder: (context, child) {
        return Container(
          width: double.infinity,
          child: child,
          margin: EdgeInsets.only(top: ballAnimation.value),
        );
      },
      child: GestureDetector(
        child: Ball(),
        onTap: () {
          MySingleton.instance.increase();
          ballAnimationController.forward();
        },
        onDoubleTap: () {
          int countTemp = MySingleton.instance.getCounter();
          print('countTemp: $countTemp');
          ballAnimationController.stop();
        },
      ),
    );
  }
}
