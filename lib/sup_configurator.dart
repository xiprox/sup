import 'package:flutter/widgets.dart';
import 'package:sup/sup.dart';

/// An [InheritedWidget] that can be used to provide a default
/// [SupConfig] anywhere in the widget tree.
///
/// [Sup] will pick the nearest [SupConfigurator] up in the tree.
///
/// For example, you can use it to set defaults at the app level:
/// ```
/// MaterialApp(
///   title: 'Sup Gallery',
///   home: SupConfigurator(
///     defaults: SupConfig(
///       alignment: SupAlignment.start,
///     ),
///     child: myAppContent
///   ),
/// );
/// ```
class SupConfigurator extends InheritedWidget {
  final SupConfig defaults;

  const SupConfigurator({
    this.defaults,
    @required Widget child,
  }) : super(child: child);

  static SupConfigurator of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(SupConfigurator)
        as SupConfigurator;
  }

  @override
  bool updateShouldNotify(SupConfigurator oldWidget) {
    return this.defaults != oldWidget.defaults;
  }
}
