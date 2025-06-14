import 'package:flutter/material.dart';

class Customeformfailed extends StatelessWidget {
  const Customeformfailed({
    super.key,
    required this.onchange,
    required this.ontap,
    required this.controller,
    required this.hainttext,
    required this.labletext,
    required this.perffixicon,
    required this.type,
    required this.validatior,
  });

  final TextEditingController controller;
  final TextInputType type;
  final FormFieldValidator validatior;
  final String labletext;
  final String hainttext;
  final Widget perffixicon;
  final void Function(String) onchange;
  final void Function(String) ontap;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onFieldSubmitted: ontap,
      onChanged: onchange,
      keyboardType: type,
      controller: controller,
      validator: validatior,
      decoration: InputDecoration(
        labelText: labletext,
        hintText: hainttext,
        prefixIcon: perffixicon,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}
