// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:temp_manager/Domain/Model/temp_record.dart';
import 'package:temp_manager/Presentation/colours.dart';

import 'package:temp_manager/Presentation/font_styles.dart';
import 'package:temp_manager/Presentation/recordCubit.dart';

class Popup extends StatelessWidget {
 final RecordCubit recordCubit;
 final TempRecord obj;
 final bool fridge;
 const Popup(
      {super.key,
      required this.obj,
      required this.recordCubit,
      required this.fridge});

  @override
  Widget build(BuildContext context) {
    //variables
    double? morn;
    double? afternoon;
    double? night;
    if (fridge) {
      morn = (obj.fridgeTemp[0][1] as num?)?.toDouble();
      afternoon = (obj.fridgeTemp[1][1] as num?)?.toDouble();
      night = (obj.fridgeTemp[2][1] as num?)?.toDouble();
    } else {
      morn = (obj.roomTemp[0][1] as num?)?.toDouble();
      afternoon = (obj.roomTemp[1][1] as num?)?.toDouble();
      night = (obj.roomTemp[2][1] as num?)?.toDouble();
    }
    var mornController = TextEditingController(text: morn.toString());
    var afternoonController = TextEditingController(text: afternoon.toString());
    var nightController = TextEditingController(text: night.toString());

    DateTime dateTime = obj.date!;
    String date = "${dateTime.day}/${dateTime.month}/${dateTime.year}";

    final width = MediaQuery.of(context).size.width;

    Future<void> save(TempRecord record) async {
      if (mornController.text != "" &&
          afternoonController.text != "" &&
          nightController.text != "") {
        num? numberMorn = num.tryParse(mornController.text);
        num? numberAfter = num.tryParse(afternoonController.text);
        num? numberNight = num.tryParse(nightController.text);
        if (numberMorn != null && numberAfter != null && numberNight != null) {
          double? numMorn = numberMorn.toDouble();
          double? numAfter = numberAfter.toDouble();
          double? numNight = numberNight.toDouble();
          if (fridge) {
            //morning
            record.fridgeTemp[0][1] = numMorn;
            //afternoon
            record.fridgeTemp[1][1] = numAfter;
            //night
            record.fridgeTemp[2][1] = numNight;
           await recordCubit.updateRecord(record);
          } else {
            //morning
            record.roomTemp[0][1] = numMorn;
            //afternoon
            record.roomTemp[1][1] = numAfter;
            //night
            record.roomTemp[2][1] = numNight;
           await  recordCubit.updateRecord(record);
          }
        }
      }
    }

    return AlertDialog(
      backgroundColor: Colours.fourthBackground,
      title: Center(
          child: Text(
        'Change fridge Temperature for $date',
        style: FontStyles.mainTitles,
      )),
      content: Container(
        width: width * 0.2,
        height: 250,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22), color: Colours.mainDark2),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "8AM : ",
                      style: FontStyles.semiTitle,
                    ),
                    Container(
                        width: 40,
                        child: TextField(
                          controller: mornController,
                          style: FontStyles.semiTitle,
                          textAlign: TextAlign.center,
                          cursorColor: Colours.textColor,
                        )),
                  ],
                ),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "5 PM : ",
                      style: FontStyles.semiTitle,
                    ),
                    Container(
                        width: 40,
                        child: TextField(
                          controller: afternoonController,
                          style: FontStyles.semiTitle,
                          textAlign: TextAlign.center,
                          cursorColor: Colours.textColor,
                        )),
                  ],
                ),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      " 10 PM : ",
                      style: FontStyles.semiTitle,
                    ),
                    Container(
                        width: 40,
                        child: TextField(
                          controller: nightController,
                          style: FontStyles.semiTitle,
                          textAlign: TextAlign.center,
                          cursorColor: Colours.textColor,
                        )),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      actions: [
        ElevatedButton(
          child: Text(
            'Cancel',
            style: FontStyles.iconText,
          ),
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog
          },
        ),
        ElevatedButton(
          child: Text(
            'Save',
            style: FontStyles.iconText,
          ),
          onPressed: () {
            save(obj);

            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
