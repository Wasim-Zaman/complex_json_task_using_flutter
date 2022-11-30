import 'package:flutter/material.dart';

import "../json/products_data.dart";
import "../json/user_data.dart";
import "../json/carts_data.dart";

class HomePage extends StatelessWidget {
  List<Map<String, Object>> userProducts = [];

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    users.forEach((user) {
      products.forEach((product) {
        if (user['id'] == product['id']) {
          userProducts.add(product);
        }
      });
    });
    return Scaffold(
        appBar: AppBar(
          title: const Text('Complex Json'),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  // User
                  final userName = users[index]['name'] as Map<String, String>;
                  final userProductImage = userProducts[index]['image'];
                  final userAddress =
                      users[index]['address'] as Map<String, dynamic>;

                  // User Carts....
                  List<Map<String, Object>> userCarts = carts.where((cart) {
                    return cart['userId'] == users[index]['id'];
                  }).toList();

                  // userCarts is List<Map<String, Object>>

                  final int commulativeQuantity = userCarts == []
                      ? 0
                      : userCarts.fold(
                          0,
                          (previousValue, element) =>
                              previousValue +
                              (element['products'] as List<Map<String, int>>)
                                  .fold(
                                      0,
                                      (previousValue, element) =>
                                          previousValue +
                                          element['quantity']!));
                  print(userCarts);

                  // List<Map<String, int>> cartProducts =
                  //     userCarts['products'] as List<Map<String, int>>;
                  // final sumOfQuantities = cartProducts.fold<int>(
                  //     0,
                  //     (previousValue, quantity) =>
                  //         previousValue + quantity['quantity']!);

                  ///////////////////////////////////////////////////////
                  return Card(
                    margin: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        GridTileBar(
                          backgroundColor: Colors.black54,
                          title: Text(
                            "${userName['firstname']} ${userName['lastname']}",
                            style: const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(users[index]['email'].toString()),
                          trailing: Text(
                            "City: ${userAddress['city']}",
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        // const SizedBox(
                        //   height: 20,
                        // ),
                        SizedBox(
                          height: 300,
                          child: Image.network(userProductImage.toString()),
                        ),
                        // const SizedBox(
                        //   height: 20,
                        // ),
                        // GridTileBar(
                        //   backgroundColor: Colors.black54,
                        //   leading: CircleAvatar(
                        //     radius: 20,
                        //     child: FittedBox(
                        //         child:
                        //             Text("\$${userProducts[index]['price']}")),
                        //   ),
                        //   title: Text("Quantity: $commulativeQuantity"),
                        // ),
                        Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.all(10),
                              child: CircleAvatar(
                                  radius: 36,
                                  child: Text(
                                      "\$${userProducts[index]['price']}")),
                            ),
                            Expanded(
                              child: Center(
                                child: Text(
                                  "Total Quantity: ${commulativeQuantity}",
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    backgroundColor: Colors.amber,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
                itemCount: users.length,
              ),
            )
          ],
        ));
  }
}
