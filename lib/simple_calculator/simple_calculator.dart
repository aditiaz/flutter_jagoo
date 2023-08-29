import 'package:flutter/material.dart';
import 'package:jagoo_latihan/widgets/text_section.dart';
import 'package:jagoo_latihan/widgets/vertical_padding.dart';
import 'package:jagoo_latihan/widgets/horizontal_padidng.dart';
import 'package:jagoo_latihan/widgets/calculator_button.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});
  @override
  State<Calculator> createState() => CalculatorState();
}

class CalculatorState extends State<Calculator> {
  String? isPressed = '+';
  final _formKey = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  String? right;
  String? left;
  var firstNum = TextEditingController();
  final secondNum = TextEditingController();

  @override
  void dispose() {
    firstNum.dispose();
    secondNum.dispose();
    super.dispose();
  }

  num? result;
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

  List<Map<String, String>> history = [];
  void addHistoryItem(String num1, String operator, String num2) {
    Map<String, String> newItem = {
      'Num1': num1,
      'Operator': operator,
      'Num2': num2,
    };
    history.add(newItem);
  }

  @override
  Widget build(BuildContext context) {
    String? formattedResult = result.toString();

    if (result == result?.truncate()) {
      formattedResult = result?.truncate().toString();
    } else {
      formattedResult = result?.toStringAsFixed(2);
    }


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
              'Simple Calculator',
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
                const TextSection(title: 'Choose Type'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CalculatorButton(
                        operator: '+',
                        isPressed: isPressed!,
                        onPresssed: () {
                          setState(() {
                            isPressed = '+';
                          });
                        },
                        title: 'Add'),
                    const HorizontalPadding(),
                    CalculatorButton(
                        isPressed: isPressed!,
                        onPresssed: () {
                          setState(() {
                            isPressed = '-';
                          });
                        },
                        operator: '-',
                        title: 'Subtract'),
                    const HorizontalPadding(),
                    CalculatorButton(
                        isPressed: isPressed!,
                        onPresssed: () {
                          setState(() {
                            isPressed = '*';
                          });
                        },
                        operator: '*',
                        title: 'Multiply')
                  ],
                ),
                CalculatorButton(
                    isPressed: isPressed!,
                    onPresssed: () {
                      setState(() {
                        isPressed = '/';
                      });
                    },
                    operator: '/',
                    title: 'Divide'),
                VerticalPadding(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 60,
                      height: 60,
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
                      ),
                    ),
                    HorizontalPadding(),
                    SizedBox(
                      height: 60,
                      width: 35,
                      child: Text(
                        isPressed == '+'
                            ? '+'
                            : isPressed == '-'
                                ? '-'
                                : isPressed == '*'
                                    ? 'x'
                                    : '/',
                        style: const TextStyle(fontSize: 40),
                      ),
                    ),
                    HorizontalPadding(),
                    SizedBox(
                      width: 60,
                      height: 60,
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
                    HorizontalPadding(),
                    const SizedBox(
                      height: 70,
                      child: Text(
                        '=',
                        style: TextStyle(fontSize: 40),
                      ),
                    ),
                  HorizontalPadding(),
                    SizedBox(
                      height: 50,
                      child: Text(
                        result != null ? formattedResult! : '....',
                        style: const TextStyle(fontSize: 20),
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
                                : const Color.fromRGBO(127, 127, 127, 1),
                          ),
                        ),
                      ]),
                ),
                VerticalPadding(),
                const TextSection(title: 'History'),
                Text(
                  history.isEmpty ? "No history found" : '',
                  style: const TextStyle(
                      color: Color(0xFFD9D9D9),
                      fontWeight: FontWeight.w700,
                      fontSize: 17,
                      fontStyle: FontStyle.italic),
                ),
                SingleChildScrollView(
                  physics: ScrollPhysics(),
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: history.length,
                    padding: const EdgeInsets.all(10),
                    itemBuilder: (BuildContext context, int index) {
                      Map<String, String> historyItem = history[index];
                      return ListBody(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${historyItem['Num1']} ${historyItem['Operator']} ${historyItem['Num2']}',
                                style: const TextStyle(
                                    fontSize: 25, color: Colors.black),
                              ),
                              TextButton(
                                onPressed: () {
                                  setState(() {
                                    firstNum.text = historyItem['Num1']!;
                                    isPressed = historyItem['Operator'];
                                    secondNum.text = historyItem['Num2']!;
                                  });
                                },
                                child: const Text(
                                  'reapply',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontStyle: FontStyle.italic,
                                      color: Color.fromRGBO(0, 119, 182, 1),
                                      fontWeight: FontWeight.w500),
                                ),
                              )
                            ],
                          ),
                        ],
                      );
                    },
                  ),
                ),
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
                  addHistoryItem(firstNum.text, isPressed!, secondNum.text);
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
