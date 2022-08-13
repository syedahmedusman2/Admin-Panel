import 'package:adminpanel/constants/textstyles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool passwordVisible = false;
  void togglePassword() {
    setState(() {
      passwordVisible = !passwordVisible;
    });
  }

  final _formKey = GlobalKey<FormState>();

  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  final _focusEmail = FocusNode();
  final _focusPassword = FocusNode();

  bool _isProcessing = false;

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
              child: Padding(
            padding: const EdgeInsets.fromLTRB(24.0, 30.0, 24.0, 0),
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
                  Card(
                    color: Colors.white,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      height: MediaQuery.of(context).size.height * 0.6,
                      alignment: Alignment.center,
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
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.0),
                                  decoration: BoxDecoration(
                                    // color: textWhiteGrey,
                                    borderRadius: BorderRadius.circular(14.0),
                                  ),
                                  child: TextFormField(
                                    controller: _emailTextController,
                                    focusNode: _focusEmail,
                                    // validator: (value) => Validator.validateEmail(
                                    //   email: value,
                                    // ),
                                    decoration: InputDecoration(
                                      hintText: 'Email',
                                      // hintStyle: heading6.copyWith(color: textGrey),
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
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.0),
                                  decoration: BoxDecoration(
                                    // color: textWhiteGrey,
                                    borderRadius: BorderRadius.circular(14.0),
                                  ),
                                  child: TextFormField(
                                    controller: _passwordTextController,
                                    focusNode: _focusPassword,
                                    obscureText: !passwordVisible,
                                    // validator: (value) => Validator.validatePassword(
                                    //   password: value,
                                    // ),
                                    decoration: InputDecoration(
                                      hintText: 'Password',
                                      // hintStyle: heading6.copyWith(color: textGrey),
                                      suffixIcon: IconButton(
                                        // color: textGrey,
                                        splashRadius: 1,
                                        icon: Icon(passwordVisible
                                            ? Icons.visibility_outlined
                                            : Icons.visibility_off_outlined),
                                        onPressed: togglePassword,
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
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 40),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        fixedSize: Size(
                                            MediaQuery.of(context).size.width *
                                                0.5,
                                            50)),
                                    onPressed: () async {
                                      _focusEmail.unfocus();
                                      _focusPassword.unfocus();

                                      if (_formKey.currentState!.validate()) {
                                        setState(() {
                                          _isProcessing = true;
                                        });
                                        try {
                                          UserCredential? user =
                                              await FirebaseAuth.instance
                                                  .signInWithEmailAndPassword(
                                            email: _emailTextController.text,
                                            password:
                                                _passwordTextController.text,
                                          );

                                          setState(() {
                                            _isProcessing = false;
                                          });

                                          if (user != null) {
                                            Navigator.of(context)
                                                .pushNamedAndRemoveUntil(
                                                    '/home', (route) => false);
                                          }
                                        } catch (e) {
                                          setState(() {
                                            _isProcessing = false;
                                          });
                                          print(e);
                                        }
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
                  )
                  // Column(
                  //   crossAxisAlignment: CrossAxisAlignment.center,
                  //   children: [
                  //     const Center(
                  //       child: CircleAvatar(
                  //         backgroundColor: Colors.white,
                  //         backgroundImage: NetworkImage(
                  //             "https://upload.wikimedia.org/wikipedia/commons/5/53/Wikimedia-logo.png"),
                  //         radius: 40.0,
                  //       ),
                  //     ),
                  //     const SizedBox(
                  //       height: 10,
                  //     ),
                  //     Text(
                  //       'Login',
                  //       // style: heading2.copyWith(color: textBlack),
                  //     ),
                  //     const SizedBox(
                  //       height: 20,
                  //     ),
                  //     // Image.asset(
                  //     //   'assets/images/accent.png',
                  //     //   width: 99,
                  //     //   height: 4,
                  //     // ),
                  //     const SizedBox(
                  //       height: 10,
                  //     ),
                  //   ],
                  // ),
                  // const SizedBox(
                  //   height: 10,
                  // ),
                  // Form(
                  //   key: _formKey,
                  //   child: Column(
                  //     children: [
                  //       Container(
                  //         decoration: BoxDecoration(
                  //           // color: textWhiteGrey,
                  //           borderRadius: BorderRadius.circular(14.0),
                  //         ),
                  //         child: TextFormField(
                  //           controller: _emailTextController,
                  //           focusNode: _focusEmail,
                  //           // validator: (value) => Validator.validateEmail(
                  //           //   email: value,
                  //           // ),
                  //           decoration: InputDecoration(
                  //             hintText: 'Email',
                  //             // hintStyle: heading6.copyWith(color: textGrey),
                  //             border: const OutlineInputBorder(
                  //               borderSide: BorderSide.none,
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //       const SizedBox(
                  //         height: 22,
                  //       ),
                  //       Container(
                  //         decoration: BoxDecoration(
                  //           // color: textWhiteGrey,
                  //           borderRadius: BorderRadius.circular(14.0),
                  //         ),
                  //         child: TextFormField(
                  //           controller: _passwordTextController,
                  //           focusNode: _focusPassword,
                  //           obscureText: !passwordVisible,
                  //           // validator: (value) => Validator.validatePassword(
                  //           //   password: value,
                  //           // ),
                  //           decoration: InputDecoration(
                  //             hintText: 'Password',
                  //             // hintStyle: heading6.copyWith(color: textGrey),
                  //             suffixIcon: IconButton(
                  //               // color: textGrey,
                  //               splashRadius: 1,
                  //               icon: Icon(passwordVisible
                  //                   ? Icons.visibility_outlined
                  //                   : Icons.visibility_off_outlined),
                  //               onPressed: togglePassword,
                  //             ),
                  //             border: const OutlineInputBorder(
                  //               borderSide: BorderSide.none,
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // const SizedBox(
                  //   height: 22,
                  // ),
                  // const SizedBox(
                  //   height: 22,
                  // ),
                  // SizedBox(height: 20.0),
                  // _isProcessing
                  //     ? CircularProgressIndicator()
                  //     : Row(
                  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //         children: [
                  //           Expanded(
                  //             child: ElevatedButton(
                  //               style: ElevatedButton.styleFrom(
                  //                   fixedSize: const Size(70, 50)),
                  //               onPressed: () async {
                  //                 _focusEmail.unfocus();
                  //                 _focusPassword.unfocus();

                  //                 if (_formKey.currentState!.validate()) {
                  //                   setState(() {
                  //                     _isProcessing = true;
                  //                   });

                  //                   UserCredential? user = await FirebaseAuth.instance
                  //                       .signInWithEmailAndPassword(
                  //                     email: _emailTextController.text,
                  //                     password: _passwordTextController.text,
                  //                   );

                  //                   setState(() {
                  //                     _isProcessing = false;
                  //                   });

                  //                   if (user != null) {
                  //                     // Navigator.of(context).pushReplacement(
                  //                     //   MaterialPageRoute(
                  //                     //     builder: (context) =>
                  //                     //         ProfilePage(user: user),
                  //                     //   ),
                  //                     // );
                  //                   }
                  //                 }
                  //               },
                  //               child: Text(
                  //                 'Sign In',
                  //                 style: TextStyle(color: Colors.white),
                  //               ),
                  //             ),
                  //           ),
                  //           SizedBox(width: 14.0),
                  //           Expanded(
                  //             child: ElevatedButton(
                  //               style: ElevatedButton.styleFrom(
                  //                   fixedSize: const Size(70, 50)),
                  //               onPressed: () {
                  //                 // Navigator.of(context).push(
                  //                 //   MaterialPageRoute(
                  //                 //     builder: (context) => RegisterPage(),
                  //                 //   ),
                  //                 // );
                  //               },
                  //               child: Text(
                  //                 'Register',
                  //                 style: TextStyle(color: Colors.white),
                  //               ),
                  //             ),
                  //           ),
                  //         ],
                  //       )
                ],
              ),
            ),
          ))),
    );
  }
}
