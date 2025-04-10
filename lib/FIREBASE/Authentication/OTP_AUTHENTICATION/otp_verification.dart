import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practical/FIREBASE/Authentication/EMAIL_PASSWORD/home_page.dart';


class OtpVerification extends StatefulWidget {
  String verificationId;

  OtpVerification({super.key, required this.verificationId});

  @override
  State<OtpVerification> createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _otpController = TextEditingController();
  final _auth = FirebaseAuth.instance;

  _verifyOtp() async {
    String otp = _otpController.text.toString();
    try {
      PhoneAuthCredential credential = await PhoneAuthProvider.credential(
          verificationId: widget.verificationId, smsCode: otp);
      _auth.signInWithCredential(credential).then(
        (value) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => HomePage(),
              ));
        },
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Invalid OTP: ${e.toString()}")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("OTP Verification"),
      ),
      body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "enter OTP";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.number,
                  controller: _otpController,
                  decoration: InputDecoration(
                      hintText: "Enter OTP",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      )),
                ),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                    onPressed: () {
                      _verifyOtp();
                    },
                    child: Text("Verify OTP"))
              ],
            ),
          )),
    );
  }
}
