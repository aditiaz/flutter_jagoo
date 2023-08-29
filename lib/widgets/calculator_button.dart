import 'package:flutter/material.dart';

class CalculatorButton extends StatefulWidget {
  const CalculatorButton(
      {super.key,
      required this.isPressed,
      required this.onPresssed,
      required this.operator,

      required this.title});

  final String isPressed;
  final VoidCallback onPresssed;
  final String title;
  final String operator;
  

  @override
  State<CalculatorButton> createState() => CalculatorButtonState();
}

class CalculatorButtonState extends State<CalculatorButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        fixedSize: const Size.fromWidth(100),
        backgroundColor: widget.isPressed == widget.operator
            ? const Color.fromRGBO(150, 211, 242, 0.1)
            : Colors.transparent,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
            side: const BorderSide(width: 1, color: Color(0xFFD9D9D9))),
      ),
  onPressed: () {widget.onPresssed();},
      child: Text(
        widget.title,
        style: TextStyle(
            color: widget.isPressed == widget.operator
                ? const Color.fromRGBO(0, 119, 182, 1)
                : Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w400),
      ),
    );
  }
}
