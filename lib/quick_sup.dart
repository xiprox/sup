import 'package:flutter/material.dart';
import 'package:supp/sup.dart';

enum _QuickSupType { error, empty }

/// A [Sup] widget that provides out-of-the-box implementation
/// for quick and simple use cases.
class QuickSup extends StatelessWidget {
  final _QuickSupType type;
  final Widget? image;
  final String? title;
  final String? subtitle;
  final Function()? onRetry;
  final String? retryText;
  final bool? wrapImageInCircle;

  QuickSup._({
    required this.type,
    this.image,
    this.title,
    this.subtitle,
    this.onRetry,
    this.retryText,
    this.wrapImageInCircle = true,
  });

  /// Returns a [QuickSup] configured for an error state.
  ///
  /// Omitting any parameter will result in that section
  /// being hidden. Pass [retryText] to override the default
  /// value.
  factory QuickSup.error(
      {Widget? image,
      String? title,
      String? subtitle,
      Function()? onRetry,
      String? retryText,
      bool? wrapImageInCircle}) {
    return QuickSup._(
      type: _QuickSupType.error,
      image: image,
      title: title,
      subtitle: subtitle,
      onRetry: onRetry,
      retryText: retryText,
      wrapImageInCircle: wrapImageInCircle,
    );
  }

  /// Returns a [QuickSup] configured for an empty state.
  ///
  /// Omitting any parameter will result in that section
  /// being hidden.
  factory QuickSup.empty({
    Widget? image,
    String? title,
    String? subtitle,
    bool? wrapImageInCircle,
  }) {
    return QuickSup._(
      type: _QuickSupType.empty,
      image: image,
      title: title,
      subtitle: subtitle,
      wrapImageInCircle: wrapImageInCircle,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final brightness = theme.brightness;

    var img = image ??
        Center(
          child: Icon(
            type == _QuickSupType.error ? Icons.error : Icons.inbox,
            size: 32,
          ),
        );

    if (wrapImageInCircle ?? true) {
      img = Material(
        color:
            brightness == Brightness.light ? Colors.grey[200] : Colors.white24,
        borderRadius: BorderRadius.circular(56),
        child: Container(
          height: 112,
          width: 112,
          child: img,
        ),
      );
    }

    final t = title == null ? null : Text(title!);
    final s = subtitle == null ? null : Text(subtitle!);
    final r = onRetry == null
        ? null
        : FlatButton(
            child: Text(retryText ?? 'Retry'),
            onPressed: onRetry,
            textColor: theme.accentColor,
          );

    return Sup(image: img, title: t, subtitle: s, bottom: r);
  }
}
