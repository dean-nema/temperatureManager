// ignore_for_file: prefer_const_constructors_in_immutables, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:temp_manager/Domain/Model/temp_record.dart';
import 'package:temp_manager/Presentation/colours.dart';
import 'package:temp_manager/Presentation/recordCubit.dart';

import '../font_styles.dart';

class RowDisplay extends StatefulWidget {
  final title;
  RowDisplay({
    super.key,
    this.title,
  });

  @override
  State<RowDisplay> createState() => _RowDisplayState();
}

class _RowDisplayState extends State<RowDisplay> {
  @override
  Widget build(BuildContext context) {
    //record cubit
    final recordCubit = context.read<RecordCubit>();

    //used for 8AM and the text controller thing
    final double time = 100;
    final double textFieldWidth = 50;
    final double mainWidth = MediaQuery.of(context).size.width - 50;
    final mobile = MediaQuery.sizeOf(context).width < 900;

    var morningController = TextEditingController();
    var afternoonController = TextEditingController();
    var nightController = TextEditingController();
    bool room = widget.title == "Room";
    bool morningDataIsAvailable = false;
    bool afternoonDataIsAvailable = false;
    bool nightDataIsAvailable = false;

    void changeMorn(TempRecord record) {
      setState(() {
        if (room) {
          record.roomTemp[0][1] = null;
        } else {
          record.fridgeTemp[0][1] = null;
        }
      });
    }

    void changeAfternoon(TempRecord record) {
      setState(() {
         if (room) {
          record.roomTemp[1][1] = null;
        } else {
          record.fridgeTemp[1][1] = null;
        }
      });
    }

    void changeNight(TempRecord record) {
      setState(() {
         if (room) {
          record.roomTemp[2][1] = null;
        } else {
          record.fridgeTemp[2][1] = null;
        }
      });
    }

    Future<void> save(TempRecord record) async {
      String morn = morningController.text;
      String afternoon = afternoonController.text;
      String night = nightController.text;

      if (morn != "") {
        num? number = num.tryParse(morn);
        if (number != null) {
          double morningTemp = number.toDouble();
          if (room) {
            record.roomTemp[0][1] = morningTemp;
          } else {
            record.fridgeTemp[0][1] = morningTemp;
          }
          print("Reached: ${record.roomTemp[0][1]}, $room, $morningTemp");
          print("Record: ${record.roomTemp}");
          await recordCubit.updateRecord(record);
        }
      }

      if (afternoon != "") {
        num? number = num.tryParse(afternoon);
        if (number != null) {
          double afternoonTemp = number.toDouble();
          if (room) {
            record.roomTemp[1][1] = afternoonTemp;
          } else {
            record.fridgeTemp[1][1] = afternoonTemp;
          }
          await recordCubit.updateRecord(record);
        }
      }

      if (night != "") {
        num? number = num.tryParse(night);
        if (number != null) {
          double nightTemp = number.toDouble();
          if (room) {
            record.roomTemp[2][1] = nightTemp;
          } else {
            record.fridgeTemp[2][1] = nightTemp;
          }
          await recordCubit.updateRecord(record);
        }
      }
    }

    //This is all to find the record for Today
    final now = DateTime.now();
    final todayDate = DateTime(now.year, now.month, now.day);
    bool foundToday = true;
    late TempRecord record;

    void load() async {
      await recordCubit.loadRecords();
    }

    return BlocBuilder<RecordCubit, List<TempRecord>>(
        builder: (context, records) {
      for (var element in records) {
        print(element.date!.isAtSameMomentAs(todayDate));
        if (element.date!.isAtSameMomentAs(todayDate)) {
          record = element;
          foundToday = false;
        } else {}
      }

      if (foundToday) {
        print("Reached ⭕⭕⭕⭕");
        record = TempRecord();
        //recordCubit.addRecord(record);
      }

      //checking if the today object has all data or not
      double? morningData = room
          ? (record.roomTemp[0][1] as num?)?.toDouble()
          : (record.fridgeTemp[0][1] as num?)?.toDouble();
      print(records);
      double? afternoonData = room
          ? (record.roomTemp[1][1] as num?)?.toDouble()
          : (record.fridgeTemp[1][1] as num?)?.toDouble();
      print(records);
      double? nightData = room
          ? (record.roomTemp[2][1] as num?)?.toDouble()
          : (record.fridgeTemp[2][1] as num?)?.toDouble();
      print(records);
      if (morningData != null) {
        morningDataIsAvailable = true;
      }
      if (afternoonData != null) {
        afternoonDataIsAvailable = true;
      }
      if (nightData != null) {
        nightDataIsAvailable = true;
      }

      print(records);

      return Center(
        child: Container(
          width: mainWidth,
          height: 280,
          decoration: BoxDecoration(
            color: Colours.secondBackground,
            borderRadius: BorderRadius.circular(22),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0, left: 40),
                child: Center(
                  child: Text(
                    "${widget.title} °C",
                    style: FontStyles.mainTitles,
                  ),
                ),
              ),
              Container(
                width: mainWidth,
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 30,
                    left: 40,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Center(
                            child: Container(
                              width: time,
                              child: Center(
                                  child: Text(
                                "8 AM",
                                style: FontStyles.semiTitle,
                              )),
                            ),
                          ),
                          Center(
                            child: Container(
                              width: textFieldWidth,
                              child: Center(
                                child: !morningDataIsAvailable
                                    ? TextField(
                                        style: TextStyle(
                                          color: Colours
                                              .textColor, // Change the color here
                                        ),
                                        controller: morningController,
                                        textAlign: TextAlign.center,
                                        cursorColor: Colours.textColor,
                                      )
                                    : Padding(
                                        padding:
                                            const EdgeInsets.only(top: 20.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              // color: Colours.mainBackground
                                              ),
                                          child: Text(
                                            "${morningData!}",
                                            style: FontStyles.semiTitle,
                                          ),
                                        ),
                                      ),
                              ),
                            ),
                          ),
                          morningDataIsAvailable
                              ? Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: TextButton(
                                      onPressed: () {
                                        changeMorn(record);
                                      },
                                      child: Icon(
                                        Icons.edit,
                                        color: Colours.textColor,
                                      )),
                                )
                              : const SizedBox(),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Center(
                            child: Container(
                              width: time,
                              child: Center(
                                  child: Text(
                                "5 PM",
                                style: FontStyles.semiTitle,
                              )),
                            ),
                          ),
                          Center(
                            child: Container(
                              width: textFieldWidth,
                              child: Center(
                                child: !afternoonDataIsAvailable
                                    ? TextField(
                                        controller: afternoonController,
                                        style: TextStyle(
                                          color: Colours
                                              .textColor, // Change the color here
                                        ),
                                        textAlign: TextAlign.center,
                                        cursorColor: Colours.textColor,
                                      )
                                    : Padding(
                                        padding:
                                            const EdgeInsets.only(top: 20.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              // color: Colours.mainBackground
                                              ),
                                          child: Text(
                                            "${afternoonData!}",
                                            style: FontStyles.semiTitle,
                                          ),
                                        ),
                                      ),
                              ),
                            ),
                          ),
                          afternoonDataIsAvailable
                              ? Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: TextButton(
                                      onPressed: () {
                                        changeAfternoon(record);
                                      },
                                      child: Icon(
                                        Icons.edit,
                                        color: Colours.textColor,
                                      )),
                                )
                              : const SizedBox(),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Center(
                            child: Container(
                              width: time,
                              child: Center(
                                  child: Text(
                                "10 PM",
                                style: FontStyles.semiTitle,
                              )),
                            ),
                          ),
                          Center(
                            child: Container(
                              width: textFieldWidth,
                              child: Center(
                                child: !nightDataIsAvailable
                                    ? TextField(
                                        style: TextStyle(
                                          color: Colours
                                              .textColor, // Change the color here
                                        ),
                                        cursorColor: Colours.textColor,
                                        controller: nightController,
                                        textAlign: TextAlign.center,
                                      )
                                    : Padding(
                                        padding:
                                            const EdgeInsets.only(top: 20.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              // color: Colours.mainBackground
                                              ),
                                          child: Text(
                                            "${nightData}",
                                            style: FontStyles.semiTitle,
                                          ),
                                        ),
                                      ),
                              ),
                            ),
                          ),
                          nightDataIsAvailable
                              ? Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: TextButton(
                                      onPressed: () {
                                        changeNight(record);
                                      },
                                      child: Icon(
                                        Icons.edit,
                                        color: Colours.textColor,
                                      )),
                                )
                              : const SizedBox(),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0, left: 50),
                child: SizedBox(
                  width: mainWidth * 0.15,
                  height: 40,
                  child: ElevatedButton(
                      onPressed: () {
                        save(record);
                      },
                      child: mobile
                          ? Icon(
                              Icons.check_box,
                              color: Colours.tableIconColor,
                            )
                          : Text(
                              "Save",
                              style: FontStyles.iconText,
                            )),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
