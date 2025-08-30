import "package:flutter/material.dart";
import "package:flutter_app/gradient_container.dart";

// Widget -> Object -> Class
//  USE CONSTANTS FOR THE VALUES THAT WILL NOT CHANGE AND SO THAT IT WILL BE EFFIECIENT FOR THE RUNTIME OF THE APPLICATION OR //  THE APP TO RUN FASTER
void main() {
  // runApp(const MaterialApp(home: Text('Hello World'),));
  // Use Refactor!! for a certain widget to wrap it with another widget\
  // Shift + Alt + F for auto format of the code
  runApp(
    MaterialApp(
      home: Scaffold(
        body: GradientContainer([
          Colors.deepOrange,
          Colors.deepPurpleAccent,
        ]),
      ),
    ),
  );
}


//GradientContainer gc = new GradientContainer();


// stateful and Stateless Widget
// Stateless Widget -> (cannot be changed) -> final properties
// Stateful Widget -> (can be changed) -> properties are not final
// class GradientContainer extends StatelessWidget {

// //super key is used to pass the key to the super class or immediate parent class
// const GradientContainer({super.key});


//   @override
//   Widget build(context) {
//     return Container(
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           colors: [Colors.deepOrange, Colors.deepPurpleAccent],
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//         ),
//       ),
//       child: Center(
//         child: Text(
//           'Hello World',
//           style: TextStyle(fontSize: 28, color: Colors.white),
//         ),
//       ),
//     );
//   }
// }
  // ** Positional Args //type dynamic as is yung pag add kung ano yung una
// ** posittional arguments 
// ** best practice is to use positional arguments then use named arguments
//  void add(num11, num2){

//   }

//   void demo (){
//     add(5,3); // positional arguments 
//     subtract(num2: 20, num1:10); // named arguments
//     multiply('sample', num2: 100, num1: 3);

//   }

//   // ** Named Arguments
//   void subtract({num1, num2}){

//   }

//   void multiply(data, {num1, num2}){

//   }

