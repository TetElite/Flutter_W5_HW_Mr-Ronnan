import 'package:flutter/material.dart';

enum ButtonType { primary, secondary, disabled }
enum IconPosition { left, right }

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomButton(
                icon: Icons.check,
                label: 'Submit',
                iconPosition: IconPosition.left,
                type: ButtonType.primary,
              ),
              SizedBox(height: 10),
              CustomButton(
                icon: Icons.access_time,
                label: 'Time',
                iconPosition: IconPosition.right,
                type: ButtonType.secondary,
              ),
              SizedBox(height: 10),
              CustomButton(
                icon: Icons.grid_goldenratio_rounded,
                label: 'Account',
                iconPosition: IconPosition.right,
                type: ButtonType.disabled,
              ),
            ],
          ),
        ),
      ),
    )
  );
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    required this.label,
    required this.icon,
    this.iconPosition = IconPosition.left,
    this.type = ButtonType.primary,
    super.key,
  });

  final String label;
  final ButtonType type;
  final IconData icon;
  final IconPosition iconPosition;
  
  Color _getBackgroundColor() {
    switch (type) {
      case ButtonType.primary:
        return Colors.blue;
      case ButtonType.secondary:
        return Colors.green;
      case ButtonType.disabled:
        return const Color.fromARGB(255, 72, 72, 72);
    }
  }

  

  @override
Widget build(BuildContext context) {
  final children = [
    Padding(
      padding: EdgeInsets.all(10.0),
      child: Icon(icon, color: Colors.blueGrey),
    ),
    Text(
      label,
      style: TextStyle(color: Colors.white, fontSize: 16),
    ),
  ];

  return Container(
    decoration: BoxDecoration(
      color: _getBackgroundColor(),
      borderRadius: BorderRadius.circular(50.0),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: iconPosition == IconPosition.left ? children : children.reversed.toList(),
    ),
  );
}
}

