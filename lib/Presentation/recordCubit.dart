import 'package:bloc/bloc.dart';
import 'package:temp_manager/Domain/Repository/temp_recodrs_repo.dart';
import '../Domain/Model/temp_record.dart';

/*
  Record CUBIT - simple state management


  Each cubit is a list of Records.

 */

class RecordCubit extends Cubit<List<TempRecord>> {
  //reference what the app can do
  final TempRecordsRepo recordRepo;

  //Constructor initializes the  cubit with an empty list
  RecordCubit(this.recordRepo) : super([]) {
    loadRecords();
  }

  //Load

  Future<void> loadRecords() async {
    final recordList = await recordRepo.getRecords();

    //emit the fetched data  as a new state
    emit(recordList);
  }

  //Add
  Future<void> addRecord(TempRecord record) async {
    //save record
    await recordRepo.addRecord(record);
    //re-load
    loadRecords();
  }

  //Update
  Future<void> updateRecord(TempRecord record) async {
    //update record
    print("Update Reached 🍄");

    print(record.roomTemp);

    await recordRepo.updateRecord(record);
    //re-load
    loadRecords();
  }
}
