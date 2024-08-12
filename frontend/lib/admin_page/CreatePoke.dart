import 'package:http/http.dart' as http;
import 'dart:convert';

class CreatePoke {
  String Poke_name;
  int Poke_index;
  String Image_directory;
  String Element1_directory;
  String Element2_directory;
  int Poke_price;
  String? Desc_poke;
  int Height_poke;
  int Weight_poke;

  CreatePoke(
      {required this.Poke_name,
      required this.Poke_index,
      required this.Image_directory,
      required this.Element1_directory,
      required this.Element2_directory,
      required this.Poke_price,
      required this.Desc_poke,
      required this.Height_poke,
      required this.Weight_poke});

  factory CreatePoke.fromJson(Map<String, dynamic> json) => CreatePoke(
      Poke_name: json["name"].toString(),
      Poke_index: json["id"] as int,
      Image_directory: json["imagelink"],
      Element1_directory: json["type1"].toString(),
      Element2_directory: json["type2"].toString(),
      Poke_price: json["Price"] as int,
      Desc_poke: json["description"].toString(),
      Height_poke: json["height"] as int,
      Weight_poke: json["weight"] as int);
}

Future<List<CreatePoke>> fetchPokeList(String token) async {
  String url = "http://10.0.2.2:8080/users/viewallpokemon";

  var resp = await http.get(Uri.parse(url), headers: <String, String>{
    'Content-Type': "application/json",
    'authorization': "Bearer ${token}"
  });

  var result = jsonDecode(resp.body);

  print(result);

  List<CreatePoke> pokeList = [];

  for (var i in result) {
    CreatePoke fetchPokeList = CreatePoke.fromJson(i);
    pokeList.add(fetchPokeList);
  }

  return pokeList;
}

// collection
Future<List<CreatePoke>> fetchCollectionList(String username) async {
  String url = "http://10.0.2.2:8080/users/viewpokemon";
  String json = jsonEncode({"username": username});
  final response = await http.post(Uri.parse(url),
      headers: {"Content-Type": "application/json"}, body: json);

  var result = jsonDecode(response.body);

  print(result);

  List<CreatePoke> CollectionList = [];

  for (var i in result) {
    CreatePoke fetchCollectionList = CreatePoke.fromJson(i);
    CollectionList.add(fetchCollectionList);
  }

  return CollectionList;
}
