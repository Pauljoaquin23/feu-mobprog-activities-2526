import "package:flutter/material.dart";

class TextContainer extends StatelessWidget {
  const TextContainer(this.text, {super.key});

final String text;


  @override
  Widget build(context) {
    return Center(
      child: Text(
        text,
        style: TextStyle(fontSize: 28, color: Colors.white),
      ),
    );
  }
}
