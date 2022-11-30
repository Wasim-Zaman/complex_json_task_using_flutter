import 'package:flutter/material.dart';

import "../json/products_data.dart";
import "../json/user_data.dart";

class HomePage extends StatelessWidget {
  List<Map<String, Object>> userProducts = [];

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
                  ///////////////////////////////////////////////////////
                  return Card(
                    margin: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        ListTile(
                          title: Text(
                            "${userName['firstname']} ${userName['lastname']}",
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(users[index]['email'].toString()),
                          trailing: Text("City: ${userAddress['city']}"),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 300,
                          child: Image.network(userProductImage.toString()),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Text("Price: \$ ${userProducts[index]['price']}"),
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
