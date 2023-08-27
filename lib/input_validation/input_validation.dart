import 'package:flutter/material.dart';

class InputValidaton extends StatefulWidget {
  const InputValidaton({super.key});
  @override
  State<InputValidaton> createState() => InputValidatonState();
}

class InputValidatonState extends State<InputValidaton> {
  final _formKey = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  String? name;
  String? email;
  final myName = TextEditingController();
  final myEmail = TextEditingController();
 

  @override
  void dispose() {
    myName.dispose();
    myEmail.dispose();
    super.dispose();
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
              'Input Validation',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 23.0),
            ),
          ],
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                  name != null ? 'Hi there ${myName.text}' : 'Hi There!',

                    style:const TextStyle(
                        color: Color.fromRGBO(0, 119, 182, 1),
                        fontSize: 19,
                        fontWeight: FontWeight.w600),
                  ),
                   Text(
                     email != null ? 'Your email addres was  ${myEmail.text}' :  'Please enter your name and email :)',
                    style:const TextStyle(
                      color: Color.fromRGBO(127, 127, 127, 1),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text.rich(
                    TextSpan(children: [
                      TextSpan(
                          text: 'Name',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.w400)),
                      TextSpan(text: ' *', style: TextStyle(color: Colors.red)),
                    ]),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 350,
                    height: 55,
                    child: Form(
                      key: _formKey,
                      child: TextFormField(
                        controller: myName,
                        maxLength: 20,
                        decoration: InputDecoration(
                          
                          hintText: 'Enter  your name ...',
                          counterStyle: const TextStyle(
                            height: double.minPositive,
                          ),
                          prefixIcon: const Icon(
                            Icons.person_2_outlined,
                            color: Color.fromRGBO(0, 119, 182, 1),
                          ),
                          counterText: "",
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 2,
                                color: Color.fromRGBO(0, 119, 182, 1),
                                style: BorderStyle.solid),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 2,
                                color: Color.fromRGBO(0, 119, 182, 1),
                                style: BorderStyle.solid),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Name cannot be empty';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text.rich(
                    TextSpan(children: [
                      TextSpan(
                          text: 'Email',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.w400)),
                      TextSpan(text: ' *', style: TextStyle(color: Colors.red)),
                    ]),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 350,
                    height: 55,
                    
                    child: Form(
                      key: _formKey2,
                      child: TextFormField(
                        controller: myEmail,
                        maxLength: 20,
                        decoration: InputDecoration(
                          
                          hintText: 'Enter  your email ...',
                          counterStyle: const TextStyle(
                            height: double.minPositive,
                          ),
                          prefixIcon: const Icon(
                            Icons.email_outlined,
                            color: Color.fromRGBO(0, 119, 182, 1),
                          ),
                          counterText: "",
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 2,
                                color: Color.fromRGBO(0, 119, 182, 1),
                                style: BorderStyle.solid),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 2,
                                color: Color.fromRGBO(0, 119, 182, 1),
                                style: BorderStyle.solid),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Email cannot be empty';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor:
                            const Color.fromRGBO(150, 211, 242, 0.1),
                        fixedSize: const Size.fromWidth(500),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5))),
                    onPressed: () {
                      if (_formKey2.currentState!.validate() &&
                          _formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Processing Data')),
                        );
                        setState(() {
                          name = _formKey.currentState.toString();
                          email = _formKey2.currentState.toString();
                        });
                      }
                    },
                    child: const Text(
                      'Submit',
                      style: TextStyle(
                          color: Color.fromRGBO(0, 119, 182, 1),
                          fontSize: 16,
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                ],
              ),
            ]),
      ),
    );
  }
}
