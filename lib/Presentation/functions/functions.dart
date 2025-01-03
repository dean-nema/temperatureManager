import 'dart:io';
import 'package:pdf/widgets.dart' as pw;
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:temp_manager/Domain/Model/temp_record.dart';


//Save Data 


//Date Filtering
List<TempRecord> dateFilter(List<TempRecord> data, DateTime? date) {
  List<TempRecord> filtered = [];
  for (var record in data) {
    if (record.date!.isAtSameMomentAs(date!)) {
      filtered.add(record);
    }
  }

  return filtered;
}

List<TempRecord> dateRangeFilter(List<TempRecord> data, DateTimeRange? dates) {
  List<TempRecord> filtered = [];
  for (var record in data) {
    if (record.date!.isAtSameMomentAs(dates!.start) ||
        record.date!.isAtSameMomentAs(dates.end)) {
      filtered.add(record);
    } else if (record.date!.isAfter(dates.start) &&
        record.date!.isBefore(dates.end)) {
      filtered.add(record);
    }
  }

  return filtered;
}

//creating pdf
Future<void> generatePdf(List<TempRecord>? database, DateTime? singleDate,
    DateTimeRange? dateRange) async {
  final bool range = dateRange != null && singleDate == null;

  String dateStr = range
      ? "from ${dateRange.start.day}/${dateRange.start.month}/${dateRange.start.year} to ${dateRange.end.day}/${dateRange.end.month}/${dateRange.end.year}"
      : "for ${singleDate!.day}/${singleDate.month}/${singleDate.year} ";
  // Create a PDF document
  final pdf = pw.Document();
  List<List<dynamic>> fridge = [];
  List<List<dynamic>> room = [];

  for (var record in database!) {
    String recordDate =
        "${record.date!.day}/${record.date!.month}/${record.date!.year}";
    String mornFridge = record.fridgeTemp[0][1].toString();
    String afternoonFridge = record.fridgeTemp[1][1].toString();
    String nightFridge = record.fridgeTemp[2][1].toString();
    String mornRoom = record.roomTemp[0][1].toString();
    String afternoonRoom = record.roomTemp[1][1].toString();
    String nightRoom = record.roomTemp[2][1].toString();
    fridge.add([recordDate, mornFridge, afternoonFridge, nightFridge]);
    room.add([recordDate, mornRoom, afternoonRoom, nightRoom]);
  }

  // Define table headers
  final headers = ['Date', '8 AM', '5 PM', '10 PM'];

  // Add a page with a table
  pdf.addPage(
    pw.MultiPage(
      build: (context) {
        return [
          pw.Text(
            'Temperature Recordings $dateStr',
            style: pw.TextStyle(fontSize: 20, fontWeight: pw.FontWeight.bold),
          ),
          pw.SizedBox(height: 20),
          pw.Text(
            'Fridge Temperature',
            style: pw.TextStyle(fontSize: 20, fontWeight: pw.FontWeight.bold),
          ),
          pw.SizedBox(height: 20),
          pw.TableHelper.fromTextArray(
            headers: headers,
            data: fridge,
            headerStyle: pw.TextStyle(
              fontSize: 12,
              fontWeight: pw.FontWeight.bold,
            ),
            headerDecoration: pw.BoxDecoration(color: PdfColors.grey300),
            cellStyle: pw.TextStyle(fontSize: 10),
            cellAlignment: pw.Alignment.center,
            cellHeight: 25, // Specify the height of each row
            border: pw.TableBorder.all(color: PdfColors.black, width: 1),
          ),
          pw.SizedBox(height: 20),
        ];
      },
    ),
  );

  pdf.addPage(pw.MultiPage(build: (context) {
    return [
      pw.Text(
        'Room Temperature',
        style: pw.TextStyle(fontSize: 20, fontWeight: pw.FontWeight.bold),
      ),
      pw.SizedBox(height: 20),
      pw.TableHelper.fromTextArray(
        headers: headers,
        data: room,
        headerStyle: pw.TextStyle(
          fontSize: 12,
          fontWeight: pw.FontWeight.bold,
        ),
        headerDecoration: pw.BoxDecoration(color: PdfColors.grey300),
        cellStyle: pw.TextStyle(fontSize: 10),
        cellAlignment: pw.Alignment.center,
        cellHeight: 25, // Specify the height of each row
        border: pw.TableBorder.all(color: PdfColors.black, width: 1),
      ),
    ];
  }));

  // Get the directory to save the PDF
  final output = Directory
      .current; // Use getApplicationDocumentsDirectory() for persistent storage
  final file = File("${output.path}/Temperature Records.pdf");

  // Write the PDF to a file
  await file.writeAsBytes(await pdf.save());

  print("PDF saved to ${file.path}");
}
