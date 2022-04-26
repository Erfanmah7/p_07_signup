import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:p_07_singup/screens/singup.dart';

import 'forget.dart';

class SingIn extends StatefulWidget {
  @override
  _SingInState createState() => _SingInState();
}

class _SingInState extends State<SingIn> {
  Size size;
  bool flag = true;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('SingIn'),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: _formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 30,
                ),
                Container(
                  width: size.width * 0.75,
                  child: TextFormField(
                    validator: (email) {
                      if (email == '') {
                        return 'Please enter your Email';
                      } else if (EmailValidator.validate(email) == false) {
                        return 'The entered email is invalid';
                      } else {
                        return null;
                      }
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      label: Text(
                        'Email',
                        style: TextStyle(color: Colors.grey),
                      ),
                      icon: Icon(Icons.email),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 1,
                ),
                Container(
                  width: size.width * 0.75,
                  child: TextFormField(
                    validator: (m) {
                      if (m == '') {
                        return 'Please enter your Password';
                      } else if (m.length < 6) {
                        return 'The number of characters entered is less than 6';
                      } else {
                        return null;
                      }
                    },
                    obscureText: flag,
                    decoration: InputDecoration(
                      label: const Text(
                        'Password',
                        style: TextStyle(color: Colors.grey),
                      ),
                      suffixIcon: GestureDetector(
                        child: Icon(flag == false
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onTap: () {
                          setState(() {
                            flag = !flag;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  style: TextButton.styleFrom(
                    primary: Colors.white, // background
                    backgroundColor: Colors.purple,
                    minimumSize: Size(size.width * 0.75, 40),
                  ),
                  onPressed: () {
                    validation();
                  },
                  child: const Text(
                    'LOGIN',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                const SizedBox(
                  height: 13,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      splashColor: Colors.purple,
                      onTap: () {
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) => SingUp(),),);
                      },
                      child: const Text(
                        'SingUp',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    VerticalDivider(
                      color: Colors.purple,
                      thickness: 500,
                    ),
                    InkWell(
                        splashColor: Colors.purple,
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Forget()));
                        },
                        child: const Text(
                          'Forget your login details?',
                          style: TextStyle(color: Colors.grey),
                        )),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validation() {
    FormState _form = _formkey.currentState;
    if (_form.validate()) {
      print('yes');
    } else {
      print('no');
    }
  }
}
