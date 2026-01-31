import 'package:cached_network_image/cached_network_image.dart';
import 'package:fire_base_project2/posts/models/products_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../generated/l10n.dart';
import '../proveder/favorite_provider.dart';

class FavoritePage extends StatelessWidget {
  FavoritePage({super.key});
  List<ProductsData> favorites = [];
  @override
  Widget build(BuildContext context) {
    favorites = context.watch<FavoriteProvider>().favoriteItems;
    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).favorite)),
      body: Center(
        child: ListView.builder(
          itemCount: favorites.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text(favorites[index].title),
                // leading: Image.network(favorites[index].images[0]),
                leading: CachedNetworkImage(
                  imageUrl: favorites[index].images[0],
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
