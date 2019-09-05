import 'package:flutter/material.dart';
import 'package:sup/sup.dart';

enum _QuickSupType { error, empty }

/// A [Sup] widget that provides out-of-the-box implementation
/// for quick and simple use cases.
class QuickSup extends StatelessWidget {
  final _QuickSupType type;
  final String title;
  final String subtitle;
  final Function onRetry;
  final String retryText;

  QuickSup._({
    this.type,
    this.title,
    this.subtitle,
    this.onRetry,
    this.retryText,
  });

  /// Returns a [QuickSup] configured for an error state.
  ///
  /// Omitting any parameter will result in that section
  /// being hidden. Pass [retryText] to override the default
  /// value.
  factory QuickSup.error({
    String title,
    String subtitle,
    Function onRetry,
    String retryText,
  }) {
    return QuickSup._(
      type: _QuickSupType.error,
      title: title,
      subtitle: subtitle,
      onRetry: onRetry,
      retryText: retryText,
    );
  }

  /// Returns a [QuickSup] configured for an empty state.
  ///
  /// Omitting any parameter will result in that section
  /// being hidden.
  factory QuickSup.empty({
    String title,
    String subtitle,
  }) {
    return QuickSup._(
      type: _QuickSupType.empty,
      title: title,
      subtitle: subtitle,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final brightness = theme.brightness;

    final i = Material(
      color: brightness == Brightness.light ? Colors.grey[200] : Colors.white24,
      borderRadius: BorderRadius.circular(56),
      child: Container(
        height: 112,
        width: 112,
        child: Center(
          child: Icon(
            type == _QuickSupType.error ? Icons.error : Icons.inbox,
            size: 32,
          ),
        ),
      ),
    );
    final t = title == null ? null : Text(title);
    final s = subtitle == null ? null : Text(subtitle);
    final r = onRetry == null
        ? null
        : FlatButton(
            child: Text(retryText),
            onPressed: onRetry,
            textColor: theme.accentColor,
          );

    return Sup(image: i, title: t, subtitle: s, bottom: r);
  }
}
