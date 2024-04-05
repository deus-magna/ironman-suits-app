import 'package:flutter/material.dart';
import 'package:ironman_suits_app/data/suits_data.dart';
import 'package:ironman_suits_app/widgets/suit_card_widget.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.only(bottom: 30, left: 30, right: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Text(
              'IronMan',
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            const Text('Suits', style: TextStyle(fontSize: 30)),
            Expanded(
              child: PageView(
                children: _buildSuits(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildSuits() {
    final suits = SuitsData().getData();
    return suits.map((suit) => SuitCard(suit: suit)).toList();
  }
}
