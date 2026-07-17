import 'package:flutter/material.dart';

class FilterButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onPressed;

  const FilterButton({
    required this.label,
    required this.isSelected,
    required this.onPressed,
    super.key,
  });

  static const _baseColor = Color.fromRGBO(223, 229, 214, 1);
  static const _selectedColor = Color.fromRGBO(62, 74, 55, 1);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected
            ? Color.lerp(_baseColor, _selectedColor, 0.75)
            : _baseColor,
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}