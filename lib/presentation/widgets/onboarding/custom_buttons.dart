import 'package:flutter/material.dart';

class CustomButtons extends StatelessWidget {
  final String initText;
  final String endText;
  final VoidCallback onPressed;

  const CustomButtons({
    @required this.initText,
    @required this.endText,
    @required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RaisedButton(
        elevation: 0,
        color: const Color(0xff13609e),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              initText,
              style: const TextStyle(color: Colors.white),
            ),
            Text(
              endText,
              style: const TextStyle(color: Colors.orange),
            )
          ],
        ),
      ),
    );
  }
}
