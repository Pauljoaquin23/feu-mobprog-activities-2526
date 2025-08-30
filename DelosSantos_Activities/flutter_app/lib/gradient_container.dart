import "package:flutter/material.dart";
import "package:flutter_app/text.dart";

class GradientContainer extends StatelessWidget {
  final List<Color> colors;

  void imageFunction() {}

  const GradientContainer(this.colors, {super.key});

  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Center(
        //  child: TextContainer('WOOOOOOOOOOOW'),
        //  child: Image.asset('assets/img/img2.jpg',width: 200,height: 200,),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/img/img1.jpg',
              width: 200,
              height: 200,
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: imageFunction,
              style: TextButton.styleFrom(
                padding: EdgeInsets.all(20),
                foregroundColor: Colors.black,
                textStyle: const TextStyle(
                  fontSize: 30,
                ),
              ),
              child: const Text('click me!'),
              // child: TextContainer('WOOOOOOOOOOOW'),
            ),
          ],
        ),
      ),
    );
  }
}
