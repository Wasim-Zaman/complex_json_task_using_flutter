import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';

import '../models/data_model.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  List<Map<String, Object>> userProducts = [];

  @override
  Widget build(BuildContext context) {
    final productsData =
        Provider.of<DataModel>(context, listen: false).productsData;
    final cartsData = Provider.of<DataModel>(context, listen: false).cartsData;
    final usersData = Provider.of<DataModel>(context, listen: false).usersData;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Complex Json'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                // User.......

                // The very first thing that we need is the user
                final user = usersData[index];
                final userName = user['name'] as Map<String, String>;

                // Cart.......

                // Grab carts with matched user ids
                final userCarts = cartsData
                    .where((cart) => cart['userId'] == user['id'])
                    .toList();

                // userCarts is now List<Map<String, Object>>
                print(userCarts);

                /* 
                Once we have found all the carts or list of carts based on 
                user id, we need to find the products for each cart.   
                */

                // Grab products from user carts

                /* 
                Now we can print all the products which a single user has
                */

                // Product inside the cart.......
                return Column(
                  children: [
                    Card(
                      child: Text(
                        'User Name: ${userName["firstname"]} ${userName["lastname"]}',
                        softWrap: true,
                      ),
                    ),
                  ],
                );
              },
              itemCount: usersData.length,
            ),
          ),
        ],
      ),
      // body: Column(
      //   children: [
      //     Expanded(
      //       child: ListView.builder(
      //         itemBuilder: (context, index) {
      //           // User
      //           final userName = users[index]['name'] as Map<String, String>;
      //           final userProductImage = userProducts[index]['image'];
      //           final userAddress =
      //               users[index]['address'] as Map<String, dynamic>;

      //           // User Products based on cart

      //           // User Carts....
      //           List<Map<String, Object>> userCarts = carts.where((cart) {
      //             return cart['userId'] == 1;
      //           }).toList();

      //           // userCarts is List<Map<String, Object>>

      //           print(userCarts);

      //           // final int commulativeQuantity = userCarts == []
      //           //     ? 0
      //           //     : userCarts.fold(
      //           //         0,
      //           //         (previousValue, element) =>
      //           //             previousValue +
      //           //             (element['products'] as List<Map<String, int>>)
      //           //                 .fold(
      //           //                     0,
      //           //                     (previousValue, element) =>
      //           //                         previousValue +
      //           //                         element['quantity']!));

      //           // Extract products from userCarts based on productId

      //           ///////////////////////////////////////////////////////
      //           return Card(
      //             margin: const EdgeInsets.all(20),
      //             child: Column(
      //               children: [
      //                 GridTileBar(
      //                   backgroundColor: Colors.black54,
      //                   title: Text(
      //                     "${userName['firstname']} ${userName['lastname']}",
      //                     style: const TextStyle(
      //                       fontSize: 30,
      //                       fontWeight: FontWeight.bold,
      //                     ),
      //                   ),
      //                   subtitle: Text(users[index]['email'].toString()),
      //                   trailing: Text(
      //                     "City: ${userAddress['city']}",
      //                     style: const TextStyle(
      //                       fontSize: 20,
      //                       fontWeight: FontWeight.bold,
      //                     ),
      //                   ),
      //                 ),
      //                 // const SizedBox(
      //                 //   height: 20,
      //                 // ),
      //                 SizedBox(
      //                   height: 300,
      //                   child: Image.network(userProductImage.toString()),
      //                 ),

      //                 Row(
      //                   children: [
      //                     Container(
      //                       margin: const EdgeInsets.all(10),
      //                       child: CircleAvatar(
      //                           radius: 36,
      //                           child:
      //                               Text("\$${userProducts[index]['price']}")),
      //                     ),
      //                     Expanded(
      //                       child: Center(
      //                           // child: Text(
      //                           //   "Total Quantity: ${commulativeQuantity}",
      //                           //   style: const TextStyle(
      //                           //     fontSize: 20,
      //                           //     fontWeight: FontWeight.bold,
      //                           //     backgroundColor: Colors.amber,
      //                           //   ),
      //                           // ),
      //                           ),
      //                     ),
      //                   ],
      //                 ),
      //               ],
      //             ),
      //           );
      //         },
      //         itemCount: users.length,
      //       ),
      //     )
      //   ],
      // ),
    );
  }
}
