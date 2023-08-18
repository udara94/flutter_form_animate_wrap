import 'package:animated_validator/widgets/custom_text_input.dart';
import 'package:flutter/material.dart';
import 'package:form_animate_wrap/form_animate_wrap.dart';

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
  bool isSubmittedAnimeValidator = false;
  bool isSubmittedGlowValidator = false;
  TextEditingController avFirstNameController = TextEditingController();
  TextEditingController avLastNameController = TextEditingController();
  TextEditingController avEmailController = TextEditingController();

  TextEditingController gvFirstNameController = TextEditingController();
  TextEditingController gvLastNameController = TextEditingController();
  TextEditingController gvEmailController = TextEditingController();

  FocusNode firstNameNode = FocusNode();
  FocusNode lastNameNode = FocusNode();
  FocusNode emailNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double appbarHeight = AppBar().preferredSize.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: PageView(
        children: [
          Container(
            color: Colors.white,
            child: SingleChildScrollView(
              child: Center(
                child: SizedBox(
                  width: width * 0.8,
                  height: height - appbarHeight,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: height * 0.5,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Text(
                              "Anime Validators",
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            AnimeValidator(
                                enableAnimation:
                                    getAVValidity(avFirstNameController),
                                child: CustomTextFormField(
                                  controller: avFirstNameController,
                                  hintTextVal: "First Name",
                                )),
                            AnimeValidator(
                                enableAnimation:
                                    getAVValidity(avLastNameController),
                                child: CustomTextFormField(
                                  controller: avLastNameController,
                                  hintTextVal: "Last Name",
                                )),
                            AnimeValidator(
                                enableAnimation:
                                    getAVValidity(avEmailController),
                                child: CustomTextFormField(
                                  controller: avEmailController,
                                  hintTextVal: "Email",
                                )),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 50),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              isSubmittedAnimeValidator = true;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.lightBlue,
                                borderRadius: BorderRadius.circular(15)),
                            width: width * 0.8,
                            child: const Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Text(
                                "Submit",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            color: Colors.white,
            child: SingleChildScrollView(
              child: Center(
                child: SizedBox(
                  width: width * 0.8,
                  height: height - appbarHeight,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: height * 0.5,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Text(
                              "Glow Selector",
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            GlowSelector(
                                borderRadius: 15,
                                enableFocusGlowing: true,
                                focusGlowColor: Colors.blueAccent,
                                focusNode: firstNameNode,
                                child: CustomTextFormField(
                                  focusNode: firstNameNode,
                                  hintTextVal: "First Name",
                                )),
                            GlowSelector(
                                borderRadius: 15,
                                enableFocusGlowing: true,
                                focusNode: lastNameNode,
                                focusGlowColor: Colors.green,
                                child: CustomTextFormField(
                                  focusNode: lastNameNode,
                                  hintTextVal: "Last Name",
                                )),
                            GlowSelector(
                                borderRadius: 15,
                                enableFocusGlowing: true,
                                focusNode: emailNode,
                                focusGlowColor: Colors.red,
                                child: CustomTextFormField(
                                  focusNode: emailNode,
                                  hintTextVal: "Email",
                                ))
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 50),
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.lightBlue,
                                borderRadius: BorderRadius.circular(15)),
                            width: width * 0.8,
                            child: const Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Text(
                                "Submit",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            color: Colors.white,
            child: SingleChildScrollView(
              child: Center(
                child: SizedBox(
                  width: width * 0.8,
                  height: height - appbarHeight,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: height * 0.5,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Text(
                              "Glow Validators",
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            GlowValidator(
                                borderRadius: 15,
                                enableAnimation:
                                    getGVValidity(gvFirstNameController),
                                child: CustomTextFormField(
                                  controller: gvFirstNameController,
                                  hintTextVal: "First Name",
                                )),
                            GlowValidator(
                                borderRadius: 15,
                                enableAnimation:
                                    getGVValidity(gvLastNameController),
                                child: CustomTextFormField(
                                  controller: gvLastNameController,
                                  hintTextVal: "Last Name",
                                )),
                            GlowValidator(
                                borderRadius: 15,
                                enableAnimation:
                                    getGVValidity(gvEmailController),
                                child: CustomTextFormField(
                                  controller: gvEmailController,
                                  hintTextVal: "Email",
                                )),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 50),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              isSubmittedGlowValidator = true;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.lightBlue,
                                borderRadius: BorderRadius.circular(15)),
                            width: width * 0.8,
                            child: const Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Text(
                                "Submit",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool getAVValidity(TextEditingController controller) {
    if ((isSubmittedAnimeValidator && controller.text.isNotEmpty) ||
        (!isSubmittedAnimeValidator && controller.text.isNotEmpty)) {
      return false;
    } else {
      if (isSubmittedAnimeValidator) {
        return true;
      } else {
        return false;
      }
    }
  }

  bool getGVValidity(TextEditingController controller) {
    if ((isSubmittedGlowValidator && controller.text.isNotEmpty) ||
        (!isSubmittedGlowValidator && controller.text.isNotEmpty)) {
      return false;
    } else {
      if (isSubmittedGlowValidator) {
        return true;
      } else {
        return false;
      }
    }
  }
}
