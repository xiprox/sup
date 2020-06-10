<h3><p align="center">'sup</p></h3>

<p align="center"><i>A Flutter widget which displays an image, a title, and a subtitle for errors, empty states, or just fancy custom messages.</i></p>

![](graphics/screenshots/readme.png)

## Getting Started

Follow the [installation instructions](https://pub.dev/packages/sup#-installing-tab-).

### QuickSup

Use QuickSup to quickly show standard errors
and empty states, fast and easy.

Ideal for when you want to avoid spending time on your UI messages
but want a bit more than a Text widget.

```dart
QuickSup.error(
  title: 'Nope',
  subtitle: 'That didn\'t work, son.',
  onRetry: () {},
);
```

```dart
QuickSup.empty(
  subtitle: 'No items in this list',
);
```

### SupConfigurator

If you want to customize, one place to do that is SupConfigurator.

This is an [InheritedWidget](https://www.youtube.com/watch?v=1t-8rBCGBYw) that hosts a default SupConfig wherever
you place it in your widget tree. Sup widgets then access the nearest
SupConfigurator and render themselves accordingly.

```dart
MaterialApp(
  title: 'My App',
  home: SupConfigurator(
    defaults: SupConfig(
      alignment: SupAlignment.start,
    ),
    child: myAppContent
  ),
);
```

### Sup.from (Config/Templates)

If you are going to have different Sup configurations, such as
specific errors, specific empty states, hints, etc., this is for you.

Define a SupConfig instance somewhere in your codebase, then pass
it to Sup using `Sup.from`. That's all. You can pass specific
override params too.

```dart
Sup.from(MySupConfigs.sendError);
Sup.from(
  MySupConfigs.noSearchResults,
  subtitle: 'No results found for $query',
);
Sup.from(MySupConfigs.notEnoughEncouragement);
```

### Sup Constructor

Finally, you can also just create a new Sup instance using the constructor.

```dart
Sup(
  image: Image(...),
  title: Text('Hey'),
  subtitle: Text('Welcome to the app'),
  ...
);
```

## Configuration Priority

The priority in which Sup applies configurations is the following:

4. Package defaults (see [SupDefaults](lib/sup_defaults.dart))
5. User defaults ([SupConfigurator](lib/sup_configurator.dart))
6. Sup.from
7. Sup parameters

## License

```
Copyright (C) 2020 Maestral Solutions, Inc.

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.
```

GPL v3 ([LICENSE](/LICENSE))
