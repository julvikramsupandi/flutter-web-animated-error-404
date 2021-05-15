import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '404',
      theme: ThemeData(
        primaryColor: Color(0xFF323232),
        fontFamily: 'Poppins',
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      duration: Duration(seconds: 2),
      reverseDuration: Duration(seconds: 2),
      vsync: this,
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _controller.forward();
        }
      });
    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Stack(
        children: [
          Positioned(
            bottom: _height / 2.78,
            right: _height / -2.12,
            child: AnimatedBuilder(
                animation: _controller,
                child: Image.asset(
                  'images/light.png',
                  width: _height * 1.5,
                  height: _height * 1.5,
                ),
                builder: (BuildContext context, _widget) {
                  return Transform.rotate(
                    angle: -_controller.value,
                    alignment: Alignment.bottomCenter,
                    child: _widget,
                  );
                }),
          ),
          Positioned(
            bottom: _height / 120,
            right: _height / 80,
            child: Image.asset(
              'images/illustration.png',
              width: _height / 3,
            ),
          ),
          Center(
            child: Column(
              children: [
                SizedBox(
                  height: _height / 50,
                ),
                Text(
                  '404',
                  style: TextStyle(
                    fontSize: _height / 7,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                Text(
                  'oops... nothing \nto see here',
                  style: TextStyle(
                    fontSize: _height / 28,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
