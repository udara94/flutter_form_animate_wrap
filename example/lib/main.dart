import 'package:animated_validator/screens/anime_validator.dart';
import 'package:animated_validator/screens/glow_selector.dart';
import 'package:animated_validator/screens/glow_validator.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Form Animate Wrap Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isPlayAnimation = false;
  FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: height * 0.5,
          width: width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AnimeValidatorScreen()));
                },
                child: Container(
                  width: width * 0.8,
                  color: Colors.lightBlue,
                  child: const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      "Anime Validators",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const GlowSelectorScreen()));
                },
                child: Container(
                  width: width * 0.8,
                  color: Colors.lightBlue,
                  child: const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      "Glow Selector",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const GlowValidatorScreen()));
                },
                child: Container(
                  width: width * 0.8,
                  color: Colors.lightBlue,
                  child: const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      "Glow Validators",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
