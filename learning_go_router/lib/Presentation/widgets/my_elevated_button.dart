import 'package:flutter/material.dart';

class MyElevatedButton extends StatelessWidget {
  const MyElevatedButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.loading = false
  });

  final void Function() onPressed;
  final String text;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: loading == true ? null : onPressed,
        style: ButtonStyle(
            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16)))),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: loading == true ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white,)) : Text(text),
        ));
  }
}
