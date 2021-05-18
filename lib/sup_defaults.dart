import 'package:flutter/material.dart';
import 'package:supp/sup.dart';

/// Package defaults for [Sup].
class SupDefaults {
  static final config = SupConfig(
    image: null,
    title: null,
    subtitle: null,
    alignment: SupAlignment.center,
    spacing: 16,
    padding: EdgeInsets.all(16),
  );
}
