import 'package:flutter/material.dart';

class ModeButton extends StatelessWidget {
  const ModeButton(
      {super.key,
      required this.icon,
      required this.textMode,
      required this.onTap,
      required this.isSelected});
  final IconData icon;
  final String textMode;
  final VoidCallback onTap;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: onTap,
          icon: Container(
            height: 75,
            width: 75,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: isSelected
                  ? Colors.white
                  : const Color(0xFF30393C).withOpacity(0.5),
            ),
            child: Icon(
              icon,
              size: 48,
              color: isSelected ? Colors.black : Colors.white54,
            ),
          ),
        ),
        Text(
          textMode,
          style: const TextStyle(color: Colors.white, fontSize: 18),
        )
      ],
    );
  }
}
