import 'package:flutter/material.dart';
import 'package:snake_game/Easy_game_page.dart';
import 'package:snake_game/hard_game_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      title: 'Snake Game',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  String selectedOption = '';

  void selectOption(String option) {
    setState(() {
      selectedOption = option;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/icons/Snake.png'), // Your image path here
                fit: BoxFit.fill,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 20), // Spacing from top
              // Your other column children
            ],
          ),
          Positioned(
            bottom: 105,
            left: 50,
            child: IconButton(
              icon: Icon(Icons.favorite),
              color: Colors.white70,
              iconSize: 1,
              onPressed: () => selectOption('Option 1'),

            ),
          ),
          Positioned(
            bottom: 20,
            left: 45,
            child: IconButton(
              icon: Icon(Icons.comment),
              color: Colors.white70,
              iconSize: 1,
              onPressed:  () => selectOption('Option 2'),

            ),
          ),
          Positioned(
            top: 447,
            right: 165,

            child: IconButton(
              icon: Icon(Icons.share),
              color: Colors.white70,
              iconSize: 1,
              onPressed: () {
                if (selectedOption == 'Option 1') {
                  // Navigate to the game page if an option is selected
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EasySnakeGamePage()),
                  );
                } else if (selectedOption == 'Option 2') {
                  // Navigate to the game page if an option is selected
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HardSnakeGamePage()),
                  );
                }


                else {
                  // Show a dialog or message indicating that an option must be selected
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      backgroundColor: Colors.green.shade200,
                      title: Text('Oops! Try Again! '),
                      content: Text('Please select the Mode  before starting the Game.'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text('OK'),
                        ),
                      ],
                    ),
                  );
                }
              },
            ),
          ),

        ],
      ),

    );
  }
}


