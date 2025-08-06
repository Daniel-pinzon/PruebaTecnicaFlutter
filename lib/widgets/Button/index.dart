import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String texto;
  final VoidCallback onPressed;
  final Color color;
  final Color textColor;
  final double fontSize;
  final String position;

  const ButtonWidget({
    super.key,
    required this.texto,
    required this.onPressed,
    this.color = Colors.blue,
    this.textColor = Colors.white,  
    this.fontSize = 16.0,
    this.position = 'center',
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: position == 'left'
          ? Alignment.centerLeft
          : position == 'right'
              ? Alignment.centerRight
              : Alignment.center,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        ),
        child: Text(
          texto,
          style: TextStyle(
            color: textColor,
            fontSize: fontSize,
          ),
        ),
      ),
    );
  }


}