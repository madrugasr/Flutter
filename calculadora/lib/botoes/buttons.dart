import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  final color, textColor, buttonText;

  const Buttons({Key key, this.color, this.textColor, this.buttonText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
            color: color,
            child: Center(
              child: Text(
                buttonText,
                style: TextStyle(color: textColor),
              ),
            )),
      ),
    );
  }
}
