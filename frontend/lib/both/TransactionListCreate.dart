import 'dart:convert';
import 'dart:core';
import 'package:http/http.dart' as http;

class CreateTransaction {
  String? Poke_name;
  String? Image_directory;
  int total_price;
  int quantity;
  String nama_user;

  CreateTransaction(
      {required this.Poke_name,
      required this.Image_directory,
      required this.total_price,
      required this.quantity,
      required this.nama_user});

  factory CreateTransaction.fromJson(Map<String, dynamic> json) =>
      CreateTransaction(
        Poke_name: json["name"].toString(),
        Image_directory: json["imagelink"],
        total_price: json["price"] as int,
        quantity: json["quantity"],
        nama_user: json["username"].toString(),
      );

  //all transaction
}

Future<List<CreateTransaction>> fetchTransactionList(String token) async {
  String url = "http://10.0.2.2:8080/users/viewalltransaction";
  try {
    final response = await http.get(Uri.parse(url), headers: <String, String>{
      'Content-Type': "application/json",
      'authorization': "Bearer ${token}"
    });

    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);

      // Assume the result is a map
      List<CreateTransaction> transactionList = [];

      for (var i in result) {
        CreateTransaction fetchTransaction = CreateTransaction.fromJson(i);
        transactionList.add(fetchTransaction);
      }
      return transactionList;
    }
  } catch (e) {
    // Handle network or other errors
    print('Error: $e');
  }
  return [];
}

Future<List<CreateTransaction>> fetchHistoryList(String username) async {
  String url = "http://10.0.2.2:8080/users/viewtransaction";
  String json = jsonEncode({"username": username});
  final response = await http.post(Uri.parse(url),
      headers: {"Content-Type": "application/json"}, body: json);

  var result = jsonDecode(response.body);
  List<CreateTransaction> historyList = [];

  for (var i in result) {
    CreateTransaction fetchCollection = CreateTransaction.fromJson(i);
    historyList.add(fetchCollection);
  }

  return historyList;
}
