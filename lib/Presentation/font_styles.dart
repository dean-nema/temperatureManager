import 'package:flutter/material.dart';

class FontStyles {
  static final TextStyle appBarText =
      TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold);
  static final TextStyle main = TextStyle(
    color: Colors.black,
    fontSize: 15,
  );
    static final TextStyle iconText2 =
      TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white);
  static final TextStyle iconText =
      TextStyle(fontSize: 18, fontWeight: FontWeight.bold);

  static final mainTitles =
      TextStyle(fontSize: 23, fontWeight: FontWeight.bold, color: Colors.white);

  static final semiTitle = TextStyle(
    color: Colors.white,
    fontSize: 20, fontWeight: FontWeight.bold);

  static final otherTitles = TextStyle(
    color: Colors.white,
    fontSize: 30,
    fontStyle: FontStyle.italic,
    fontWeight: FontWeight.bold
  );

  static final mainIcons = TextStyle(
    color: Colors.black,
    fontSize: 20,
   
    fontWeight: FontWeight.bold
  );
}
