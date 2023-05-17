import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final TextInputType type;
  final String label;
  final TextEditingController controller;

  const InputField(
      {Key? key,
      required this.type,
      required this.label,
      required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: type,
      controller: controller,
      decoration: InputDecoration(
        label: Text(label),
      ),
    );
  }
}
