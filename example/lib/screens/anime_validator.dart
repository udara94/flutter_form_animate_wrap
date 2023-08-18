import 'package:animated_validator/widgets/custom_text_input.dart';
import 'package:flutter/material.dart';
import 'package:form_animate_wrap/form_animate_wrap.dart';

class AnimeValidatorScreen extends StatefulWidget {
  const AnimeValidatorScreen({Key? key}) : super(key: key);

  @override
  State<AnimeValidatorScreen> createState() => _AnimeValidatorScreenState();
}

class _AnimeValidatorScreenState extends State<AnimeValidatorScreen> {
  bool isPlayAnimation = false;
  bool isSubmitted = false;
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double appbarHeight = AppBar().preferredSize.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Anime Validators"),
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
                      AnimeValidator(
                          enableAnimation: getValidity(firstNameController),
                          child: CustomTextFormField(
                            controller: firstNameController,
                            hintTextVal: "First Name",
                          )),
                      AnimeValidator(
                          enableAnimation: getValidity(lastNameController),
                          child: CustomTextFormField(
                            controller: lastNameController,
                            hintTextVal: "Last Name",
                          )),
                      AnimeValidator(
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
