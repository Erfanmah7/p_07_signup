import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class Forget extends StatefulWidget {

  @override
  _ForgetState createState() => _ForgetState();
}

class _ForgetState extends State<Forget> {
  Size size;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Send Email'),
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
                  child:  TextFormField(
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
                    'SEND',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                const SizedBox(
                  height: 13,
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
