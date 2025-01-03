import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:temp_manager/Domain/Model/temp_record.dart';
import 'package:temp_manager/Presentation/components/popUp.dart';
import 'package:temp_manager/Presentation/functions/functions.dart';
import 'colours.dart';
import 'font_styles.dart';
import 'recordCubit.dart';

class Recordings extends StatefulWidget {
  const Recordings({super.key});

  @override
  State<Recordings> createState() => _RecordingsState();
}

class _RecordingsState extends State<Recordings> {
  bool _datePicked = false;
  DateTime? _selectedDate;
  DateTimeRange? _selectedDateRange;
  List<TempRecord> rows = [];

  @override
  Widget build(BuildContext context) {
    //record cubit
    final recordCubit = context.read<RecordCubit>();

    final width = MediaQuery.of(context).size.width;

    final mainWidth = width - 60;

    final output = Directory
        .current; // Use getApplicationDocumentsDirectory() for persistent storage
    final file = File("${output.path}/Temperature Records.pdf");

    Future<void> selectDate(
        BuildContext context, List<TempRecord> records) async {
      final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: _selectedDate ?? DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100),
      );
      if (picked != null) {
        setState(() {
          _selectedDateRange = null;
          _selectedDate = picked;
          _datePicked = true;
          rows.clear();
          rows.addAll(dateFilter(records, _selectedDate));
        });
      }
    }

    Future<void> pickDateRange(
        BuildContext context, List<TempRecord> records) async {
      final DateTimeRange? picked = await showDateRangePicker(
        context: context,
        initialDateRange: _selectedDateRange ??
            DateTimeRange(
              start: DateTime.now(),
              end: DateTime.now().add(const Duration(days: 7)),
            ),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100),
      );

      if (picked != null) {
        setState(() {
          _selectedDateRange = picked;
          _datePicked = true;
          rows.clear();
          rows.addAll(dateRangeFilter(records, _selectedDateRange));
        });
      }
    }

    Widget doneSavingPDf = AlertDialog(
      title: const Text('Pdf Saved'),
      content: Text('Temperature Records.pdf is saved on the path: $file '),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Closes the pop-up
          },
          child: const Text('Close'),
        ),
      ],
    );

    Future<void> pdfButton() async {
      if (rows == null || rows.isEmpty) {}
      //loading screen

      showDialog(
          context: context,
          builder: (context) {
            return const Center(child: CircularProgressIndicator());
          });

      if (_selectedDate != null) {
        await generatePdf(rows, _selectedDate, null);
      } else if (_selectedDateRange != null) {
        await generatePdf(rows, null, _selectedDateRange);
      } else {
        DateTime? date = rows[0].date;
        await generatePdf(rows, date, null);
      }

      //remove loading screen
      Navigator.of(context).pop();

      showDialog(
          context: context,
          builder: (context) {
            return doneSavingPDf;
          });
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colours.textColor, // Change the color of the back button here
        ),
        title: Center(
            child: Text(
          "Temperature Records",
          style: FontStyles.appBarText,
        )),
        backgroundColor: Colours.appBarBackground,
      ),
      backgroundColor: Colours.mainBackground,
      body: BlocBuilder<RecordCubit, List<TempRecord>>(
          builder: (context, records) {
        return SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Center(
                  child: Container(
                    width: mainWidth,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              pickDateRange(context, records);
                            },
                            child: SizedBox(
                              width: 220,
                              height: 50,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Icon(Icons.calendar_month,
                                      color: Colours.tableIconColor, size: 40),
                                  Text(
                                    "Select Date Range",
                                    style: FontStyles.mainIcons,
                                  )
                                ],
                              ),
                            )),
                        ElevatedButton(
                            onPressed: () => selectDate(context, records),
                            child: SizedBox(
                              width: 160,
                              height: 50,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Icon(Icons.calendar_month,
                                      color: Colours.tableIconColor, size: 40),
                                  Text(
                                    "Select Date",
                                    style: FontStyles.mainIcons,
                                  )
                                ],
                              ),
                            )),
                        ElevatedButton(
                            onPressed: () {
                              if (rows == null || rows.isEmpty) {
                                rows.addAll(records);
                              }
                              pdfButton();
                            },
                            child: SizedBox(
                              width: 160,
                              height: 50,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Icon(Icons.picture_as_pdf_outlined,
                                      color: Colours.tableIconColor, size: 40),
                                  Text(
                                    "Save to PDF",
                                    style: FontStyles.mainIcons,
                                  )
                                ],
                              ),
                            ))
                      ],
                    ),
                  ),
                ),
              ),
              _datePicked
                  ? Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 10, left: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          (_selectedDateRange != null)
                              ? Text(
                                  "Showing from ${_selectedDateRange!.start.day}/${_selectedDateRange!.start.month}/${_selectedDateRange!.start.year} to ${_selectedDateRange!.end.day}/${_selectedDateRange!.end.month}/${_selectedDateRange!.end.year}",
                                  style: FontStyles.mainIcons,
                                )
                              : Text(
                                  "Showing for ${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}",
                                  style: FontStyles.mainIcons,
                                ),
                        ],
                      ),
                    )
                  : SizedBox(),
              Padding(
                padding: const EdgeInsets.only(top: 20.0, bottom: 20),
                child: Container(
                  width: width - 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22),
                      color: Colours.display),
                  child: Center(
                    child: Text(
                      "Fridge °C",
                      style: FontStyles.otherTitles,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: SizedBox(
                  width: mainWidth,
                  child: DataTable(
                      headingRowColor: WidgetStateProperty.resolveWith(
                        (states) => Colours
                            .secondBackground, // Set the background color for header row
                      ),
                      dataRowColor: WidgetStateProperty.resolveWith(
                        (states) => Colours
                            .thirdBackground, // Set the background color for data rows
                      ),
                      columns: [
                        DataColumn(
                            label: Text(
                          'Date',
                          style: FontStyles.mainTitles,
                        )),
                        DataColumn(
                            label: Text(
                          '8 AM',
                          style: FontStyles.mainTitles,
                        )),
                        DataColumn(
                            label: Text(
                          '5 PM',
                          style: FontStyles.mainTitles,
                        )),
                        DataColumn(
                            label: Text(
                          '10 PM',
                          style: FontStyles.mainTitles,
                        )),
                      ],
                      rows: [
                        for (var record in (_datePicked ? rows : records))
                          DataRow(
                            cells: [
                              // First cell is the date
                              DataCell(Container(
                                width: 180,
                                child: Row(
                                  children: [
                                    Expanded(
                                        child: TextButton(
                                      onPressed: () async {
                                        await showDialog(
                                            context: context,
                                            builder: (context) {
                                              return Popup(
                                                recordCubit: recordCubit,
                                                obj: record,
                                                fridge: true,
                                              );
                                            });
                                      },
                                      child: Icon(Icons.edit,
                                          size: 15,
                                          color: Colours.secondBackground),
                                    )),
                                    Expanded(
                                      flex: 4,
                                      child: Text(
                                          '${record.date!.day}/${record.date!.month}/${record.date!.year}',
                                          style: FontStyles.iconText),
                                    ),
                                  ],
                                ),
                              )),
                              // Then the fridge temperature data for each time slot
                              DataCell(Text(
                                record.fridgeTemp[0][1].toString(),
                                style: FontStyles.iconText,
                              )),
                              DataCell(Text(record.fridgeTemp[1][1].toString(),
                                  style: FontStyles.iconText)),
                              DataCell(Text(record.fridgeTemp[2][1].toString(),
                                  style: FontStyles.iconText)),
                              // Then the room temperature data for each time slot
                            ],
                          ),
                      ]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0, bottom: 20),
                child: Container(
                  width: width - 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22),
                      color: Colours.display),
                  child: Center(
                    child: Text(
                      "Room °C",
                      style: FontStyles.otherTitles,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: SizedBox(
                  width: mainWidth,
                  child: DataTable(
                      headingRowColor: WidgetStateProperty.resolveWith(
                        (states) => Colours
                            .secondBackground, // Set the background color for header row
                      ),
                      dataRowColor: WidgetStateProperty.resolveWith(
                        (states) => Colours
                            .thirdBackground, // Set the background color for data rows
                      ),
                      columns: [
                        DataColumn(
                            label: Text(
                          'Date',
                          style: FontStyles.mainTitles,
                        )),
                        DataColumn(
                            label: Text(
                          '8 AM',
                          style: FontStyles.mainTitles,
                        )),
                        DataColumn(
                            label: Text(
                          '5 PM',
                          style: FontStyles.mainTitles,
                        )),
                        DataColumn(
                            label: Text(
                          '10 PM',
                          style: FontStyles.mainTitles,
                        )),
                      ],
                      rows: [
                        for (var record in (_datePicked ? rows : records))
                          DataRow(
                            cells: [
                              // First cell is the date
                              DataCell(Container(
                                width: 180,
                                child: Row(
                                  children: [
                                    Expanded(
                                        child: TextButton(
                                      onPressed: () async {
                                        await showDialog(
                                            context: context,
                                            builder: (context) {
                                              return Popup(
                                                recordCubit: recordCubit,
                                                obj: record,
                                                fridge: false,
                                              );
                                            });
                                      },
                                      child: Icon(Icons.edit,
                                          size: 15,
                                          color: Colours.secondBackground),
                                    )),
                                    Expanded(
                                      flex: 4,
                                      child: Text(
                                          '${record.date!.day}/${record.date!.month}/${record.date!.year}',
                                          style: FontStyles.iconText),
                                    ),
                                  ],
                                ),
                              )),
                              // Then the fridge temperature data for each time slot
                              DataCell(Text(
                                record.roomTemp[0][1].toString(),
                                style: FontStyles.iconText,
                              )),
                              DataCell(Text(record.roomTemp[1][1].toString(),
                                  style: FontStyles.iconText)),
                              DataCell(Text(record.roomTemp[2][1].toString(),
                                  style: FontStyles.iconText)),
                              // Then the room temperature data for each time slot
                            ],
                          ),
                      ]),
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
