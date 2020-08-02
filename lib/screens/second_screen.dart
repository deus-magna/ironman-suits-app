import 'package:custom_painter/colors.dart';
import 'package:custom_painter/data/suits_data.dart';
import 'package:custom_painter/models/suit_model.dart';
import 'package:custom_painter/widgets/suit_card_widget.dart';
import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
    

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
