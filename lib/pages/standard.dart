import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'new.dart';

// class Standard extends StatefulWidget {
//   final List classess;
//   RecordPage({Key key, @required this.recordObject}) : super(key: key);
//
//   @override
//   _StandardState createState() => _StandardState();
// }

class Standard extends StatelessWidget {
  final List classess;
  final List selected;
  final Function handleChange;
  Standard({ required this.classess,required this.selected,required this.handleChange });

  Widget quoteTemplate(quote) {
    return Container(
        margin: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0),
        color: HexColor("#F6F6F6"),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Container(
                  // padding: const EdgeInsets.symmetric(
                  //     horizontal: 5, vertical: 8),
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: HexColor("#270F36"),
                  ),
                  child: Center(
                    child: Text(
                      quote['standard'],
                      style: TextStyle(
                        fontSize: 16.0,
                        color: HexColor("#FFFFFF"),
                      ),
                    ),
                  ),
                ),
              ]),
              SizedBox(height: 12.0),
              Container(
                height: 220,
                // decoration: BoxDecoration(
                  color: HexColor("#F6F6F6"),
                // ),
                child: Subject(
                    subjects:quote['subjects'],
                    selected:selected,
                    std:quote['standard'],
                    handleChange: handleChange
                ),
              ),
              SizedBox(height: 6.0),

            ],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        children: classess.map((cls){
          return quoteTemplate(cls);
        }).toList(),
    );
  }
}
