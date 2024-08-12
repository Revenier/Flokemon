import 'dart:core';
import 'package:frontend/user_page/HistoryCreate.dart';

class HistoryList {
  static List<CreateHistory> createHistoryList() {
    List<CreateHistory> historyList = [
      CreateHistory('Bulbasaur0', "assets/db pokemon/bulbasaur.png", 3400, 2),
    ];

    return List.from(historyList);
  }

  List<CreateHistory> displayHistory = createHistoryList();

  void Function(void Function())? setStateCallback;

  void updateList(String value) {
    displayHistory = createHistoryList()
        .where((element) =>
            element.Poke_name!.toLowerCase().contains(value.toLowerCase()))
        .toList();
  }
}
