import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jagoo_latihan/home/home_card.dart';
import 'package:jagoo_latihan/simple_calculator/simple_calculator.dart';
import 'package:jagoo_latihan/card/card_container.dart';

class Home extends StatelessWidget {
  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Choose Section",
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 23.0),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            HomeCard(
              title: 'Dummy UI',
              desc: 'UI Practice flutter UI and get familiar with UI Widgets',
              route: CardContainer(),
            ),
            HomeCard(
              title: 'Simple Calculator',
              desc: 'Creating calculator app that consists add, divide, substract, multiply function',
              route: Calculator(),
            ),
          ],
        ),
      ),
    );
  }
}
