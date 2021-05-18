import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:supp/sup.dart';

import 'package:example/widgets/fancy_button.dart';
import 'package:example/widgets/slightly_raised_button.dart';

class SupConfigs {
  static final error = SupConfig(
    image: SvgPicture.asset(
      'assets/images/space-error-2.svg',
      height: 200,
    ),
    title: Text('Uh-oh!'),
    subtitle: Text('Something unfortunate happened'),
    bottom: FancyButton(
      label: 'RETRY',
      color: Color(0xffFF3A00),
      onPressed: () {},
    ),
  );

  static final connectionError = SupConfig(
    image: SvgPicture.asset(
      'assets/images/no-connection.svg',
      height: 200,
    ),
    title: const Text('No connection'),
    subtitle: const Text('Looks like connection issues. Please try again.'),
    bottom: SlightlyRaisedButton(
      label: 'RETRY',
      color: Color(0xff7AAEFC),
      onPressed: () {},
    ),
  );

  static final empty = SupConfig(
    image: SvgPicture.asset(
      'assets/images/no_items.svg',
      height: 200,
    ),
    title: Text('No items'),
    subtitle: Text('Nothing found. Check back later.'),
  );
}
