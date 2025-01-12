import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:temp_manager/Domain/Repository/temp_recodrs_repo.dart';

import 'package:temp_manager/Presentation/recordCubit.dart';
import 'package:temp_manager/Presentation/records_page.dart';
import 'package:window_size/window_size.dart';

import 'Data/Models/isar_temp_record.dart';
import 'Data/Repository/isar_temp_record_repo.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
  //   setWindowMinSize(const Size(700, 970)); // Minimum size
  // }

  // Get directory path for storing data
  final dir = await getApplicationCacheDirectory();

  // Open Isar database
  final isar = await Isar.open([IsarTempRecordSchema], directory: dir.path);

  // Initialize the repository with Isar database
  final recordsRepo = IsarTempRecordRepo(isar);

  runApp(MyApp(recordsRepo: recordsRepo));
}

class MyApp extends StatelessWidget {
  final TempRecordsRepo recordsRepo;

  const MyApp({super.key, required this.recordsRepo});

/* 
  Records PAGE:  reponsible for providing cubit to view(UI)

  -use BlocProvider

*/
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RecordCubit(recordsRepo),
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: 560,
        ),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Temperature Manager',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: RecordsPage(recordsRepo: recordsRepo),
        ),
      ),
    );
  }
}
