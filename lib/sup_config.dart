import 'package:flutter/widgets.dart';

import 'sup.dart';

class SupConfig {
  final Widget image;
  final Widget title;
  final Widget subtitle;
  final Widget bottom;
  final SupAlignment alignment;

  /// Spacing between the children (i.e. image, title, etc.)
  final double spacing;

  /// Padding _around_ the widget
  final EdgeInsets padding;

  const SupConfig({
    this.image,
    this.title,
    this.subtitle,
    this.bottom,
    this.alignment,
    this.spacing,
    this.padding,
  });

  /// Merges this config with given [other] config, prefering [other]'s
  /// values whenever there's a conflict.
  SupConfig merge(SupConfig other) {
    if (other == null) return this;
    return copyWith(
      image: other.image,
      title: other.title,
      subtitle: other.subtitle,
      bottom: other.bottom,
      alignment: other.alignment,
      spacing: other.spacing,
      padding: other.padding,
    );
  }

  /// Creates a new config instance with the values of this one
  /// and the values passed. In case of conflict, prefers the
  /// passed value.
  SupConfig copyWith({
    Widget image,
    Widget title,
    Widget subtitle,
    Widget bottom,
    SupAlignment alignment,
    double spacing,
    EdgeInsets padding,
  }) {
    return SupConfig(
      image: image ?? this.image,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      bottom: bottom ?? this.bottom,
      alignment: alignment ?? this.alignment,
      spacing: spacing ?? this.spacing,
      padding: padding ?? this.padding,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SupConfig &&
          runtimeType == other.runtimeType &&
          image == other.image &&
          title == other.title &&
          subtitle == other.subtitle &&
          bottom == other.bottom &&
          alignment == other.alignment &&
          spacing == other.spacing &&
          padding == other.padding;

  @override
  int get hashCode =>
      image.hashCode ^
      title.hashCode ^
      subtitle.hashCode ^
      bottom.hashCode ^
      alignment.hashCode ^
      spacing.hashCode ^
      padding.hashCode;
}
