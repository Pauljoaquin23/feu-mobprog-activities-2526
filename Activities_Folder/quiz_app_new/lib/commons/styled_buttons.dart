import 'package:flutter/material.dart';
import 'package:sept_6/commons/text.dart'; 

class StyledButton extends StatelessWidget {
  const StyledButton({
    super.key,
    required this.text,
    required this.buttonListener,
  });

  final String text;
  final VoidCallback buttonListener; 

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: buttonListener,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(40),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), 
        ),
      ),
      child: StyledText(text, 30, const Color.fromARGB(255, 7, 0, 0)),
    );
  }
}
