// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jobfindr/screens/login.dart';
import 'package:jobfindr/screens/resumedrop.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

final _formKey = GlobalKey<FormState>();

class _SignUpState extends State<SignUp> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late bool passwordVisibility;
  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    passwordVisibility = false;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffffffff),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.12,
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 50),
                    child: Text(
                      'Sign Up',
                      style: GoogleFonts.nunito(
                          color: Colors.black,
                          fontSize: 50,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: TextFormField(
                    controller: nameController,
                    style:
                        GoogleFonts.nunito(fontSize: 20, color: Colors.black),
                    textCapitalization: TextCapitalization.words,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter name';
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                        fillColor: Color(0xffffffff),
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide:
                              const BorderSide(color: Colors.black, width: 2.0),
                        ),
                        hintText: 'Name',
                        prefixIcon: Icon(
                          Icons.person_outline,
                          color: Color(0xff000000),
                        ),
                        hintStyle: GoogleFonts.nunito(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                            color: Color(0xffC9C9C9))),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: TextFormField(
                    controller: emailController,
                    style:
                        GoogleFonts.nunito(fontSize: 20, color: Colors.black),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null) {
                        return 'Please enter e-mail address';
                      } else if (!RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value)) {
                        return 'Enter valid Email';
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                        fillColor: Color(0xffffffff),
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide:
                              const BorderSide(color: Colors.black, width: 2.0),
                        ),
                        hintText: 'Email Id',
                        prefixIcon: Icon(
                          Icons.email_outlined,
                          color: Color(0xff000000),
                        ),
                        hintStyle: GoogleFonts.nunito(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                            color: Color(0xffC9C9C9))),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: TextFormField(
                    controller: passwordController,
                    obscureText: !passwordVisibility,
                    style:
                        GoogleFonts.nunito(fontSize: 20, color: Colors.black),
                    textCapitalization: TextCapitalization.words,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter Password';
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                        fillColor: Color(0xffffffff),
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide:
                               BorderSide(color: Colors.black, width: 2.0),
                        ),
                        hintText: 'Password',
                        prefixIcon: Icon(
                          Icons.key,
                          color: Color(0xff000000),
                        ),
                        suffixIcon: InkWell(
                            onTap: () => setState(
                                  () =>
                                      passwordVisibility = !passwordVisibility,
                                ),
                            child: Icon(
                              passwordVisibility
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                              color: Colors.black,
                              size: 22,
                            )),
                        hintStyle: GoogleFonts.nunito(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                            color: Color(0xffC9C9C9))),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ResumeDrop()));
                      }
                    },
                    child: Text(
                      'Sign Up',
                      style: GoogleFonts.nunito(
                        color: Color(0xffffffff),
                        fontWeight: FontWeight.w800,
                        fontSize: 25,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      elevation: 10,
                      primary: Color(0xff000000),
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.35,
                          vertical: MediaQuery.of(context).size.height * 0.018),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account?',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w800),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()));
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 20,
                              fontWeight: FontWeight.w800),
                        )),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
