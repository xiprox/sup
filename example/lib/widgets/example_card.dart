import 'package:flutter/material.dart';

class ExampleCard extends StatefulWidget {
  final bool switchEnabled;
  final Brightness defaultBrightness;
  final Color backgroundColor;
  final Widget child;

  ExampleCard({
    this.child,
    this.defaultBrightness = Brightness.light,
    this.backgroundColor,
    this.switchEnabled = false,
  });

  @override
  _ExampleCardState createState() => _ExampleCardState();
}

class _ExampleCardState extends State<ExampleCard> {
  ThemeData theme;

  _loadDefaultThemeIfNull() {
    if (theme == null) {
      theme = widget.defaultBrightness == Brightness.light
          ? ThemeData.light()
          : ThemeData.dark();
    }
  }

  _toggleTheme() {
    setState(() {
      theme = theme.brightness == Brightness.light
          ? ThemeData.dark()
          : ThemeData.light();
    });
  }

  @override
  Widget build(BuildContext context) {
    _loadDefaultThemeIfNull();

    final switchEnabled =
        widget.switchEnabled && widget.backgroundColor == null;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 48),
      child: Column(
        children: <Widget>[
          Expanded(
            child: Theme(
              data: theme,
              child: Card(
                color: Colors.white,
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 200),
                  color: widget.backgroundColor ?? theme.cardColor,
                  child: Center(
                    child: widget.child,
                  ),
                ),
              ),
            ),
          ),
          if (switchEnabled)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Dark Theme'),
                SizedBox(width: 8),
                Switch(
                  value: theme.brightness == Brightness.dark,
                  onChanged: (value) => _toggleTheme(),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
