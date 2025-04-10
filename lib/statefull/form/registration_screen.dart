import 'package:flutter/material.dart';
import 'package:flutter_practical/statefull/form/utils.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegistrationScreen> {
  final formkey = GlobalKey<FormState>();

  List<String> courses = ["Java", "Android", "Flutter", "Python"];

  String? gender;
  String? course ;
  String? name, email, contact, password;

  String mpassword = "";

  String? _errName,
      _errEmail,
      _errContact,
      _errCourse,
      _errConPassword,
      _errPassword;

  void _updateGender(String? selectedGender) {
    setState(() {
      gender = selectedGender!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Form Widget"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Form(
                key: formkey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: "Student Name",
                          border: OutlineInputBorder(),
                          errorText: _errName),
                      keyboardType: TextInputType.name,
                      validator: (value) => AppUtil.validateName(value!),
                      onSaved: (newValue) => name = newValue,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Enter Email",
                        errorText: _errEmail,
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) => AppUtil.validateEmail(value!),
                      onSaved: (newValue) => email = newValue,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Enter Contact Number",
                        errorText: _errContact,
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) => AppUtil.validateContact(value!),
                      onSaved: (newValue) => contact = newValue,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Text("Gender"),
                        SizedBox(
                          width: 40,
                        ),
                        Row(
                          children: [
                            Radio(
                              value: "male",
                              groupValue: gender,
                              onChanged: (value) {
                                _updateGender(value);
                              },
                            ),
                            Text("Male")
                          ],
                        ),
                        SizedBox(
                          width: 40,
                        ),
                        Row(
                          children: [
                            Radio(
                              value: "female",
                              groupValue: gender,
                              onChanged: (value) {
                                _updateGender(value);
                              },
                            ),
                            Text("Female")
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    DropdownButtonFormField(
                      decoration: InputDecoration(
                        labelText: "Course",
                        errorText: _errCourse,
                        border: OutlineInputBorder(),
                      ),
                      items: List.generate(
                        courses.length,
                        (index) => DropdownMenuItem(
                          child: Text("${courses[index]}"),
                          value: courses[index],
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          course = value!;
                        });
                      },
                      validator: (value) =>
                          course == null ? "please select course" : null,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: "Enter Password",
                          border: OutlineInputBorder(),
                          errorText: _errPassword,
                          helperText:
                              "(Must contain atleast one Capital or small letter and digit)"),
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      onChanged: (value) => mpassword = value,
                      validator: (value) => AppUtil.validatePassword(value!),
                      onSaved: (newValue) => password = newValue,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: "Confirm Password",
                          border: OutlineInputBorder(),
                          errorText: _errConPassword),
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      validator: (value) =>
                          AppUtil.validateConfirmPasswod(value!, mpassword),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Container(
                      width: double.infinity,
                      child: FilledButton(
                          onPressed: () {
                            if(formkey.currentState!.validate())
                              {
                                formkey.currentState!.save();

                            /*    print('''
                                Name:$name,
                                Email:$email,
                                Contact:$contact,
                                password:$password,
                                course:$course,
                                Gender:$gender
                          
                                '''); */
                                Fluttertoast.showToast(msg: "All work is done",

                                  timeInSecForIosWeb: 2
                                );
                              }

                          }, child: Text("Register")),

                    ),


                  ],
                )),
          ),
        ));
  }
}
