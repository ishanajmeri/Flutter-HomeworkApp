import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Selected extends StatefulWidget {
  @override
  _SelectedState createState() => _SelectedState();
}

class _SelectedState extends State<Selected> {
  Map data = {};

  @override
  void initState() {
    super.initState();
  }

  List<dynamic> stds = [
    {'standard': "10th", 'subject': "Maths"},
    {'standard': "11th", 'subject': "Maths"},
    {'standard': "12th", 'subject': "Maths"},
    {'standard': "13th", 'subject': "Maths"},
  ];

  Widget quoteTemplate(quote) {
    return Container(
        margin: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
        color: HexColor("#F2F2F2"),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 2, vertical: 8),
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: HexColor("#270F36"),
                  ),
                  child: Center(
                    child: Text(
                      quote['std'],
                      style: TextStyle(
                        fontSize: 16.0,
                        color: HexColor("#FFFFFF"),
                      ),
                    ),
                  ),
                ),
              ]),
              SizedBox(width: 12.0),
              Container(
                decoration: BoxDecoration(
                  color: HexColor("#F2F2F2"),
                ),
                child: Text(
                  quote['sub'],
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: HexColor("#270F36"),
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context)?.settings.arguments as Map;
    List selected = data['selected'];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor("#F9F9F9"),
        elevation: 0,
      ),
      body: Container(
          child: Column(
        children: [
          Expanded(
            flex: 9,
            child: ListView(
              shrinkWrap: true,
              children: [
                Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/img.png"),
                          fit: BoxFit.fitHeight,
                          alignment: Alignment.centerRight),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(children: [
                        Expanded(
                          flex: 8,
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Welcome',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: HexColor("#270F36"))),
                                SizedBox(height: 8.0),
                                Text(
                                  'You teach these class & subjects',
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      color: HexColor("#270F36")),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(flex: 2, child: Container()),
                      ]),
                    )),
                Column(
                  children: selected.map((d) {
                    return quoteTemplate(d);
                  }).toList(),
                )
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              child: Row(children: [
                Expanded(
                  child: Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(double.infinity, 30),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          // double.infinity is the width and 30 is the height
                          primary: HexColor('#270F36'),
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 15),
                        ),
                        onPressed: () {
                          print('click thank you');
                        },
                        child: Text(
                          'Thank you',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: HexColor("#FFFFFF"),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ]),
            ),
          )
        ],
      )
          // ListView.builder(
          //     scrollDirection: Axis.vertical,
          //     itemCount: data['selected'].length,
          //     itemBuilder: (BuildContext context, int i) =>
          //         quoteTemplate(data['selected'][i])),
          ),
    );
  }
}
