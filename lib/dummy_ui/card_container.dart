import 'package:flutter/material.dart';
import 'package:jagoo_latihan/dummy_ui/cards/card.dart';
import 'package:jagoo_latihan/dummy_ui/cards/card_row.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jagoo_latihan/dummy_ui/layout_card/layout_card.dart';

class CardContainer extends StatelessWidget {
  const CardContainer({super.key});
  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.white,
        elevation: 3.0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back_ios),
            ),
            const Text(
              'Dummy UI',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 23.0),
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          Container(
            decoration:
                const BoxDecoration(color: Color.fromRGBO(233, 233, 233, 1)),
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Next",
                          style: TextStyle(
                            color: Color.fromRGBO(0, 119, 182, 1),
                            fontWeight: FontWeight.w500,
                            fontSize: 17,
                          ),
                        ),
                        Text(
                          "Tab Bar, GridView,ListView",
                          style: TextStyle(
                            color: Color.fromRGBO(127, 127, 127, 1),
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LayoutCard()));
                        },
                        icon: const Icon(Icons.arrow_forward_ios))
                  ],
                ),
                const SizedBox(height: 15),
                Text(
                  "Container and Text".toUpperCase(),
                  style: const TextStyle(
                    color: Color.fromRGBO(44, 212, 131, 1),
                    fontWeight: FontWeight.w500,
                    fontSize: 17,
                  ),
                ),
                const SizedBox(height: 3),
                const CardDummy(src: 'lib/assets/briefcase.svg'),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "Column".toUpperCase(),
                  style: const TextStyle(
                    color: Color.fromRGBO(44, 212, 131, 1),
                    fontWeight: FontWeight.w500,
                    fontSize: 17,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  // crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CardDummy(src: 'lib/assets/briefcase.svg'),
                    SizedBox(height: 10),
                    CardDummy(src: 'lib/assets/briefcase.svg'),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "Row".toUpperCase(),
                  style: const TextStyle(
                    color: Color.fromRGBO(44, 212, 131, 1),
                    fontWeight: FontWeight.w500,
                    fontSize: 17,
                  ),
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CardRow(title: '1st image'),
                    CardRow(title: '2nd image'),
                    CardRow(
                      title: '3rd image',
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "Button".toUpperCase(),
                  style: const TextStyle(
                    color: Color.fromRGBO(44, 212, 131, 1),
                    fontWeight: FontWeight.w500,
                    fontSize: 17,
                  ),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(150, 211, 242, 0.1),
                      fixedSize: const Size.fromWidth(500),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5))),
                  onPressed: () {},
                  child: const Text(
                    'Press Me',
                    style: TextStyle(
                        color: Color.fromRGBO(0, 119, 182, 1),
                        fontSize: 16,
                        fontWeight: FontWeight.w900),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "Input".toUpperCase(),
                  style: const TextStyle(
                    color: Color.fromRGBO(44, 212, 131, 1),
                    fontWeight: FontWeight.w500,
                    fontSize: 17,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text.rich(TextSpan(children: [
                  TextSpan(
                      text: 'Email',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w400)),
                  TextSpan(text: ' *', style: TextStyle(color: Colors.red)),
                ])),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          prefixIcon: Icon(
                            Icons.email_outlined,
                            color: Color.fromRGBO(0, 119, 182, 1),
                          ),
                          hintText: 'Enter  your email...',
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "Image asset, Sized Box & Expanded ".toUpperCase(),
                  style: const TextStyle(
                    color: Color.fromRGBO(44, 212, 131, 1),
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 100,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: const Color(0xFFD9D9D9),
                          ),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                        child: Column(children: [
                          SvgPicture.asset('lib/assets/briefcase.svg'),
                          const Text('1st Image')
                        ]),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    const CardRow(
                      title: '2nd Image',
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
