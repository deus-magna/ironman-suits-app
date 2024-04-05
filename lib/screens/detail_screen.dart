import 'package:flutter/material.dart';
import 'package:ironman_suits_app/models/suit_model.dart';

class DetailScreen extends StatefulWidget {
  final Suit suit;

  const DetailScreen({
    Key? key,
    required this.suit,
  }) : super(key: key);

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
          SingleChildScrollView(
            child: Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 64.0, horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Align(
                    alignment: Alignment.topRight,
                    child: Hero(
                      tag: '${widget.suit.name}_hero',
                      child: Image.asset(
                        widget.suit.imagePaths[0],
                        fit: BoxFit.cover,
                        height: MediaQuery.of(context).size.height * 0.6,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    widget.suit.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                    ),
                  ),
                  Text(
                    widget.suit.description,
                    style: const TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 40,
            left: 20,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
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
