import 'package:flutter/material.dart';

import '../json/products_data.dart';
import '../json/user_data.dart';
import '../json/carts_data.dart';

class DataModel with ChangeNotifier {
  final _produts = products;
  final _users = users;
  final _carts = carts;

  List<Map<String, Object>> get productsData {
    return [..._produts];
  }

  List<Map<String, Object>> get usersData {
    return [..._users];
  }

  List<Map<String, Object>> get cartsData {
    return [..._carts];
  }
}
