import 'package:animated_validator/widgets/custom_text_input.dart';
import 'package:flutter/material.dart';
import 'package:form_animate_wrap/form_animate_wrap.dart';

class GlowValidatorScreen extends StatefulWidget {
  const GlowValidatorScreen({Key? key}) : super(key: key);

  @override
  State<GlowValidatorScreen> createState() => _GlowValidatorScreenState();
}

class _GlowValidatorScreenState extends State<GlowValidatorScreen> {
  bool isSubmitted = false;
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double appbarHeight = AppBar().preferredSize.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Glow Validators"),
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
                      GlowValidator(
                          borderRadius: 15,
                          enableAnimation: getValidity(firstNameController),
                          child: CustomTextFormField(
                            controller: firstNameController,
                            hintTextVal: "First Name",
                          )),
                      GlowValidator(
                          borderRadius: 15,
                          enableAnimation: getValidity(lastNameController),
                          child: CustomTextFormField(
                            controller: lastNameController,
                            hintTextVal: "Last Name",
                          )),
                      GlowValidator(
                          borderRadius: 15,
                          enableAnimation: getValidity(emailController),
                          child: CustomTextFormField(
                            controller: emailController,
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
                        isSubmitted = true;
                      });
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

  bool getValidity(TextEditingController controller) {
    if ((isSubmitted && controller.text.isNotEmpty) ||
        (!isSubmitted && controller.text.isNotEmpty)) {
      return false;
    } else {
      if (isSubmitted) {
        return true;
      } else {
        return false;
      }
    }
  }
}
