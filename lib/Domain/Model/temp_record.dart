  class TempRecord {
    int? id;
    DateTime? date;
    List<dynamic> fridgeTemp = [];
    List<dynamic> roomTemp = [];

    TempRecord.withData(
        {required this.id,
        required this.date,
        required this.fridgeTemp,
        required this.roomTemp});

    TempRecord() {
      id = DateTime.now().millisecondsSinceEpoch;
      DateTime now = DateTime.now();
      date = DateTime(now.year, now.month, now.day);
      double? temperature;
      String morningReading = "08:00";
      String afternoonReading = "17:00";
      String nightReading = "22:00";
      fridgeTemp.add([morningReading, temperature]);
      fridgeTemp.add([afternoonReading, temperature]);
      fridgeTemp.add([nightReading, temperature]);

      roomTemp.add([morningReading, temperature]);
      roomTemp.add([afternoonReading, temperature]);
      roomTemp.add([nightReading, temperature]);
    }

    List<String> fridgeToString() {
      List<String> str = [];
      for (var element in fridgeTemp) {
        String time = element[0];
        str.add(time);
        String num = element[1].toString();
        str.add(num);
      }
      return str;
    }

    List<String> RoomToString() {
      List<String> str = [];
      for (var element in roomTemp) {
        String time = element[0];
        str.add(time);
        String num = element[1].toString();
        str.add(num);
      }
      return str;
    }

    DateTime getDate() {
      return date!;
    }

    double? getFridge8am() {
      double? temperature = fridgeTemp[0][1];
      return temperature;
    }

    double? getFridge5pm() {
      double? temperature = fridgeTemp[1][1];
      return temperature;
    }

    double? getFridge10pm() {
      double? temperature = fridgeTemp[2][1];
      return temperature;
    }

    double? getRoom8am() {
      double? temperature = fridgeTemp[0][1];
      return temperature;
    }

    double? getRoom5pm() {
      double? temperature = fridgeTemp[1][1];
      return temperature;
    }

    double? getRoom10pm() {
      double? temperature = fridgeTemp[2][1];
      return temperature;
    }

    void setFridge8am(double temp) {
      fridgeTemp[0][1] = temp;
    }

    void setFridge5pm(double temp) {
      fridgeTemp[1][1] = temp;
    }

    void setFridge10m(double temp) {
      fridgeTemp[2][1] = temp;
    }

    void setRoom8am(double temp) {
      fridgeTemp[0][1] = temp;
    }

    void setRoom5pm(double temp) {
      fridgeTemp[1][1] = temp;
    }

    void setRoom10pm(double temp) {
      fridgeTemp[2][1] = temp;
    }
  }
