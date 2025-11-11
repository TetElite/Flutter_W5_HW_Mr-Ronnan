import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 106, 104, 104),
        body: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HobbyCard(color: Color.fromARGB(255, 37, 197, 58), icon: Icons.star, label: "Traveling"),
              SizedBox(height: 10),
              HobbyCard(color: Color.fromARGB(255, 21, 69, 140), icon: Icons.skateboarding, label: "Skating"),
              SizedBox(height: 10),
              HobbyCard(color: Color.fromARGB(255, 140, 40, 40), icon: Icons.music_note, label: "Music"),
          ],
        ),
      ),
    ),
  ));
}

class HobbyCard extends StatelessWidget {
  const HobbyCard({
    required this.color,
    required this.icon,
    required this.label,
    super.key,
  });

  final Color color;
  final IconData icon;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(  20.0),
      ),
      child: Center(
        child: Row(
          children: [
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Icon(icon, size: 50, color: Colors.white),
          ),
          SizedBox(width: 20),
          Text(label, style: TextStyle(fontSize: 30, color: Colors.white),),
        ],
      ),
    ),
                );
  }
}