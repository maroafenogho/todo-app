import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button(
      {Key? key,
      required this.buttonText,
      required this.onPressed,
      required this.backgroundColor})
      : super(key: key);
  final String buttonText;
  final Function() onPressed;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
      child: TextButton(
          onPressed: onPressed,
          child: Text(
            buttonText,
            style: const TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.w700,
            ),
          ),
          style: TextButton.styleFrom(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(0),
              ),
            ),
            backgroundColor: backgroundColor,
            primary: Colors.white,
            elevation: 10.0,
            padding: const EdgeInsets.all(10),
          )),
    );
  }
}
