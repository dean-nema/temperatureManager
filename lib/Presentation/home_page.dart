import 'package:flutter/material.dart';
import 'package:temp_manager/Presentation/colours.dart';
import 'package:temp_manager/Presentation/components/row_display.dart';
import 'package:temp_manager/Presentation/page2.dart';
import 'font_styles.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {

  


    final mobile = MediaQuery.sizeOf(context).width < 900;

    // double mainHeight = mobile ? 550 : 700;
    // double mainWidth = mobile ? 500 : 650;


    var morningControllerFridge = TextEditingController();
    var afternoonControllerFridge = TextEditingController();
    var nightControllerFridge = TextEditingController();

    double tableButtonWidth = mobile ? 100 : 200;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    print("Height: %$height, Width: $width");
    final bool heightController = height <= 800;
    final bool heightController2 = height <= 900;

  
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Center(
            child: Text(
          "Temperature Reading ",
          style: FontStyles.appBarText,
        )),
        backgroundColor: Colours.appBarBackground,
      ),
      backgroundColor: Colours.mainBackground,
      body: SingleChildScrollView(
        child: Column(
            children: [
              //Table Button
              Padding(
                padding: const EdgeInsets.only(top: 20.0, bottom: 10),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: tableButtonWidth,
                          height: 50,
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Recordings()),
                                );
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Icon(
                                    Icons.table_chart,
                                    color: Colours.tableIconColor,
                                  ),
                                  mobile
                                      ? SizedBox()
                                      : Text(
                                          "View Records",
                                          style: FontStyles.main,
                                        )
                                ],
                              )),
                        ),
                      )
                    ],
                  ),
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
                      "Today",
                      style: FontStyles.otherTitles,
                    ),
                  ),
                ),
              ),
        
              //Room row
              RowDisplay(
                title: "Room",
              ),
              //Fridge row
              Padding(
                padding: heightController
                    ? const EdgeInsets.only(top: 20.0)
                    : heightController2
                        ? const EdgeInsets.only(top: 100)
                        : const EdgeInsets.only(top: 150),
                child: RowDisplay(
                  title: "Fridge",
                ),
              ),
            ],
          ),
      )
      
    );
  }
}
