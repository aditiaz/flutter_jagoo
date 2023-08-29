import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardDummy extends StatelessWidget {
  const CardDummy({required this.src, super.key});
  final String src;

  @override
  Widget build(context) {
    return Container(
      padding: const EdgeInsets.only(top: 15),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: const Color(0xFFD9D9D9),
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      height: 120,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SvgPicture.asset(src),
        const  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            SizedBox(
                width: 145,
                child:  Text(
                  'How can I be Flutter Developer Expert?',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 15,
                  ),
                ),
              ),
               SizedBox(
                height: 18,
              ),
              SizedBox(
                width: 250,
                child:  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Jill LepEore',
                          style: TextStyle(
                            color: Color.fromRGBO(127, 127, 127, 1),
                          ),
                        ),
                        SizedBox(width: 8),
                        Icon(
                          Icons.circle_sharp,
                          color: Color.fromRGBO(127, 127, 127, 1),
                          size: 5.0,
                        ),
                        SizedBox(width: 8),
                        Text(
                          '23 May 23',
                          style: TextStyle(
                            color: Color.fromRGBO(127, 127, 127, 1),
                          ),
                        ),
                      ],
                    ),
                    Icon(
                      Icons.star,
                      color: Color.fromRGBO(0, 119, 182, 1),
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
