import 'package:flutter/material.dart';
import 'package:jagoo_latihan/home/home_card.dart';
import 'package:jagoo_latihan/simple_calculator/simple_calculator.dart';
import 'package:jagoo_latihan/dummy_ui/card_container.dart';
import 'package:jagoo_latihan/input_validation/input_validation.dart';

class  Home extends StatelessWidget {
  const Home({ super.key});
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
        padding:const EdgeInsets.all(20),
        child:const Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
           HomeCard(
              title: 'Dummy UI',
              desc: 'UI Practice flutter UI and get familiar with UI Widgets',
              route: CardContainer(),
            ),
          SizedBox(
              height: 35,
            ),
            HomeCard(
              title: 'Simple Calculator',
              desc:
                  'Creating calculator app that consists add, divide, substract, multiply function',
              route: Calculator(),
            ),
          SizedBox(
              height: 35,
            ),
              HomeCard(
              title: 'Input Validation',
              desc:
                  'Play around with email input & password input',
              route: InputValidaton(),
            ),
          ],
        ),
      ),
    );
  }
}
