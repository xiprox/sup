import 'package:flutter/material.dart';

class FancyButton extends StatelessWidget {
  final Color color;
  final String label;
  final Brightness brightness;
  final Function onPressed;

  FancyButton({
    this.color,
    this.label,
    this.brightness,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32),
      ),
      elevation: 12,
      focusElevation: 14,
      hoverElevation: 14,
      highlightElevation: 16,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      color: color,
      colorBrightness: brightness ?? Brightness.dark,
      child: Text(
        label,
        style: const TextStyle(fontWeight: FontWeight.w600),
      ),
      onPressed: onPressed,
    );
  }
}
