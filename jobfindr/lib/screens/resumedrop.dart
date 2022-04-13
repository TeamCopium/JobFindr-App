// ignore_for_file: prefer_const_constructors, avoid_print, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:dotted_border/dotted_border.dart';
import 'package:jobfindr/screens/jobs.dart';


class ResumeDrop extends StatefulWidget {
  const ResumeDrop({Key? key}) : super(key: key);

  @override
  State<ResumeDrop> createState() => _ResumeDropState();
}

class _ResumeDropState extends State<ResumeDrop> {
  PlatformFile? pickedFile;
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
                          final result = await FilePicker.platform.pickFiles(
                            type: FileType.custom,
                            allowedExtensions: ['pdf','doc'],
                          );
                          if (result == null) return;
                          setState(() {
                            pickedFile = result.files.first;
                          });
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
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            if (pickedFile != null)
              Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.08,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 2),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          FaIcon(FontAwesomeIcons.solidFilePdf,
                              size: 40, color: Colors.red[900]),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: Text(
                              pickedFile!.name,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  //buildProgress(),
                ],
              ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            ElevatedButton(
              child: Text('Search'),
              onPressed: () async{
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => JobPage()));
              },
              style: ElevatedButton.styleFrom(
                  primary: Color(0xff000000),
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  textStyle:
                      TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
//   Widget buildProgress()=>StreamBuilder<TaskSnapshot>(stream: uploadTask?.snapshotEvents,builder: (context,snapshot){
//     if(snapshot.hasData){
//       final data = snapshot.data;
//       double progress = data.bytesTransferred / data.totalBytes;
//       return SizedBox(
//         height: 20,
// child: Stack(
//   fit: StackFit.expand,
//   children: [
//     LinearProgressIndicator(
//       value: progress,
//       backgroundColor: Colors.red,
//       color: Colors.white,
//     ),
//     Center(
//       child: Text('${(100 * progress).roundToDouble()}%',
//       style: TextStyle(color: Colors.white),),
//     )
//   ],
// ),     );
//     }else{
//       return SizedBox();
//     }
//   },);
}
