import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class CardRow extends StatelessWidget {
  const CardRow({required this.title,super.key});
  final  String title;

  @override
  Widget build(context) {
    return Container(
        padding: const EdgeInsets.all(5),
        height: 100,
        width: 100,
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: const Color(0xFFD9D9D9),
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        child: Column(
          children: [
            SvgPicture.asset('lib/assets/briefcase.svg'),
            Text(title)
          ],
        ));
  }
}
