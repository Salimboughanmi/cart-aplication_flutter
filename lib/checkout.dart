import 'package:cart_app_with_provider/model/cart.dart';
import 'package:cart_app_with_provider/model/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Checkout extends StatefulWidget {
  const Checkout({super.key});

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Checkout"),
        ),
        body: Consumer<Cart>(
          builder: (context, cart, child) {
            return ListView.builder(
                itemCount: cart.basketItem.length, //RemoveProduct
                itemBuilder: (context, i) {
                  return ListTile(
                    title: Text("${cart.basketItem[i].name}"),
                    trailing: IconButton(
                      onPressed: () {
                        cart.RemoveProduct(cart.basketItem[i]);
                      },
                      icon: Icon(Icons.remove_circle),
                    ),
                  );
                });
          },
        ));
  }
}
