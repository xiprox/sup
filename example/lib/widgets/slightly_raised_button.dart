import 'package:flutter/material.dart';

class SlightlyRaisedButton extends StatelessWidget {
  final Color color;
  final String label;
  final Brightness brightness;
  final Function onPressed;

  SlightlyRaisedButton({
    this.color,
    this.label,
    this.brightness,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(2),
      ),
      elevation: 0,
      focusElevation: 1,
      hoverElevation: 1,
      highlightElevation: 2,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      color: color,
      colorBrightness: brightness ?? Brightness.dark,
      child: Text(
        label ?? 'Button',
        style: const TextStyle(fontWeight: FontWeight.w600),
      ),
      onPressed: onPressed,
    );
  }
}
