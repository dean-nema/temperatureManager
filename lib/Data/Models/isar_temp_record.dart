/* 
 ISAR TO DO MODEL

 Converts todo model into isar todo model that we can store in our isae db.

*/

import 'package:isar/isar.dart';
import 'package:temp_manager/Domain/Model/temp_record.dart';

//to generate isar todo object, run: dart run build_runner build
part 'isar_temp_record.g.dart';

@collection
class IsarTempRecord {
  Id id = Isar.autoIncrement;
  late DateTime date;
  late List<String> fridgeTemp;
  late List<String> roomTemp;

  //convert isar object  -> pure todo object to use in our app
  TempRecord toDomain() {
    //converts List<String> to List<dynamic>
    //fridge
    List<dynamic> fridge = [];
    List<dynamic> record = [];
    for (int i = 0; i < fridgeTemp.length; i++) {
      final isEven = i.isEven;
      if (isEven || i == 0) {
        record.add(fridgeTemp[i]);
      } else {
        if (fridgeTemp[i] == "null") {
          record.add(null);
          fridge.add(record);
          record = [];
        } else {
          double temperature = double.parse(fridgeTemp[i]);
          record.add(temperature);
          fridge.add(record);
          record = [];
        }
      }
    }
    //converts List<String> to List<dynamic>
    //fridge
    List<dynamic> room = [];
    List<dynamic> recordRoom = [];
    for (int i = 0; i < roomTemp.length; i++) {
      final isEven = i.isEven;
      if (isEven || i == 0) {
        recordRoom.add(roomTemp[i]);
      } else {
        if (roomTemp[i] == "null") {
          recordRoom.add(null);
          room.add(recordRoom);
          recordRoom = [];
        } else {
          double temperature = double.parse(roomTemp[i]);
          recordRoom.add(temperature);
          room.add(recordRoom);
          recordRoom = [];
        }
      }
    }

    return TempRecord.withData(
     id: id,   date: date, fridgeTemp: fridge, roomTemp: room);
  }

  //convert pure todo object  -> isar object to store in isar db
  static IsarTempRecord fromDomain(TempRecord record) {
    List<String> fridge = record.fridgeToString();
    List<String> room = record.RoomToString();
    
    return IsarTempRecord()
      ..id = record.id!
      ..date = record.date!
      ..fridgeTemp = fridge
      ..roomTemp = room;
  }
}
