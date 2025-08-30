import "package:flutter/material.dart";
import "dart:math"; 

class ImageChanger extends StatefulWidget {
  const ImageChanger({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ImageChangerState();
  }
}

class _ImageChangerState extends State<ImageChanger> {
  String activeImage = 'assets/img/dice1.png';
  final Random _random = Random();
  void imageFunction() {
    setState(() {
      int diceRoll = _random.nextInt(6) + 1; 
      activeImage = 'assets/img/dice$diceRoll.png';
    });
  }

  @override
  Widget build(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          activeImage,
          width: 200,
          height: 200,
        ),
        const SizedBox(height: 20),
        TextButton(
          onPressed: imageFunction,
          style: TextButton.styleFrom(
            padding: const EdgeInsets.all(20),
            foregroundColor: Colors.black,
            textStyle: const TextStyle(
              fontSize: 30,
            ),
          ),
          child: const Text('Click me to roll a die!'),
        ),
      ],
    );
  }
}
