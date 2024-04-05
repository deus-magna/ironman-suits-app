import 'package:flutter/material.dart';
import 'package:ironman_suits_app/models/suit_model.dart';
import 'package:ironman_suits_app/screens/detail_screen.dart';

class SuitCard extends StatelessWidget {
  final Suit suit;

  const SuitCard({
    Key? key,
    required this.suit,
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
        alignment: Alignment.bottomCenter,
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
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.05,
            child: Column(
              children: <Widget>[
                Hero(
                  tag: '${suit.name}_hero',
                  child: Image.asset(
                    suit.imagePaths[0],
                    fit: BoxFit.cover,
                    height: MediaQuery.of(context).size.height * 0.5,
                  ),
                ),
                Container(
                  //color: Colors.green.withAlpha(100),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(suit.name,
                          style: const TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                      const Text('Click to read more',
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
    const roundFactor = 50.0;

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
