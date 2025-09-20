import 'package:flutter/material.dart';
import '../models/quiz_model.dart'; 

String a(String file) => 'assets/img/$file';

final List<QuizCategory> quizCategories = [
  QuizCategory(
    id: 'gen',
    title: 'General Knowledge',
    description: 'Basic trivia anyone can try!',
    icon: Icons.psychology_alt_outlined,
    questions: [
      Question(
        text: 'What color is the sky on a clear day?',
        options: ['Blue', 'Green', 'Red', 'Yellow'],
        correctIndex: 0,
        assetPath: a('blue_sky.jpg'),
      ),
      Question(
        text: 'How many days are there in a week?',
        options: ['5', '6', '7', '8'],
        correctIndex: 2,
        assetPath: a('seven_days.png'),
      ),
      Question(
        text: 'Which shape has 4 equal sides?',
        options: ['Triangle', 'Rectangle', 'Square', 'Pentagon'],
        correctIndex: 2,
        assetPath: a('square.png'),
      ),
      Question(
        text: 'What do plants need to make food?',
        options: ['Sunlight', 'Plastic', 'Sand', 'Steel'],
        correctIndex: 0,
        assetPath: a('leaf.png'),
      ),
      Question(
        text: 'Which one is a fruit?',
        options: ['Carrot', 'Potato', 'Apple', 'Spinach'],
        correctIndex: 2,
        assetPath: a('apple.png'),
      ),
      Question(
        text: 'How many legs does a cat have?',
        options: ['Two', 'Four', 'Six', 'Eight'],
        correctIndex: 1,
        assetPath: a('cat.png'),
      ),
      Question(
        text: 'What is H2O commonly called?',
        options: ['Salt', 'Sugar', 'Water', 'Air'],
        correctIndex: 2,
        assetPath: a('water_drop.png'),
      ),
      Question(
        text: 'Which device is used to call someone?',
        options: ['Toaster', 'Telephone', 'Microwave', 'Spoon'],
        correctIndex: 1,
        assetPath: a('telephone.png'),
      ),
      Question(
        text: 'Which of these is a season?',
        options: ['Winter', 'Monday', 'Noon', 'Sunrise'],
        correctIndex: 0,
        assetPath: a('winter.jpg'),
      ),
      Question(
        text: 'What do bees make?',
        options: ['Milk', 'Honey', 'Cheese', 'Bread'],
        correctIndex: 1,
        assetPath: a('honey_bees.jpg'),
      ),
    ],
  ),
  QuizCategory(
    id: 'sci',
    title: 'Everyday Science',
    description: 'Simple science in daily life.',
    icon: Icons.science_outlined,
    questions: [
      Question(
        text: 'What gas do we breathe in to stay alive?',
        options: ['Carbon dioxide', 'Oxygen', 'Nitrogen', 'Helium'],
        correctIndex: 1,
        assetPath: a('oxygen_tree.jpg'),
      ),
      Question(
        text: 'Which part of the body pumps blood?',
        options: ['Liver', 'Lungs', 'Heart', 'Stomach'],
        correctIndex: 2,
        assetPath: a('heart.png'),
      ),
      Question(
        text: 'Water changes to ice at what temperature (°C)?',
        options: ['0°C', '25°C', '50°C', '100°C'],
        correctIndex: 0,
        assetPath: a('ice_cubes.png'),
      ),
      Question(
        text: 'What natural source provides most light during the day?',
        options: ['Moon', 'Stars', 'Sun', 'Lamp'],
        correctIndex: 2,
        assetPath: a('sun.png'),
      ),
      Question(
        text: 'Which one is a renewable energy source?',
        options: ['Coal', 'Oil', 'Wind', 'Gasoline'],
        correctIndex: 2,
        assetPath: a('wind_turbine.jpg'),
      ),
      Question(
        text: 'Which sense organ helps you see?',
        options: ['Eyes', 'Ears', 'Tongue', 'Nose'],
        correctIndex: 0,
        assetPath: a('eye.png'),
      ),
      Question(
        text: 'What is the solid form of water called?',
        options: ['Steam', 'Ice', 'Mist', 'Rain'],
        correctIndex: 1,
        assetPath: a('solid_ice.jpg'),
      ),
      Question(
        text: 'Which planet do we live on?',
        options: ['Mars', 'Venus', 'Earth', 'Jupiter'],
        correctIndex: 2,
        assetPath: a('earth.png'),
      ),
      Question(
        text: 'Which of these is a simple machine?',
        options: ['Lever', 'Computer', 'Car', 'Drone'],
        correctIndex: 0,
        assetPath: a('lever.png'),
      ),
      Question(
        text: 'Which state of matter has a definite shape?',
        options: ['Solid', 'Liquid', 'Gas', 'Plasma'],
        correctIndex: 0,
        assetPath: a('solid_ice.jpg'),
      ),
    ],
  ),
  QuizCategory(
    id: 'geo',
    title: 'World & Places',
    description: 'Basic geography & places.',
    icon: Icons.public_outlined,
    questions: [
      Question(
        text: 'What is the largest ocean on Earth?',
        options: ['Atlantic', 'Indian', 'Pacific', 'Arctic'],
        correctIndex: 2,
        assetPath: a('pacific_ocean.png'),
      ),
      Question(
        text: 'Which of these is a continent?',
        options: ['Africa', 'Hawaii', 'Greenland', 'Alaska'],
        correctIndex: 0,
        assetPath: a('africa.png'),
      ),
      Question(
        text: 'What is the capital of Japan?',
        options: ['Tokyo', 'Kyoto', 'Osaka', 'Nagoya'],
        correctIndex: 0,
        assetPath: a('tokyo.jpg'),
      ),
      Question(
        text: 'Mount Everest is in which mountain range?',
        options: ['Andes', 'Himalayas', 'Alps', 'Rockies'],
        correctIndex: 1,
        assetPath: a('everest.jpg'),
      ),
      Question(
        text: 'The Sahara is a famous what?',
        options: ['Forest', 'Desert', 'River', 'Lake'],
        correctIndex: 1,
        assetPath: a('sahara.jpg'),
      ),
      Question(
        text: 'Which country is known as the “Land of the Rising Sun”?',
        options: ['China', 'Japan', 'South Korea', 'Thailand'],
        correctIndex: 1,
        assetPath: a('japan_flag.jpg'),
      ),
      Question(
        text: 'Which line divides Earth into Northern and Southern Hemispheres?',
        options: ['Prime Meridian', 'Equator', 'Tropic of Cancer', 'Arctic Circle'],
        correctIndex: 1,
        assetPath: a('equator.jpeg'),
      ),
      Question(
        text: 'What is the longest river in the world (by length)?',
        options: ['Amazon', 'Nile', 'Yangtze', 'Mississippi'],
        correctIndex: 1,
        assetPath: a('nile.png'),
      ),
      Question(
        text: 'Which country has the city of Sydney?',
        options: ['Austria', 'Australia', 'New Zealand', 'UK'],
        correctIndex: 1,
        assetPath: a('sydney.jpg'),
      ),
      Question(
        text: 'Which direction does the Sun rise from?',
        options: ['North', 'South', 'East', 'West'],
        correctIndex: 2,
        assetPath: a('sunrise.jpg'),
      ),
    ],
  ),
];
