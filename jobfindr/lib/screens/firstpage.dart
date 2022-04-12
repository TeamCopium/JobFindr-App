// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'login.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: size.width,
            height: size.height * 0.38,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/Rectangle 1.png'),
                    fit: BoxFit.fill)),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              'Get The Job',
              style: GoogleFonts.nunito(
                  color: Colors.black,
                  fontSize: 50,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              'That You Dream',
              style: GoogleFonts.nunito(
                  color: Colors.black,
                  fontSize: 50,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              'By using this application you will able to find',
              style: GoogleFonts.nunito(
                  color: Colors.black45,
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              'out some of the jobs that suits you',
              style: GoogleFonts.nunito(
                  color: Colors.black45,
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(
            height: size.height * 0.17,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
              child: Text(
                'Start',
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
                    horizontal: size.width * 0.38,
                    vertical: size.height * 0.02),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
