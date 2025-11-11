import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 110, 109, 109),
        body: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 40),
              HobbyCard(),
              SizedBox(height: 30),
              
            ],
          ),
        ),
      ),
    ),
  );
}

class HobbyCard extends StatelessWidget {
  const HobbyCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 8, 69, 97),
        borderRadius: BorderRadius.circular(20.0), // Curved corners
      ),
      child: Center(
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Icon(Icons.search, size: 40, color: Colors.white,),
            ),
            SizedBox(width: 20),
            Text(
              'Hello',
              style: TextStyle(fontSize: 40, color: Colors.white, fontWeight: FontWeight.w500,),
            ),
          ],
        ),
      ),
    );
  }
}