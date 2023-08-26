import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  @override
  State<Calculator> createState() => CalculatorState();
}

class CalculatorState extends State<Calculator> {
  int isPressed = 0;
   final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back_ios),
            ),
            const Text(
              'Simple Calculator',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 23.0),
            ),
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Choose Type".toUpperCase(),
                  style: const TextStyle(
                    color: Color.fromRGBO(44, 212, 131, 1),
                    fontWeight: FontWeight.w700,
                    fontSize: 17,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextButton(
                      style: TextButton.styleFrom(
                        fixedSize: Size.fromWidth(100),
                        backgroundColor: isPressed == 1
                            ? Color.fromRGBO(150, 211, 242, 0.1)
                            : Colors.transparent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                            side: BorderSide(
                                width: 1, color: const Color(0xFFD9D9D9))),
                      ),
                      onPressed: () {
                        setState(() {
                          isPressed = 1;
                        });
                      },
                      child: Text(
                        'Add',
                        style: TextStyle(
                            color: isPressed == 1
                                ? Color.fromRGBO(0, 119, 182, 1)
                                : Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        fixedSize: Size.fromWidth(100),
                        backgroundColor: isPressed == 2
                            ? Color.fromRGBO(150, 211, 242, 0.1)
                            : Colors.transparent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                            side: BorderSide(
                                width: 1, color: const Color(0xFFD9D9D9))),
                      ),
                      onPressed: () {
                        setState(() {
                          isPressed = 2;
                        });
                      },
                      child: Text(
                        'Subtract',
                        style: TextStyle(
                            color: isPressed == 2
                                ? Color.fromRGBO(0, 119, 182, 1)
                                : Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        fixedSize: Size.fromWidth(100),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                            side: BorderSide(
                                width: 1, color: const Color(0xFFD9D9D9))),
                      ),
                      onPressed: () {
                        setState(() {
                          isPressed = 3;
                        });
                      },
                      child: Text(
                        'Multiply',
                        style: TextStyle(
                            backgroundColor: isPressed == 3
                                ? Color.fromRGBO(150, 211, 242, 0.1)
                                : Colors.transparent,
                            color: isPressed == 3
                                ? Color.fromRGBO(0, 119, 182, 1)
                                : Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: isPressed == 4
                        ? Color.fromRGBO(150, 211, 242, 0.1)
                        : Colors.transparent,
                    fixedSize: Size.fromWidth(100),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                        side: BorderSide(
                            width: 1, color: const Color(0xFFD9D9D9))),
                  ),
                  onPressed: () {
                    setState(() {
                      isPressed = 4;
                    });
                  },
                  child: Text(
                    'Divide',
                    style: TextStyle(
                        color: isPressed == 4
                            ? Color.fromRGBO(0, 119, 182, 1)
                            : Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 80,
                      height: 80,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        maxLength: 20,
                        decoration: InputDecoration(
                          counterStyle: TextStyle(
                            height: double.minPositive,
                          ),
                          counterText: "",
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 3,
                                color: Color.fromRGBO(0, 119, 182, 1),
                                style: BorderStyle.solid),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 2,
                                color: Color.fromRGBO(0, 119, 182, 1),
                                style: BorderStyle.solid),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      height: 70,
                      width: 35,
                      child: Text(
                        isPressed == 1
                            ? '+'
                            : isPressed == 2
                                ? '-'
                                : isPressed == 3
                                    ? 'x'
                                    : isPressed == 4
                                        ? '/'
                                        : '...',
                        style: TextStyle(fontSize: 40),
                      ),
                    ),
                    SizedBox(
                      width: 7,
                    ),
                    SizedBox(
                      width: 80,
                      height: 80,
                      child: Form(
                          key: _formKey,
                        child: TextFormField(
                        keyboardType: TextInputType.number,
                        maxLength: 20,
                        decoration: InputDecoration(
                          counterStyle: TextStyle(
                            height: double.minPositive,
                          ),
                          counterText: "",
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 3,
                                color: Color.fromRGBO(0, 119, 182, 1),
                                style: BorderStyle.solid),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 2,
                                color: Color.fromRGBO(0, 119, 182, 1),
                                style: BorderStyle.solid),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),)
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      height: 70,
                      child: Text(
                        '=',
                        style: TextStyle(fontSize: 40),
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    SizedBox(
                      height: 50,
                      child: Text(
                        '...',
                        style: TextStyle(fontSize: 40),
                      ),
                    ),
                  ],
                ),
                Container(
                  width: 360,
                  height: 38,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color(0x192cd483)),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Icons.warning_amber_outlined,
                            color: Color.fromRGBO(44, 212, 131, 1)),
                        Text(
                          "Press calculate button to get the result",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(127, 127, 127, 1),
                          ),
                        ),
                      ]),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "History".toUpperCase(),
                  style: const TextStyle(
                    color: Color.fromRGBO(44, 212, 131, 1),
                    fontWeight: FontWeight.w700,
                    fontSize: 17,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 25),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Color.fromRGBO(127, 127, 127, 1),
                        width: .9,
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '11 X 20',
                        style: TextStyle(fontSize: 25),
                      ),
                      Text(
                        'reapply',
                        style: TextStyle(
                            fontSize: 15,
                            fontStyle: FontStyle.italic,
                            color: Color.fromRGBO(0, 119, 182, 1),
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                )
              ],
            ),
            TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: Color.fromRGBO(150, 211, 242, 0.1),
                  fixedSize: Size.fromWidth(500),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5))),
              onPressed: () {
                // Validate returns true if the form is valid, or false otherwise.
                if (_formKey.currentState!.validate()) {
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );
                }
              },
              child: Text(
                'Calculate',
                style: TextStyle(
                    color: Color.fromRGBO(0, 119, 182, 1),
                    fontSize: 16,
                    fontWeight: FontWeight.w900),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
