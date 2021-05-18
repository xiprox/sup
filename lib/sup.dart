import 'package:flutter/material.dart';

import 'package:sup/sup_config.dart';
import 'package:sup/sup_defaults.dart';
import 'package:sup/sup_configurator.dart';

export 'package:sup/quick_sup.dart';
export 'package:sup/sup_config.dart';
export 'package:sup/sup_configurator.dart';

enum SupAlignment { start, center, end }

/// A widget which displays an image, a title, and a subtitle for
/// errors, empty states, or just fancy custom messages.
///
/// ## How to use
/// ### QuickSup
/// One option is [QuickSup]. Use it to quickly show standard errors
/// and empty states, fast and easy.
///
/// Ideal for when you want to avoid spending time on your UI messages
/// but want a bit more than a [Text] widget.
///
/// ```
/// QuickSup.error(
///   title: 'Nope',
///   subtitle: 'That didn\'t work, son.',
///   onRetry: () {},
/// );
/// ```
/// ```
/// QuickSup.empty(
///   subtitle: 'No items in this list',
/// );
/// ```
///
/// ### SupConfigurator
/// If you want to customize, one place to do that is [SupConfigurator].
///
/// This is an [InheritedWidget] that hosts a default [SupConfig] wherever
/// you place it in your widget tree. [Sup] widgets then access the nearest
/// [SupConfigurator] and render themselves accordingly.
///
/// Check out [SupConfigurator] for more details.
///
/// ### Sup.from (Config/Templates)
/// If you are going to have different [Sup] configurations, such as
/// specific errors, specific empty states, hints, etc., this is for you.
///
/// Define a [SupConfig] instance somewhere in your codebase, then pass
/// it to [Sup] using [Sup.from]. That's all. You can pass specific
/// override params too.
///
/// ### Sup Constructor
/// Finally, you can also just create a new [Sup] instance using the constructor.
/// ```
/// Sup(
///   image: Image(...),
///   title: Text('Hey'),
///   subtitle: Text('Welcome to the app'),
///   ...
/// );
/// ```
///
/// ## Configuration Priority
/// The priority in which Sup applies configurations is the following:
/// 4. Package defaults (see [SupDefaults])
/// 3. User defaults ([SupConfigurator])
/// 2. Sup.from
/// 1. Sup parameters
///
/// ## More information
/// For more information, check out the [repository](https://github.com/maestralsol/sup).
class Sup extends StatelessWidget {
  final Widget? image;
  final Widget? title;
  final Widget? subtitle;
  final Widget? bottom;
  final SupAlignment? alignment;

  /// Spacing between the children (i.e. image, title, etc.).
  final double? spacing;

  /// Padding _around_ the widget.
  final EdgeInsets? padding;

  /// Used to hold a reference to to config passed to [Sup.from]
  /// for access during build.
  SupConfig? _config;

  /// Creates a Sup instance.
  ///
  /// Pass parameters to override defaults.
  Sup({
    this.image,
    this.title,
    this.subtitle,
    this.bottom,
    this.alignment,
    this.spacing,
    this.padding,
  });

  /// Creates a Sup instance using given config.
  ///
  /// Pass parameters to override config.
  factory Sup.from(
    SupConfig config, {
    Widget? image,
    Text? title,
    Text? subtitle,
    Widget? bottom,
  }) {
    return Sup(
      image: image,
      title: title,
      subtitle: subtitle,
      bottom: bottom,
    ).._config = config;
  }

  _columnAlignmentFromSupAlignment(SupAlignment alignment) {
    switch (alignment) {
      case SupAlignment.start:
        return CrossAxisAlignment.start;
      case SupAlignment.center:
        return CrossAxisAlignment.center;
      case SupAlignment.end:
        return CrossAxisAlignment.end;
    }
  }

  _textAlignFromSupAlignment(SupAlignment alignment) {
    switch (alignment) {
      case SupAlignment.start:
        return TextAlign.start;
      case SupAlignment.center:
        return TextAlign.center;
      case SupAlignment.end:
        return TextAlign.end;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final packageDefaults = SupDefaults.config;
    final userDefaults = SupConfigurator.of(context)?.defaults;
    final passedConfig = _config;

    // Priority: package defaults < user defaults < passed config < params.
    var config = packageDefaults;

    // Override package defaults with defaults from user configuration.
    if (userDefaults != null) {
      config = config.merge(userDefaults);
    }

    // Override with passed config if exists.
    if (passedConfig != null) {
      config = config.merge(passedConfig);
    }

    // Override with passed params.
    config = config.copyWith(
      image: this.image,
      title: this.title,
      subtitle: this.subtitle,
      bottom: this.bottom,
      alignment: this.alignment,
      spacing: this.spacing,
      padding: this.padding,
    );

    // This will most likely happen when Sup is being used without
    // any config. Give some hints on what can be done.
    if (config.image == null &&
        config.title == null &&
        config.subtitle == null) {
      return _buildNoConfigState(theme);
    }

    return Padding(
      padding: config.padding!,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: _columnAlignmentFromSupAlignment(config.alignment!),
        children: <Widget>[
          // Image
          if (config.image != null) ...[
            config.image!,
            SizedBox(height: config.spacing),
          ],

          // Title
          if (config.title != null) ...[
            DefaultTextStyle(
              style: (theme.textTheme.headline6 ?? TextStyle()).copyWith(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
              textAlign: _textAlignFromSupAlignment(config.alignment!),
              child: config.title!,
            ),
            SizedBox(height: config.spacing!),
          ],

          // Subtitle
          if (config.subtitle != null) ...[
            DefaultTextStyle(
              style: (theme.textTheme.caption ?? TextStyle()).copyWith(
                fontSize: 16,
              ),
              textAlign: _textAlignFromSupAlignment(config.alignment!),
              child: config.subtitle!,
            ),
          ],

          // Bottom widget (e.g. a retry button)
          if (config.bottom != null) ...[
            SizedBox(height: config.spacing!),
            config.bottom!,
          ],
        ],
      ),
    );
  }

  /// Returns some info about what to do to get started with [Sup].
  _buildNoConfigState(ThemeData theme) {
    return SizedBox(
      height: 264,
      width: 224,
      child: Stack(
        children: <Widget>[
          Placeholder(),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: theme.canvasColor,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'This is a Sup widget with no configuration.\n\nLearn about how you can make it work for you at https://github.com/maestralsol/sup or try the QuickSup widget.',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
