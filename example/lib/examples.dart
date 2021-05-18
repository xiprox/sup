import 'package:example/widgets/fancy_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:supp/sup.dart';

import 'package:example/sup_configs.dart';

class WelcomeSup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      fontFamily: 'Chinese Rocks',
    );
    return Sup(
      image: SvgPicture.asset(
        'assets/images/welcome.svg',
        height: 220,
        fit: BoxFit.cover,
      ),
      title: Text(
        'Howdy partner!',
        style: textStyle.copyWith(
          fontSize: 26,
          fontWeight: FontWeight.w400,
        ),
      ),
      subtitle: Text(
        'Swipe left to see more examples',
        style: textStyle,
      ),
    );
  }
}

class ConnectionErrorSup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Sup.from(SupConfigs.connectionError),
    );
  }
}

class NoItemsSup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sup.from(SupConfigs.empty);
  }
}

class NoMessagesSup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sup(
      image: SvgPicture.asset('assets/images/no-messages.svg', height: 280),
      title: Text('No messages'),
      subtitle: Text('Only ghosts are coming out of the envelope'),
      padding: const EdgeInsets.all(24),
    );
  }
}

class FullPageFoodSup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          'assets/images/food.jpg',
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Container(
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.transparent,
                  Color(0xff202D4D),
                ],
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Sup(
            image: null,
            title: Text(
              'Free food!',
              style: TextStyle(fontSize: 26),
            ),
            subtitle: Text('Order lunch and your dinner is on us'),
            bottom: FancyButton(
              label: 'ORDER',
              color: Color(0xffF89900),
              onPressed: () {},
            ),
            alignment: SupAlignment.start,
            spacing: 16,
            padding: EdgeInsets.all(24),
          ),
        ),
      ],
    );
  }
}

class FullPageCampingSup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          'assets/images/night.png',
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Sup(
            image: null,
            title: Text('Start camping!'),
            subtitle: Text.rich(
              TextSpan(
                text: 'If you sign up now you will get ',
                children: [
                  TextSpan(
                    text: '50% off',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  TextSpan(text: ' on your next trip')
                ],
              ),
            ),
            bottom: FlatButton(
              child: Text('SIGN UP'),
              textColor: Color(0xffF89900),
              onPressed: () {},
            ),
            alignment: SupAlignment.center,
            spacing: 16,
            padding: EdgeInsets.only(left: 24, right: 24, top: 64),
          ),
        ),
      ],
    );
  }
}
