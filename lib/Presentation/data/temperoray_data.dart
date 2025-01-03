import 'package:temp_manager/Domain/Model/temp_record.dart';

class TemperorayData {
  
  static TempRecord obj = TempRecord();
  

  static List<TempRecord> database = [
  TempRecord.withData(id: 1, date: DateTime(2024, 01, 01), fridgeTemp: [
    ["8 AM", 2],
    ["5 PM", 2],
    ["10 PM", 2]
  ], roomTemp: [
    ["8 AM", 10],
    ["5 PM", 23],
    ["10 PM", 25]
  ]),
  TempRecord.withData(id: 2, date: DateTime(2024, 1, 2), fridgeTemp: [
    ["8 AM", 3],
    ["5 PM", 4],
    ["10 PM", 5]
  ], roomTemp: [
    ["8 AM", 14],
    ["5 PM", 18],
    ["10 PM", 22]
  ]),
  TempRecord.withData(id: 3, date: DateTime(2024, 1, 3), fridgeTemp: [
    ["8 AM", 1],
    ["5 PM", 2],
    ["10 PM", 3]
  ], roomTemp: [
    ["8 AM", 12],
    ["5 PM", 16],
    ["10 PM", 20]
  ]),
  TempRecord.withData(id: 4, date: DateTime(2024, 1, 4), fridgeTemp: [
    ["8 AM", 4],
    ["5 PM", 5],
    ["10 PM", 6]
  ], roomTemp: [
    ["8 AM", 18],
    ["5 PM", 21],
    ["10 PM", 24]
  ]),
  TempRecord.withData(id: 5, date: DateTime(2024, 1, 5), fridgeTemp: [
    ["8 AM", 0],
    ["5 PM", 1],
    ["10 PM", 2]
  ], roomTemp: [
    ["8 AM", 13],
    ["5 PM", 17],
    ["10 PM", 19]
  ]),
  TempRecord.withData(id: 6, date: DateTime(2024, 1, 6), fridgeTemp: [
    ["8 AM", 3],
    ["5 PM", 4],
    ["10 PM", 5]
  ], roomTemp: [
    ["8 AM", 15],
    ["5 PM", 18],
    ["10 PM", 20]
  ]),
  TempRecord.withData(id: 7, date: DateTime(2024, 1, 7), fridgeTemp: [
    ["8 AM", 2],
    ["5 PM", 3],
    ["10 PM", 4]
  ], roomTemp: [
    ["8 AM", 11],
    ["5 PM", 19],
    ["10 PM", 22]
  ]),
  TempRecord.withData(id: 8, date: DateTime(2024, 1, 8), fridgeTemp: [
    ["8 AM", 4],
    ["5 PM", 6],
    ["10 PM", 7]
  ], roomTemp: [
    ["8 AM", 16],
    ["5 PM", 23],
    ["10 PM", 24]
  ]),
  TempRecord.withData(id: 9, date: DateTime(2024, 1, 9), fridgeTemp: [
    ["8 AM", 1],
    ["5 PM", 2],
    ["10 PM", 3]
  ], roomTemp: [
    ["8 AM", 14],
    ["5 PM", 17],
    ["10 PM", 19]
  ]),
  TempRecord.withData(id: 10, date: DateTime(2024, 1, 10), fridgeTemp: [
    ["8 AM", 3],
    ["5 PM", 4],
    ["10 PM", 6]
  ], roomTemp: [
    ["8 AM", 18],
    ["5 PM", 21],
    ["10 PM", 23]
  ]),
  TempRecord.withData(id: 11, date: DateTime(2024, 1, 11), fridgeTemp: [
    ["8 AM", 0],
    ["5 PM", 1],
    ["10 PM", 2]
  ], roomTemp: [
    ["8 AM", 10],
    ["5 PM", 15],
    ["10 PM", 18]
  ]),
  TempRecord.withData(id: 12, date: DateTime(2024, 1, 12), fridgeTemp: [
    ["8 AM", 5],
    ["5 PM", 6],
    ["10 PM", 8]
  ], roomTemp: [
    ["8 AM", 20],
    ["5 PM", 25],
    ["10 PM", 28]
  ]),
  TempRecord.withData(id: 13, date: DateTime(2024, 1, 13), fridgeTemp: [
    ["8 AM", 2],
    ["5 PM", 3],
    ["10 PM", 4]
  ], roomTemp: [
    ["8 AM", 11],
    ["5 PM", 18],
    ["10 PM", 21]
  ]),
  TempRecord.withData(id: 14, date: DateTime(2024, 1, 14), fridgeTemp: [
    ["8 AM", 3],
    ["5 PM", 4],
    ["10 PM", 5]
  ], roomTemp: [
    ["8 AM", 15],
    ["5 PM", 20],
    ["10 PM", 22]
  ]),
  TempRecord.withData(id: 15, date: DateTime(2024, 1, 15), fridgeTemp: [
    ["8 AM", 1],
    ["5 PM", 2],
    ["10 PM", 3]
  ], roomTemp: [
    ["8 AM", 10],
    ["5 PM", 16],
    ["10 PM", 19]
  ])
];


  static double? nightRoom = 4;
  static double? mornRoom = 2;
  static double? afternoonRoom = 3;
}
