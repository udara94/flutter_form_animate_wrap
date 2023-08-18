import 'package:animated_validator/widgets/custom_text_input.dart';
import 'package:flutter/material.dart';
import 'package:form_animate_wrap/form_animate_wrap.dart';

class GlowSelectorScreen extends StatefulWidget {
  const GlowSelectorScreen({Key? key}) : super(key: key);

  @override
  State<GlowSelectorScreen> createState() => _GlowSelectorScreenState();
}

class _GlowSelectorScreenState extends State<GlowSelectorScreen> {
  FocusNode firstNameNode = FocusNode();
  FocusNode lastNameNode = FocusNode();
  FocusNode emailNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double appbarHeight = AppBar().preferredSize.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Glow Selector"),
      ),
      body: SingleChildScrollView(
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
                      GlowSelector(
                        borderRadius: 15,
                        enableFocusGlowing: true,
                          focusGlowColor: Colors.blueAccent,
                          focusNode: firstNameNode,
                          child:  CustomTextFormField(
                            focusNode: firstNameNode,
                            hintTextVal: "First Name",
                          )),
                      GlowSelector(
                          borderRadius: 15,
                          enableFocusGlowing: true,
                          focusNode: lastNameNode,
                          focusGlowColor: Colors.yellow,
                          child:  CustomTextFormField(
                            focusNode: lastNameNode,
                            hintTextVal: "Last Name",
                          )),
                      GlowSelector(
                          borderRadius: 15,
                          enableFocusGlowing: true,
                          focusNode: emailNode,
                          focusGlowColor: Colors.red,
                          child:  CustomTextFormField(
                            focusNode: emailNode,
                            hintTextVal: "Email",
                          ))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 50),
                  child: GestureDetector(
                    onTap: () {
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.lightBlue,
                          borderRadius: BorderRadius.circular(15)
                      ),
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
    );
  }
}
