import 'package:flutter/material.dart';
import 'package:flutter_app/pages/home_page.dart';
import 'package:hexcolor/hexcolor.dart';


class Profile extends StatefulWidget {

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Column(
              children: [
                Container(
                  child: Text('Teacher profile'),
                ),
                Container(
                  child:HomePage()
                )
              ],
            )
          ),
        ),
      ),
    );
  }
}
