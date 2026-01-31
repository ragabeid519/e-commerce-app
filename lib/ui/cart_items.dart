import 'package:fire_base_project2/components/BottomNavBar.dart';
import 'package:fire_base_project2/generated/l10n.dart';
import 'package:fire_base_project2/posts/models/products_data.dart';
import 'package:fire_base_project2/proveder/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartItems extends StatelessWidget {
  CartItems({super.key});
  List<ProductsData> cartItems = [];

  @override
  Widget build(BuildContext context) {
    cartItems = context.watch<CartProvider>().cartItems;
    return Scaffold(
      bottomNavigationBar: Bottomnavbar(pageIndex: 1),
      appBar: AppBar(title: Text(S.of(context).cart_Items)),
      body: cartItems.isEmpty
          ? Center(child: Text(S.of(context).empty_cart))
          : Center(
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: cartItems.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(cartItems[index].title),
                          leading: Image.network(cartItems[index].images[0]),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
