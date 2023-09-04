import 'package:flutter/material.dart';
import 'package:tictactoe/game_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  final TextEditingController player1Controller = TextEditingController();
  final TextEditingController player2Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 18, 51, 118),
      body: Form(
          key: _formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Enter Players Name",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(15),
                child: TextFormField(
                  controller: player1Controller,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                    ),
                    hintText: "Player 1 Name",
                    hintStyle: TextStyle(color: Colors.white),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please Enter player 1 name";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: TextFormField(
                  controller: player2Controller,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                    ),
                    hintText: "Player 2 Name",
                    hintStyle: TextStyle(color: Colors.white),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please Enter player 2 name";
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  if (_formkey.currentState!.validate()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GameScreen(
                            player1: player1Controller.text,
                            player2: player2Controller.text),
                      ),
                    );
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 17, horizontal: 20),
                  child: const Text(
                    "Start Game",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
