import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Subject extends StatelessWidget {
  final Function handleChange;
  final List subjects;
  final List selected;
  final String std;

  Subject(
      {required this.subjects,
      required this.selected,
      required this.std,
      required this.handleChange});

  Widget subjectCard(subject) {
    Iterable isSubject = selected.where((item) {
      return item['sub'] == subject['subject_name'] && item['std'] == std;
    }).toList();

    return Card(
        margin: const EdgeInsets.fromLTRB(0, 0, 16.0, 0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), // if you need this
        ),
        child: Container(
            width: 170.0,
            child: Column(children: <Widget>[
              Container(
                child: Image(
                  image: NetworkImage(subject['subject_image']),
                  height: 140,
                ),
              ),
              SizedBox(height: 10.0),
              Row(
                children: [
                  Expanded(
                    flex:3,
                    child: Checkbox(
                        value: isSubject.length > 0 ? true : false,
                        activeColor: HexColor('#270F36'),
                        onChanged: (newValue) {
                          if (newValue == true) {
                            handleChange('add', std, subject['subject_name']);
                          } else
                            handleChange('remove', std, subject['subject_name']);
                        }),
                  ),
                  Expanded(
                    flex:7,
                    child: Text(
                      subject['subject_name'],
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: HexColor('#270F36'),
                      ),
                    ),
                  ),
                ],
              ),
            ])));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: HexColor("#F6F6F6"),
        ),
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: subjects.length,
            itemBuilder: (BuildContext context, int i) =>
                subjectCard(subjects[i])),
      ),
    );
  }
}
