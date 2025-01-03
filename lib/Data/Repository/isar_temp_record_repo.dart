/* 
     DATABASE REPO
  
     This implements the todo repo and handles storing, retriving, updating, 
     deleting in the isar database.


*/

import 'package:isar/isar.dart';
import 'package:temp_manager/Data/Models/isar_temp_record.dart';
import 'package:temp_manager/Domain/Model/temp_record.dart';

import '../../Domain/Repository/temp_recodrs_repo.dart';

class IsarTempRecordRepo implements TempRecordsRepo {
  //database
  final Isar db;

  IsarTempRecordRepo(this.db);

  @override
  Future<void> addRecord(TempRecord record) {
    // convert TempRecord  into isar temperature record
    final IsarTempRecord recordIsar = IsarTempRecord.fromDomain(record);

    //so that we can store it in our isar database
    return db.writeTxn(() => db.isarTempRecords.put(recordIsar));
  }

  @override
  Future<List<TempRecord>> getRecords() async {
    //fetch from db
    final records = await db.isarTempRecords.where().findAll();
    //return as a list of todos and give to domain layer
    return records.map((isarRecord) => isarRecord.toDomain()).toList();
  }

  @override
  Future<void> updateRecord(TempRecord record) {
    // convert TempRecord  into isar temperature record
    final IsarTempRecord recordIsar = IsarTempRecord.fromDomain(record);

    //so that we can store it in our isar database
    return db.writeTxn(() => db.isarTempRecords.put(recordIsar));
  }
}
