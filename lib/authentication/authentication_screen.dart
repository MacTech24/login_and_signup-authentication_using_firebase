import 'package:flutter/material.dart';
import 'package:login_and_signup_authentication/services/auth_function.dart';

import '../Screens/reset_screen.dart';
import 'widgets/custom_text_field.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({Key? key}) : super(key: key);

  @override
  _AuthenticationScreenState createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  String fullName = "";
  String emailAddress = "";
  String password = "";
  bool isLogin = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    fullNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.grey[200],
        child: Stack(
          children: [
            Container(),
            Positioned(
              left: -50,
              top: -50,
              child: Container(
                height: 160,
                width: 160,
                decoration: BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ),
            Positioned(
              left: 80,
              top: 80,
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ),
            Positioned(
              right: 80,
              bottom: 80,
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ),
            Positioned(
              right: -50,
              bottom: -50,
              child: Container(
                height: 160,
                width: 160,
                decoration: BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ),
            Container(),
            Center(
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        isLogin ? "Login" : "Register",
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      //=======FullName==========
                      isLogin
                          ? Container()
                          : CustomTextField(
                              controller: fullNameController,
                              hintText: "Full Name",
                              uniqueKey: "fullName",
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Enter your full name";
                                }
                              },
                              onSaved: (value) {
                                setState(() {
                                  fullName = value!;
                                });
                              },
                            ),
                      const SizedBox(
                        height: 10,
                      ),
                      //==========EmailAddress==========
                      CustomTextField(
                        controller: emailController,
                        hintText: "Email",
                        uniqueKey: "emailAddress",
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              !(value.contains("@"))) {
                            return "Enter a valid Eemail Address";
                          }
                        },
                        onSaved: (value) {
                          setState(() {
                            emailAddress = value!;
                          });
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      //==========Password==========
                      CustomTextField(
                        controller: passwordController,
                        hintText: "Password",
                        uniqueKey: "password",
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              value.length < 6) {
                            return "Must be up to 6 characters";
                          }
                        },
                        onSaved: (value) {
                          setState(() {
                            password = value!;
                          });
                        },
                      ),

                      isLogin
                          ? TextButton(
                              onPressed: () {
                                Route route = MaterialPageRoute(
                                    builder: (context) => ResetScreen());
                                Navigator.push(context, route);
                              },
                              child: Text("Forget Password?"),
                            )
                          : Container(),
                      isLogin
                          ? Container()
                          : const SizedBox(
                              height: 30,
                            ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          width: double.infinity,
                          height: 50,
                          child: MaterialButton(
                            color: Colors.purple,
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                isLogin
                                    ? AuthServices.signin(emailAddress,
                                        password, fullName, context)
                                    : AuthServices.signupUser(emailAddress,
                                        password, fullName, context);
                              }
                            },
                            child: Text(
                              isLogin ? "Login" : "SignUp",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            isLogin = !isLogin;
                          });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              isLogin
                                  ? "New user? "
                                  : "Already have an account? ",
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              isLogin ? "Signup" : "Login",
                              style: const TextStyle(
                                color: Colors.blue,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          height: 50,
                          width: double.infinity,
                          color: Colors.white,
                          child: TextButton(
                              onPressed: () {},
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "assets/google.png",
                                    width: 20,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const Text(
                                    "Sign In with Google",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                    ),
                                  )
                                ],
                              )),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
