import 'package:cached_network_image/cached_network_image.dart';
import 'package:fire_base_project2/components/BottomNavBar.dart';
import 'package:fire_base_project2/generated/l10n.dart';
import 'package:fire_base_project2/posts/models/products_data.dart';
import 'package:fire_base_project2/posts/services_api/my_api_services.dart';
import 'package:fire_base_project2/proveder/cart_provider.dart';
import 'package:fire_base_project2/proveder/lang_provider.dart';
import 'package:fire_base_project2/proveder/theme_proveder.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductApp extends StatefulWidget {
  const ProductApp({super.key});

  @override
  State<ProductApp> createState() => _ProductAppState();
}

class _ProductAppState extends State<ProductApp> {
  MyApiServices apiServices = MyApiServices();
  List<ProductsData> products = [];
  int selectedIndex = 0;

  @override
  void initState() {
    getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Bottomnavbar(pageIndex: 0),
      appBar: AppBar(
        title: Text(S.of(context).products),
        actions: [
          IconButton(
            onPressed: () {
              Locale currentLocale = context.read<LangProvider>().currentLocale;
              if (currentLocale.languageCode == 'en') {
                context.read<LangProvider>().changeLocale(const Locale('ar'));
              } else {
                context.read<LangProvider>().changeLocale(const Locale('en'));
              }
            },
            icon: Icon(Icons.language),
          ),
          IconButton(
            onPressed: () {
              context.read<ThemeProvider>().themeMode == ThemeMode.light
                  ? context.read<ThemeProvider>().toggleTheme(true)
                  : context.read<ThemeProvider>().toggleTheme(false);
            },
            icon: Icon(Icons.brightness_6),
          ),
        ],
      ),
      body: products.isEmpty
          ? Center(child: CircularProgressIndicator())
          : Center(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.all(10),
                    elevation: 5,
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        // product image
                        // cached network image
                        CachedNetworkImage(
                          imageUrl: products[index].images.first,
                          height: 200,
                          width: double.infinity,
                          placeholder: (context, url) =>
                              CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                          fit: BoxFit.cover,
                        ),

                        Positioned(
                          bottom: -10,
                          left: 0,
                          right: 0,
                          child: Container(
                            color: Colors.black54,
                            padding: EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 20,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  products[index].title,
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  '\$${products[index].price}',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white70,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          top: 10,
                          right: 10,
                          child: IconButton(
                            icon: Icon(
                              Icons.favorite,
                              color:
                                  // check if product is favorite
                                  context.read<CartProvider>().isInCart(
                                    products[index],
                                  )
                                  ? Colors.green
                                  : Colors.red,
                            ),
                            onPressed: () {
                              print('product added==========');
                              // add product to list product
                              context.read<CartProvider>().addToCart(
                                products[index],
                              );
                            },
                          ),
                        ),

                        Positioned(
                          top: 10,
                          left: 10,
                          child: IconButton(
                            icon: Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              print('product deleted==========');
                              // delete product from list product
                              context.read<CartProvider>().removeFromCart(
                                products[index],
                              );
                              setState(() {
                                products.removeAt(index);
                              });
                            },
                          ),
                        ),

                        Positioned(
                          bottom: -15,
                          right: 170,
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: IconButton(
                              icon: Icon(
                                context.watch<CartProvider>().isInCart(
                                      products[index],
                                    )
                                    ? Icons.remove_shopping_cart
                                    : Icons.add_shopping_cart,
                                color: Colors.green,
                              ),
                              onPressed: () {
                                print('=====================');
                                if (context.read<CartProvider>().isInCart(
                                  products[index],
                                )) {
                                  // make snack bar using matrial banner
                                  context.read<CartProvider>().removeFromCart(
                                    products[index],
                                  );
                                  print(
                                    '${context.read<CartProvider>().cartItems.toString()}====remove==================',
                                  );
                                } else {
                                  context.read<CartProvider>().addToCart(
                                    products[index],
                                  );
                                  print(
                                    '${context.read<CartProvider>().cartItems.toString()}======add================',
                                  );
                                }
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
    );
  }

  Future<void> getProducts() async {
    products = await apiServices.getProducts();
    setState(() {
      products = products;
    });
  }
}



// {
//             "id": 10,
//             "title": "Gucci Bloom Eau de",
//             "description": "Gucci Bloom by Gucci is a floral and captivating fragrance, with notes of tuberose, jasmine, and Rangoon creeper. It's a modern and romantic scent.",
//             "category": "fragrances",
//             "price": 79.99,
//             "rating": 2.74,
//             "images": [
//                 "https://cdn.dummyjson.com/product-images/fragrances/gucci-bloom-eau-de/1.webp",
//                 "https://cdn.dummyjson.com/product-images/fragrances/gucci-bloom-eau-de/2.webp",
//                 "https://cdn.dummyjson.com/product-images/fragrances/gucci-bloom-eau-de/3.webp"
//             ],
//             "thumbnail": "https://cdn.dummyjson.com/product-images/fragrances/gucci-bloom-eau-de/thumbnail.webp"
//         },