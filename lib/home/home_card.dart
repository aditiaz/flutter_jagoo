import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class HomeCard extends StatelessWidget {
  const HomeCard({required this.title,required this.desc, @required this.route, super.key});
  final String title;
  final String desc;
  final Widget? route;
  @override
  Widget build(context) {
    return Container(
      padding: EdgeInsets.only(bottom: 25),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color.fromRGBO(127, 127, 127, 1),
            width: .9,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Color.fromRGBO(0, 119, 182, 1),
              fontWeight: FontWeight.w500,
              fontSize: 20,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 300,
                child: Text(
                  desc,
                  style: TextStyle(
                    color: Color.fromRGBO(127, 127, 127, 1),
                    fontSize: 15,
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => route!));
                },
                icon: Icon(Icons.arrow_forward_ios),
              )
            ],
          )
        ],
      ),
    );
  }
}