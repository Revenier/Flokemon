import 'dart:core';

import 'package:frontend/admin_page/CreatePoke.dart';

class CartList {
  static final CartList _instance = CartList._internal();
  factory CartList() {
    return _instance;
  }

  CartList._internal();
  static List<CreatePoke> createCartList() {
    List<CreatePoke> cartList = [];

    return List.from(cartList);
  }

  List<CreatePoke> displayCart = createCartList();

  void Function(void Function())? setStateCallback;

  void addItemToCart(CreatePoke item) {
    displayCart.add(item);
  }

  void updateList(String value) {
    displayCart = createCartList()
        .where((element) =>
            element.Poke_name!.toLowerCase().contains(value.toLowerCase()))
        .toList();
  }
}
