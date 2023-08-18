import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    this.controller,
    this.onChanged,
    this.hintTextVal,
    this.description,
    this.suffixIcon,
    this.onSuffixIconTap,
    this.suffixIconColor,
    this.keyboardType,
    this.isSecure,
    this.focusNode
  }) : super(key: key);
  final TextEditingController? controller;
  final Function? onChanged;
  final String? hintTextVal;
  final String? description;
  final bool? isSecure;
  final IconData? suffixIcon;
  final Function? onSuffixIconTap;
  final Color? suffixIconColor;
  final TextInputType? keyboardType;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context){
    return TextFormField(
      focusNode: focusNode,
      onChanged: (val) {
        if (onChanged != null) {
          onChanged!();
        }
      },
      keyboardType: keyboardType,
      obscureText: isSecure ?? false,
      controller: controller,
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          borderSide: BorderSide(
            color: Colors.black, // Set the color of the border
          ),
        ),
        filled: true,
        fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide(
              color: Colors.black, // Set the color of the border
            ),
          ),
          hintText: hintTextVal,
          hintStyle: const TextStyle(
            fontWeight: FontWeight.normal,
            color: Colors.grey,)),
    );
  }
}
