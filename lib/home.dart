import 'package:cart_app_with_provider/checkout.dart';
import 'package:cart_app_with_provider/model/cart.dart';
import 'package:cart_app_with_provider/model/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Product> products = [
    Product(name: "LG", price: 4404),
    Product(name: "sumsung", price: 556)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Home"),
          centerTitle: true,
          backgroundColor: Colors.blue,
          actions: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) {
                        return Checkout();
                      }),
                    );
                  },
                  icon: Icon(Icons.add_shopping_cart),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: Consumer<Cart>(
                    builder: (BuildContext context, value, child) {
                      return Text("${value.count}");
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Consumer<Cart>(
                    builder: (BuildContext context, value, child) {
                      return Text("${value.price}");
                    },
                  ),
                ),
              ],
            )
          ],
        ),
        body: ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, i) {
              return Card(
                child: Consumer<Cart>(
                  builder: (context, value, child) {
                    return ListTile(
                      title: Text("${products[i].name}"),
                      subtitle: (Text('${products[i].price}')),
                      trailing: IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          value.addProduct(products[i]);
                        },
                      ),
                    );
                  },
                ),
              );
            }));
  }
}
