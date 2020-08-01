import 'package:custom_painter/colors.dart';
import 'package:custom_painter/models/suit_model.dart';
import 'package:custom_painter/screens/detail_screen.dart';
import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  final mark1Suit = Suit(
      imagePath: 'assets/mark1.png',
      name: 'Mark 1',
      description:
          'The Mark I (Mark 1), is the first Iron Man suit built and created by Tony Stark. It was built in the initial events of the live-action film, Iron Man. The suit was later used as a model for Obadiah Stane\'s Iron Monger...',
      colors: mark1);

  final mark2Suit = Suit(
      imagePath: 'assets/mark2.png',
      name: 'Mark 2',
      description:
          'The Mark I (Mark 1), is the first Iron Man suit built and created by Tony Stark. It was built in the initial events of the live-action film, Iron Man. The suit was later used as a model for Obadiah Stane\'s Iron Monger...',
      colors: mark2);

  final mark3Suit = Suit(
      imagePath: 'assets/mark3@2x.png',
      name: 'Mark 3',
      description:
          'The Mark I (Mark 1), is the first Iron Man suit built and created by Tony Stark. It was built in the initial events of the live-action film, Iron Man. The suit was later used as a model for Obadiah Stane\'s Iron Monger...',
      colors: mark3);

   final mark50Suit = Suit(
      imagePath: 'assets/mark50.png',
      name: 'Mark 50',
      description:
          'The Mark I (Mark 1), is the first Iron Man suit built and created by Tony Stark. It was built in the initial events of the live-action film, Iron Man. The suit was later used as a model for Obadiah Stane\'s Iron Monger...',
      colors: mark50);

  @override
  Widget build(BuildContext context) {
    final List<Suit> suits = [mark1Suit, mark2Suit, mark3Suit, mark50Suit];

    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.only(bottom: 30, left: 30, right: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'IronMan',
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            Text('Suits', style: TextStyle(fontSize: 30)),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: suits.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.only(right: 30),
                    child: HeroCard(suit: suits[index]),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class HeroCard extends StatelessWidget {
  final Suit suit;

  const HeroCard({
    Key key,
    @required this.suit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            PageRouteBuilder(
                pageBuilder: (context, a, b) => DetailScreen(
                      suit: suit,
                    )));
      },
      child: Stack(
        // fit: StackFit.expand,
        children: <Widget>[
          Align(
            alignment: Alignment.bottomCenter,
            child: ClipPath(
              clipper: BackgroundClipper(),
              child: Hero(
                tag: suit.name,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.width * 0.8 * 1.33,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: suit.colors,
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight)),
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              top: 20,
            ),
            //color: Colors.green,
            child: Column(
              children: <Widget>[
                Hero(
                  tag: '${suit.name}_hero',
                  child: Image.asset(
                    suit.imagePath,
                    scale: 1.5,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(suit.name,
                          style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                      Text('Click to read more',
                          style: TextStyle(fontSize: 14, color: Colors.white))
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BackgroundClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final roundFactor = 50.0;

    final path = Path()
      ..moveTo(0, size.height * 0.33)
      ..lineTo(0, size.height - roundFactor)
      ..quadraticBezierTo(0, size.height, roundFactor, size.height)
      ..lineTo(size.width - roundFactor, size.height)
      ..quadraticBezierTo(
          size.width, size.height, size.width, size.height - roundFactor)
      ..lineTo(size.width, roundFactor * 2)
      ..quadraticBezierTo(size.width - 5, roundFactor,
          size.width - roundFactor * 2, roundFactor * 1.5)
      ..lineTo(roundFactor * 0.9, size.height * 0.33 - roundFactor * 0.3)
      ..quadraticBezierTo(
          0, size.height * 0.33, 0, size.height * 0.33 + roundFactor);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

class CurvesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Color(0xFF21232A)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.round;

    final path = Path()
      ..lineTo(size.width * 0.5, 0)
      ..lineTo(size.width * 0.5, size.height * 0.5)
      ..lineTo(0, size.height * 0.5)
      ..lineTo(0, size.height)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, size.height * 0.5)
      ..moveTo(size.width, 0)
      ..lineTo(size.width * 0.5, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CurvesPainter oldDelegate) => true;
}
