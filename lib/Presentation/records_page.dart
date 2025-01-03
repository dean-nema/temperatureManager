
import 'package:flutter/material.dart';
import 'package:temp_manager/Domain/Repository/temp_recodrs_repo.dart';
import 'package:temp_manager/Presentation/home_page.dart';

class RecordsPage extends StatelessWidget {
  final TempRecordsRepo recordsRepo;
  RecordsPage({super.key, required this.recordsRepo});

  @override
  Widget build(BuildContext context) {
    return HomePage();
  }
}
