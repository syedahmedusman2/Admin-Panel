import 'package:adminpanel/constants/textstyles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Boolean to play with the visibility of password field
  bool passwordVisible = false;
  // function that will use on on press of eye icon of password textfield to change the visibility of password field
  void changePasswordVisibility() {
    setState(() {
      passwordVisible = !passwordVisible;
    });
  }

  // Formkey that will help us using property of form like validation etc
  final _formKey = GlobalKey<FormState>();
  // Textfield controllers
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  //  Focus Nodes for email and password textfield
  final _focusEmail = FocusNode();
  final _focusPassword = FocusNode();
  //  Boolean that will help us to show loading when we will be authenticating
  bool _isProcessing = false;
  // Function that will be use for authenticating the user
  Future authenticateUser() async {
    setState(() {
      _isProcessing = true;
    });
    try {
      UserCredential? user =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailTextController.text,
        password: _passwordTextController.text,
      );

      setState(() {
        _isProcessing = false;
      });

      if (user != null) {
        Navigator.of(context)
            .pushNamedAndRemoveUntil('/home', (route) => false);
      }
    } catch (e) {
      setState(() {
        _isProcessing = false;
      });
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _focusEmail.unfocus();
        _focusPassword.unfocus();
      },
      child: Scaffold(
          backgroundColor: Theme.of(context).primaryColor,
          body: SafeArea(
              child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 18.0),
                  child: Image.asset(
                    'assets/images/logo.png',
                    height: 200,
                  ),
                ),
                loginCard()
              ],
            ),
          ))),
    );
  }

  Widget loginCard() {
    return Card(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.65,
        height: MediaQuery.of(context).size.height * 0.6,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "LOGIN",
              style: TextStyles.heading1,
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14.0),
                    ),
                    child: TextFormField(
                      controller: _emailTextController,
                      focusNode: _focusEmail,
                      decoration: InputDecoration(
                        hintText: 'Email',
                        border: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14.0),
                    ),
                    child: TextFormField(
                      controller: _passwordTextController,
                      focusNode: _focusPassword,
                      obscureText: !passwordVisible,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        suffixIcon: IconButton(
                          splashRadius: 1,
                          icon: Icon(passwordVisible
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined),
                          onPressed: changePasswordVisibility,
                        ),
                        border: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            _isProcessing
                ? CircularProgressIndicator()
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(
                              MediaQuery.of(context).size.width * 0.5, 50)),
                      onPressed: () async {
                        _focusEmail.unfocus();
                        _focusPassword.unfocus();

                        if (_formKey.currentState!.validate()) {
                          authenticateUser();
                        }
                      },
                      child: Text(
                        'Sign In',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
