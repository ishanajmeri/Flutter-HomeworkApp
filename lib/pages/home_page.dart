import 'package:flutter/material.dart';
import 'package:flutter_app/pages/standard.dart';
import 'package:hexcolor/hexcolor.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List selected = [];

  void _incrementCounter() {
    setState(() {
      Navigator.pushNamed(context, '/selected',
          arguments: {"selected": selected});
    });
  }

  void handleChange(fuc, std, sub) {
    if (fuc == 'add') {
      setState(() {
        selected.add({"std": std, "sub": sub});
      });
    } else {
      setState(() {
        selected
            .removeWhere((item) => item['std'] == std && item['sub'] == sub);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //     backgroundColor: HexColor("#F9F9F9"),
        //     elevation: 0,
        //     leading: Builder(
        //       builder: (BuildContext context) {
        //         if (selected.length > 0) {
        //           return IconButton(
        //             icon: Icon(
        //               Icons.chevron_left_outlined,
        //               color: HexColor('#270F36'),
        //               size: 35,
        //             ),
        //             onPressed: () {
        //               setState(() {
        //                 selected.clear();
        //               });
        //             },
        //           );
        //         } else
        //           return Container();
        //       },
        //     ),
        //     actions: [
        //       Icon(Icons.circle,
        //           color: selected.length != 0
        //               ? HexColor('#F3F3F3')
        //               : HexColor('#270F36'),
        //           size: 10),
        //       Padding(
        //         padding:
        //             const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
        //         child: Icon(Icons.circle,
        //             color: selected.length == 0
        //                 ? HexColor('#F3F3F3')
        //                 : HexColor('#270F36'),
        //             size: 10),
        //       ),
        //     ]),
        body: SafeArea(
      child: Column(children: [
        Expanded(
          flex: 9,
          child: ListView(
            shrinkWrap: true,
            children: [
              Container(
                height: 48.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        child: selected.length > 0
                            ? IconButton(
                                icon: Icon(
                                  Icons.chevron_left_outlined,
                                  color: HexColor('#270F36'),
                                  size: 35,
                                ),
                                onPressed: () {
                                  setState(() {
                                    selected.clear();
                                  });
                                },
                              )
                            : Container()),
                    Container(
                      child: Row(
                        children: [
                          Icon(Icons.circle,
                              color: selected.length != 0
                                  ? HexColor('#F3F3F3')
                                  : HexColor('#270F36'),
                              size: 10),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 0, horizontal: 20),
                            child: Icon(Icons.circle,
                                color: selected.length == 0
                                    ? HexColor('#F3F3F3')
                                    : HexColor('#270F36'),
                                size: 10),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
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
                              Text('Teacher profile',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: HexColor("#270F36"))),
                              SizedBox(height: 8.0),
                              Text(
                                'Which grades & subjects you teach',
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
              Container(
                child: Standard(
                    classess: classess,
                    selected: selected,
                    handleChange: handleChange),
              ),
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
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      ),
                      onPressed: selected.length > 0 ? _incrementCounter : null,
                      child: Text(
                        'continue',
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
      ]),
    ));
  }

  List classess = [
    {
      "standard": "10th",
      "subjects": [
        {
          "subject_name": "Maths",
          "subject_image":
              "https://the-hw-app.s3.ap-south-1.amazonaws.com/android/onboarding/subjects/10th/maths.png"
        },
        {
          "subject_name": "Science",
          "subject_image":
              "https://the-hw-app.s3.ap-south-1.amazonaws.com/android/onboarding/subjects/10th/science.png"
        },
        {
          "subject_name": "English",
          "subject_image":
              "https://the-hw-app.s3.ap-south-1.amazonaws.com/android/onboarding/subjects/10th/english.png"
        },
        {
          "subject_name": "Social Studies",
          "subject_image":
              "https://the-hw-app.s3.ap-south-1.amazonaws.com/android/onboarding/subjects/10th/social-science.png"
        },
        {
          "subject_name": "Hindi",
          "subject_image":
              "https://the-hw-app.s3.ap-south-1.amazonaws.com/android/onboarding/subjects/10th/hindi.png"
        }
      ]
    },
    {
      "standard": "9th",
      "subjects": [
        {
          "subject_name": "Maths",
          "subject_image":
              "https://the-hw-app.s3.ap-south-1.amazonaws.com/android/onboarding/subjects/9th/maths.png"
        },
        {
          "subject_name": "Science",
          "subject_image":
              "https://the-hw-app.s3.ap-south-1.amazonaws.com/android/onboarding/subjects/9th/science.png"
        },
        {
          "subject_name": "English",
          "subject_image":
              "https://the-hw-app.s3.ap-south-1.amazonaws.com/android/onboarding/subjects/9th/english.png"
        },
        {
          "subject_name": "Social Studies",
          "subject_image":
              "https://the-hw-app.s3.ap-south-1.amazonaws.com/android/onboarding/subjects/9th/social-science.png"
        },
        {
          "subject_name": "Hindi",
          "subject_image":
              "https://the-hw-app.s3.ap-south-1.amazonaws.com/android/onboarding/subjects/9th/hindi.png"
        }
      ]
    },
    {
      "standard": "8th",
      "subjects": [
        {
          "subject_name": "Maths",
          "subject_image":
              "https://the-hw-app.s3.ap-south-1.amazonaws.com/android/onboarding/subjects/8th/maths.png"
        },
        {
          "subject_name": "Science",
          "subject_image":
              "https://the-hw-app.s3.ap-south-1.amazonaws.com/android/onboarding/subjects/8th/science.png"
        },
        {
          "subject_name": "English",
          "subject_image":
              "https://the-hw-app.s3.ap-south-1.amazonaws.com/android/onboarding/subjects/8th/english.png"
        },
        {
          "subject_name": "Social Studies",
          "subject_image":
              "https://the-hw-app.s3.ap-south-1.amazonaws.com/android/onboarding/subjects/8th/social-science.png"
        },
        {
          "subject_name": "Hindi",
          "subject_image":
              "https://the-hw-app.s3.ap-south-1.amazonaws.com/android/onboarding/subjects/8th/hindi.png"
        }
      ]
    },
    {
      "standard": "7th",
      "subjects": [
        {
          "subject_name": "Maths",
          "subject_image":
              "https://the-hw-app.s3.ap-south-1.amazonaws.com/android/onboarding/subjects/7th/maths.png"
        },
        {
          "subject_name": "Science",
          "subject_image":
              "https://the-hw-app.s3.ap-south-1.amazonaws.com/android/onboarding/subjects/7th/science.png"
        },
        {
          "subject_name": "English",
          "subject_image":
              "https://the-hw-app.s3.ap-south-1.amazonaws.com/android/onboarding/subjects/7th/english.png"
        },
        {
          "subject_name": "Social Studies",
          "subject_image":
              "https://the-hw-app.s3.ap-south-1.amazonaws.com/android/onboarding/subjects/7th/social-science.png"
        },
        {
          "subject_name": "Hindi",
          "subject_image":
              "https://the-hw-app.s3.ap-south-1.amazonaws.com/android/onboarding/subjects/7th/hindi.png"
        }
      ]
    },
    {
      "standard": "6th",
      "subjects": [
        {
          "subject_name": "Maths",
          "subject_image":
              "https://the-hw-app.s3.ap-south-1.amazonaws.com/android/onboarding/subjects/6th/maths.png"
        },
        {
          "subject_name": "Science",
          "subject_image":
              "https://the-hw-app.s3.ap-south-1.amazonaws.com/android/onboarding/subjects/6th/science.png"
        },
        {
          "subject_name": "English",
          "subject_image":
              "https://the-hw-app.s3.ap-south-1.amazonaws.com/android/onboarding/subjects/6th/english.png"
        },
        {
          "subject_name": "Social Studies",
          "subject_image":
              "https://the-hw-app.s3.ap-south-1.amazonaws.com/android/onboarding/subjects/6th/social-science.png"
        },
        {
          "subject_name": "Hindi",
          "subject_image":
              "https://the-hw-app.s3.ap-south-1.amazonaws.com/android/onboarding/subjects/6th/hindi.png"
        }
      ]
    },
    {
      "standard": "5th",
      "subjects": [
        {
          "subject_name": "Maths",
          "subject_image":
              "https://the-hw-app.s3.ap-south-1.amazonaws.com/android/onboarding/subjects/5th/maths.png"
        },
        {
          "subject_name": "Science",
          "subject_image":
              "https://the-hw-app.s3.ap-south-1.amazonaws.com/android/onboarding/subjects/5th/science.png"
        },
        {
          "subject_name": "English",
          "subject_image":
              "https://the-hw-app.s3.ap-south-1.amazonaws.com/android/onboarding/subjects/5th/english.png"
        },
        {
          "subject_name": "Social Studies",
          "subject_image":
              "https://the-hw-app.s3.ap-south-1.amazonaws.com/android/onboarding/subjects/5th/social-science.png"
        },
        {
          "subject_name": "Hindi",
          "subject_image":
              "https://the-hw-app.s3.ap-south-1.amazonaws.com/android/onboarding/subjects/5th/hindi.png"
        }
      ]
    },
    {
      "standard": "4th",
      "subjects": [
        {
          "subject_name": "Maths",
          "subject_image":
              "https://the-hw-app.s3.ap-south-1.amazonaws.com/android/onboarding/subjects/4th/maths.png"
        },
        {
          "subject_name": "Science",
          "subject_image":
              "https://the-hw-app.s3.ap-south-1.amazonaws.com/android/onboarding/subjects/4th/science.png"
        },
        {
          "subject_name": "English",
          "subject_image":
              "https://the-hw-app.s3.ap-south-1.amazonaws.com/android/onboarding/subjects/4th/english.png"
        },
        {
          "subject_name": "Social Studies",
          "subject_image":
              "https://the-hw-app.s3.ap-south-1.amazonaws.com/android/onboarding/subjects/4th/social-science.png"
        },
        {
          "subject_name": "Hindi",
          "subject_image":
              "https://the-hw-app.s3.ap-south-1.amazonaws.com/android/onboarding/subjects/4th/hindi.png"
        }
      ]
    },
    {
      "standard": "3rd",
      "subjects": [
        {
          "subject_name": "Maths",
          "subject_image":
              "https://the-hw-app.s3.ap-south-1.amazonaws.com/android/onboarding/subjects/3rd/maths.png"
        },
        {
          "subject_name": "Environmental Studies",
          "subject_image":
              "https://the-hw-app.s3.ap-south-1.amazonaws.com/android/onboarding/subjects/3rd/evs.png"
        },
        {
          "subject_name": "English",
          "subject_image":
              "https://the-hw-app.s3.ap-south-1.amazonaws.com/android/onboarding/subjects/3rd/english.png"
        },
        {
          "subject_name": "Social Studies",
          "subject_image":
              "https://the-hw-app.s3.ap-south-1.amazonaws.com/android/onboarding/subjects/3rd/social-science.png"
        },
        {
          "subject_name": "Hindi",
          "subject_image":
              "https://the-hw-app.s3.ap-south-1.amazonaws.com/android/onboarding/subjects/3rd/hindi.png"
        }
      ]
    },
    {
      "standard": "2nd",
      "subjects": [
        {
          "subject_name": "Maths",
          "subject_image":
              "https://the-hw-app.s3.ap-south-1.amazonaws.com/android/onboarding/subjects/2nd/maths.png"
        },
        {
          "subject_name": "Environmental Studies",
          "subject_image":
              "https://the-hw-app.s3.ap-south-1.amazonaws.com/android/onboarding/subjects/2nd/evs.png"
        },
        {
          "subject_name": "English",
          "subject_image":
              "https://the-hw-app.s3.ap-south-1.amazonaws.com/android/onboarding/subjects/2nd/english.png"
        },
        {
          "subject_name": "Hindi",
          "subject_image":
              "https://the-hw-app.s3.ap-south-1.amazonaws.com/android/onboarding/subjects/2nd/hindi.png"
        }
      ]
    },
    {
      "standard": "1st",
      "subjects": [
        {
          "subject_name": "Maths",
          "subject_image":
              "https://the-hw-app.s3.ap-south-1.amazonaws.com/android/onboarding/subjects/1st/maths.png"
        },
        {
          "subject_name": "Environmental Studies",
          "subject_image":
              "https://the-hw-app.s3.ap-south-1.amazonaws.com/android/onboarding/subjects/1st/evs.png"
        },
        {
          "subject_name": "English",
          "subject_image":
              "https://the-hw-app.s3.ap-south-1.amazonaws.com/android/onboarding/subjects/1st/english.png"
        },
        {
          "subject_name": "Hindi",
          "subject_image":
              "https://the-hw-app.s3.ap-south-1.amazonaws.com/android/onboarding/subjects/1st/hindi.png"
        }
      ]
    },
    {
      "standard": "11th",
      "subjects": [
        {
          "subject_name": "Maths",
          "subject_image":
              "https://the-hw-app.s3.ap-south-1.amazonaws.com/android/onboarding/subjects/11th/maths.png"
        },
        {
          "subject_name": "Physics",
          "subject_image":
              "https://the-hw-app.s3.ap-south-1.amazonaws.com/android/onboarding/subjects/11th/physics.png"
        },
        {
          "subject_name": "Chemistry",
          "subject_image":
              "https://the-hw-app.s3.ap-south-1.amazonaws.com/android/onboarding/subjects/11th/chemistry.png"
        },
        {
          "subject_name": "Biology",
          "subject_image":
              "https://the-hw-app.s3.ap-south-1.amazonaws.com/android/onboarding/subjects/11th/biology.png"
        },
        {
          "subject_name": "English",
          "subject_image":
              "https://the-hw-app.s3.ap-south-1.amazonaws.com/android/onboarding/subjects/11th/english.png"
        },
        {
          "subject_name": "Social Studies",
          "subject_image":
              "https://the-hw-app.s3.ap-south-1.amazonaws.com/android/onboarding/subjects/11th/social-science.png"
        }
      ]
    },
    {
      "standard": "12th",
      "subjects": [
        {
          "subject_name": "Maths",
          "subject_image":
              "https://the-hw-app.s3.ap-south-1.amazonaws.com/android/onboarding/subjects/12th/maths.png"
        },
        {
          "subject_name": "Physics",
          "subject_image":
              "https://the-hw-app.s3.ap-south-1.amazonaws.com/android/onboarding/subjects/12th/physics.png"
        },
        {
          "subject_name": "Chemistry",
          "subject_image":
              "https://the-hw-app.s3.ap-south-1.amazonaws.com/android/onboarding/subjects/12th/chemistry.png"
        },
        {
          "subject_name": "Biology",
          "subject_image":
              "https://the-hw-app.s3.ap-south-1.amazonaws.com/android/onboarding/subjects/12th/biology.png"
        },
        {
          "subject_name": "English",
          "subject_image":
              "https://the-hw-app.s3.ap-south-1.amazonaws.com/android/onboarding/subjects/12th/english.png"
        },
        {
          "subject_name": "Social Studies",
          "subject_image":
              "https://the-hw-app.s3.ap-south-1.amazonaws.com/android/onboarding/subjects/12th/social-science.png"
        }
      ]
    }
  ];
}
