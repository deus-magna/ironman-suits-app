import 'package:custom_painter/colors.dart';
import 'package:custom_painter/models/suit_model.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {

  final Suit suit;

  const DetailScreen({Key key, @required this.suit}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Hero(
            tag: widget.suit.name,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: widget.suit.colors,
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 64.0, horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Align(
                  alignment: Alignment.topRight,
                  child: Hero(
                    tag: '${widget.suit.name}_hero',
                    child: Image.asset(
                      widget.suit.imagePath,
                      scale: 1.3,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  widget.suit.name,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                  ),
                ),
                Text(
                  widget.suit.description,
                  style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14),
                ),
              ],
            ),
          ),
          Positioned(
            top: 40,
            left: 20,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.close,
                color: Colors.white,
                size: 32,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
