/*
  TO DO REPOSITORY

  Here you define what the app can do in terms of database

*/

import 'package:temp_manager/Domain/Model/temp_record.dart';

abstract class TempRecordsRepo {
  //get all Records
  Future<List<TempRecord>> getRecords();

  //add new recording
  Future<void> addRecord(TempRecord record);

  //update existing record
  Future<void> updateRecord(TempRecord record);
}

/*
Notes:
 
 -the repo in the domain layer outlines what operations the app can do,
 but it doesnt worry about the specific implementation deetails. Thats for the data
 layer.

 -technology agnostic: independent of any technology of framework
*/
