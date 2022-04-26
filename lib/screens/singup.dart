import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:email_validator/email_validator.dart';
import 'package:p_07_singup/models/user.dart';
import 'package:p_07_singup/screens/singin.dart';

class SingUp extends StatefulWidget {
  //const MyApp({Key? key}) : super(key: key);

  @override
  State<SingUp> createState() => _SingUpState();
}

class _SingUpState extends State<SingUp> {
  Size size;
  String _value;
  bool flag = true;
  TextEditingController FNconteroler;
  TextEditingController LNconteroler;
  TextEditingController EMconteroler;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  void initState() {
    FNconteroler = TextEditingController();
    LNconteroler = TextEditingController();
    EMconteroler = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    FNconteroler.dispose();
    LNconteroler.dispose();
    EMconteroler.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('SingUp'),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: size.width * 0.36,
                    child: TextFormField(
                      controller: FNconteroler,
                      validator: (m) {
                        if (m == '') {
                          return 'Please enter your First name';
                        } else {
                          return null;
                        }
                      },
                      decoration: const InputDecoration(
                        label: Text(
                          'First name',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: size.width * 0.36,
                    child: TextFormField(
                      controller: LNconteroler,
                      validator: (m) {
                        if (m == '') {
                          return 'Please enter your Last name';
                        } else {
                          return null;
                        }
                      },
                      decoration: const InputDecoration(
                        label: Text(
                          'Last name',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 1,
              ),
              Container(
                width: size.width * 0.75,
                child: TextFormField(
                  controller: EMconteroler,
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
                  decoration: const InputDecoration(
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
                      'Password retype',
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
                height: 1,
              ),
              Container(
                width: size.width * 0.75,
                child: DropdownButtonFormField(
                  validator: (value) =>
                  value == null ? 'Please fill in your gender' : null,

                  value: _value,
                  items: const [
                    DropdownMenuItem(
                      child: Text(
                        "Male",
                        style: TextStyle(color: Colors.black),
                      ),
                      value: "1",
                    ),
                    DropdownMenuItem(
                      child: Text(
                        "Female",
                        style: TextStyle(color: Colors.black),
                      ),
                      value: "2",
                    ),
                  ],
                  onChanged: (value) {
                    setState(() {
                      _value = value;
                    });
                  },
                  isExpanded: true,
                  // underline: Container(
                  //   color: Colors.grey,
                  //   height: 1,
                  // ),
                  style: const TextStyle(fontSize: 18, color: Colors.black),
                  hint: const Text(
                    'Gender',
                    style: TextStyle(color: Colors.grey),
                  ),
                  // dropdownColor: Colors.green,
                  // iconEnabledColor: Colors.white, //Icon color
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
                  add();
                  printer();
                },
                child: const Text(
                  'SINGUP',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              InkWell(
                  splashColor: Colors.purple,
                  onTap: () {
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => SingIn()));
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => SingIn()));
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(color: Colors.grey),
                  )),
              const SizedBox(
                height: 14,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void validation() {
    FormState _form = _formkey.currentState;
    if (_form.validate()) return null;
    return null;
  }

  //print name & family
  void printer() {
    var fn = FNconteroler.text;
    var ln = LNconteroler.text;
    var em = EMconteroler.text;
    print('$fn $ln $em');
  }

  add() async{

    Box box = await Hive.openBox('user');
    user userobj = user();
    userobj.fn = FNconteroler.text;
    userobj.ln = LNconteroler.text;
    userobj.em = EMconteroler.text;
    box.add(userobj);

    print(box);

  }

}
