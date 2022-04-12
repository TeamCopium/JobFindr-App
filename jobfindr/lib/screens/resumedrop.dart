// ignore_for_file: prefer_const_constructors, avoid_print, prefer_const_literals_to_create_immutables

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

import 'package:dotted_border/dotted_border.dart';

class ResumeDrop extends StatefulWidget {
  const ResumeDrop({Key? key}) : super(key: key);

  @override
  State<ResumeDrop> createState() => _ResumeDropState();
}

class _ResumeDropState extends State<ResumeDrop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xff000000),
        centerTitle: true,
        title: Text(
          'Job FindR',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            DottedBorder(
              color: Colors.black,
              dashPattern: [15, 15],
              strokeWidth: 2,
              child: SizedBox(
                height: 400,
                width: 350,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 120),
                  child: Column(
                    children: [
                      IconButton(
                        onPressed: () async {
                          final result = await FilePicker.platform.pickFiles();
                          if (result == null) return;
                          final file = result.files.first;
                          print('Name: ${file.name}');
                          print('Bytes: ${file.bytes}');
                          print('Name: ${file.size}');
                          print('Extension: ${file.extension}');
                          print('Path: ${file.path}');
                          await saveFilePermanently(file);
                          print('Path: ${file.path}');
                        },
                        iconSize: 80,
                        icon: Icon(
                          Icons.add,
                          color: Colors.black87,
                        ),
                      ),
                      Text(
                        'Upload Resume',
                        style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.bold,
                            fontSize: 30),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.12,
            ),
            ElevatedButton(
              child: Text('Find Jobs!'),
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  primary: Color(0xff000000),
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 18),
                  textStyle:
                      TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }

  Future<File> saveFilePermanently(PlatformFile file) async {
    final appStorage = await getApplicationDocumentsDirectory();
    final newFile = File('${appStorage.path}/ ${file.name}');
    return File(file.path!).copy(newFile.path);
  }

  void openFile(PlatformFile file) {
    OpenFile.open(file.path!);
  }
}
