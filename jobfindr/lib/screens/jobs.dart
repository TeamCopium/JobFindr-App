// ignore_for_file: prefer_const_constructors


import 'package:flutter/material.dart';

class JobPage extends StatefulWidget {
  const JobPage({Key? key}) : super(key: key);

  @override
  State<JobPage> createState() => _JobPageState();
}

class _JobPageState extends State<JobPage> {
  final List<String> entries = <String>[
    'App Developer',
    'Backend Developer',
    'IOS Developer',
    'Front End Developer',
    'C++ Programmer'
  ];
   final List<String> skills = [
    'Kotlin,Java,Flutter/React',
    'Python,SQL,JavaScript',
    'Swift,Java',
    'Html,CSS,JavaScript',
    'C++/C'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
      body: ListView.separated(
        padding: EdgeInsets.all(8),
        itemCount: entries.length,
        itemBuilder: (BuildContext context,int index) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.2,
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 5,),
                Center(child: Text(' ${entries[index]}',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)),
                Divider(thickness: 2,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Skills Required',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Text(' ${skills[index]}',style: TextStyle(fontSize: 18),),
                ),
                Padding(
                  padding:  EdgeInsets.only(right: 10,top: 10),
                  child: Align(alignment: Alignment.bottomRight,
                    child: ElevatedButton(onPressed: (){}, child: Text('APPLY',style: TextStyle(fontSize: 20),),style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      primary: Color(0xff000000),
                    ),)),
                )
              ],
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) => Divider(),
      ),
    );
  }
}



 