import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});
  @override
  State<Calculator> createState() => CalculatorState();
}

class CalculatorState extends State<Calculator> {
  String? isPressed;
  final _formKey = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  String? right;
  String? left;
  final firstNum = TextEditingController();
  final secondNum = TextEditingController();

  @override
  void dispose() {
    firstNum.dispose();
    secondNum.dispose();
    super.dispose();
  }

  num? result ;
  num? calculate(
      {required num num1, required String operator, required num num2}) {
    switch (operator) {
      case '+':
        result = num1 + num2;
      case '-':
        result = num1 - num2;
      case '*':
        result = num1 * num2;
      case '/':
        result = num1 / num2;
      default:
        result = 0;
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
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
              'Simpe Calculator',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 23.0),
            ),
          ],
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
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
                        fixedSize: const Size.fromWidth(100),
                        backgroundColor: isPressed == '+'
                            ? Color.fromARGB(24, 19, 70, 95)
                            : Colors.transparent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                            side: const BorderSide(
                                width: 1, color: Color(0xFFD9D9D9))),
                      ),
                      onPressed: () {
                        setState(() {
                          isPressed = '+';
                        });
                      },
                      child: Text(
                        'Add',
                        style: TextStyle(
                            color: isPressed == '+'
                                ? const Color.fromRGBO(0, 119, 182, 1)
                                : Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        fixedSize: const Size.fromWidth(100),
                        backgroundColor: isPressed == '-'
                            ? const Color.fromRGBO(150, 211, 242, 0.1)
                            : Colors.transparent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                            side: const BorderSide(
                                width: 1, color: Color(0xFFD9D9D9))),
                      ),
                      onPressed: () {
                        setState(() {
                          isPressed = '-';
                        });
                      },
                      child: Text(
                        'Subtract',
                        style: TextStyle(
                            color: isPressed == '-'
                                ? const Color.fromRGBO(0, 119, 182, 1)
                                : Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: isPressed == '*'
                            ? const Color.fromRGBO(150, 211, 242, 0.1)
                            : Colors.transparent,
                        fixedSize: const Size.fromWidth(100),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                            side: const BorderSide(
                                width: 1, color: Color(0xFFD9D9D9))),
                      ),
                      onPressed: () {
                        setState(() {
                          isPressed = '*';
                        });
                      },
                      child: Text(
                        'Multiply',
                        style: TextStyle(
                            backgroundColor: isPressed == '*'
                                ? const Color.fromRGBO(150, 211, 242, 0.1)
                                : Colors.transparent,
                            color: isPressed == '*'
                                ? const Color.fromRGBO(0, 119, 182, 1)
                                : Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: isPressed == '/'
                        ? const Color.fromRGBO(150, 211, 242, 0.1)
                        : Colors.transparent,
                    fixedSize: const Size.fromWidth(100),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                        side: const BorderSide(
                            width: 1, color: Color(0xFFD9D9D9))),
                  ),
                  onPressed: () {
                    setState(() {
                      isPressed = '/';
                    });
                  },
                  child: Text(
                    'Divide',
                    style: TextStyle(
                        color: isPressed == '/'
                            ? const Color.fromRGBO(0, 119, 182, 1)
                            : Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                        width: 80,
                        height: 80,
                        child: Form(
                          key: _formKey,
                          child: TextFormField(
                            controller: firstNum,
                            keyboardType: TextInputType.number,
                            maxLength: 20,
                            decoration: InputDecoration(
                              counterStyle: const TextStyle(
                                height: double.minPositive,
                              ),
                              counterText: "",
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 3,
                                    color: Color.fromRGBO(0, 119, 182, 1),
                                    style: BorderStyle.solid),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 2,
                                    color: Color.fromRGBO(0, 119, 182, 1),
                                    style: BorderStyle.solid),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                setState(() {
                                  left = 'Left Form Cannot be empty';
                                });
                                return '';
                              }
                              return null;
                            },
                          ),
                        )),
                    const SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      height: 70,
                      width: 35,
                      child: Text(
                        isPressed == '+'
                            ? '+'
                            : isPressed == '-'
                                ? '-'
                                : isPressed == '*'
                                    ? 'x'
                                    : isPressed == '/'
                                        ? '/'
                                        : '...',
                        style: const TextStyle(fontSize: 40),
                      ),
                    ),
                    const SizedBox(
                      width: 7,
                    ),
                    SizedBox(
                      width: 80,
                      height: 80,
                      child: Form(
                        key: _formKey2,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          controller: secondNum,
                          maxLength: 20,
                          decoration: InputDecoration(
                            counterStyle: const TextStyle(
                              height: double.minPositive,
                            ),
                            counterText: "",
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 3,
                                  color: Color.fromRGBO(0, 119, 182, 1),
                                  style: BorderStyle.solid),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 2,
                                  color: Color.fromRGBO(0, 119, 182, 1),
                                  style: BorderStyle.solid),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              setState(() {
                                right = 'Right Form Cannot be empty';
                              });
                              return '';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const SizedBox(
                      height: 70,
                      child: Text(
                        '=',
                        style: TextStyle(fontSize: 40),
                      ),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    SizedBox(
                      height: 50,
                      child: Text(
                      result != null ?  result!.toStringAsFixed(2): '....',
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
                      color: const Color(0x192cd483)),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Icon(Icons.warning_amber_outlined,
                            color: Color.fromRGBO(44, 212, 131, 1)),
                        Text(
                          right != null
                              ? right!
                              : left != null
                                  ? left!
                                  : "Press calculate button to get the result",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: right != null || left != null
                                ? Colors.red
                                : Color.fromRGBO(127, 127, 127, 1),
                          ),
                        ),
                      ]),
                ),
                const SizedBox(
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
                const SizedBox(
                  height: 15,
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: 25),
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Color.fromRGBO(127, 127, 127, 1),
                        width: .9,
                      ),
                    ),
                  ),
                  child: const Row(
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
                  backgroundColor: const Color.fromRGBO(150, 211, 242, 0.1),
                  fixedSize: const Size.fromWidth(500),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5))),
              onPressed: () {
                if (_formKey.currentState!.validate() &&
                    _formKey2.currentState!.validate()) {
                  setState(() {
                    left = null;
                    right = null;
                  });
                  calculate(
                      num1: num.parse(firstNum.text),
                      operator: isPressed!,
                      num2: num.parse(secondNum.text));
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );
                }
              },
              child: const Text(
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
