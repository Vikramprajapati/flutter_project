import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practical/FIREBASE/Authentication/EMAIL_PASSWORD/home_page.dart';



class SignUpPage extends StatefulWidget {
  SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController _emailController = TextEditingController();

  TextEditingController _passwordController = TextEditingController();

  final GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();

  signUp(String email, String password, BuildContext context) async {
    // UserCredential? usercredential;
    try {

      // create user on firebase
       await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password)
          .then(
        (value) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => HomePage(),
              ));
        },
      );
    } on FirebaseAuthException catch (e) {
      String errorMessage = "Registration failed!";

      if (e.code == 'email-already-in-use') {
        errorMessage = "This email is already registered!";
      } else if (e.code == 'weak-password') {
        errorMessage = "Password is too weak. Use at least 6 characters!";
      } else if (e.code == 'invalid-email') {
        errorMessage = "Invalid email format!";
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(errorMessage, style: TextStyle(color: Colors.white)),
            ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Sign Up'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
              key: signUpFormKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "email field required";
                      }
                      return null;
                    },
                    controller: _emailController,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        hintText: "Enter E-mail"),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "password field required";
                      }
                      return null;
                    },
                    controller: _passwordController,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.password),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        hintText: "Enter Password"),
                    obscureText: true,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (signUpFormKey.currentState!.validate()) {
                          signUp(_emailController.text.toString(),
                              _passwordController.text.toString(), context);
                        }
                      },
                      child: Text("Sign Up")),
                  SizedBox(
                    height: 10,
                  ),
                ],
              )),
        ));
  }
}
