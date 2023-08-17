import 'package:favourites/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Favourite extends StatefulWidget {
  const Favourite({Key? key}) : super(key: key);

  @override
  State<Favourite> createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  @override
  Widget build(BuildContext context) {

    final object=Provider.of<FavoriteProvider>(context);
    List itemstore=object.favoriteitem;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
      body: SingleChildScrollView(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: itemstore.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(left: 10.0,right: 10,top: 10),
              child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(itemstore[index],
                          style: const TextStyle(fontSize: 25),),
                        IconButton(onPressed: (){
                          object.favorites(itemstore[index]);
                        },

                          icon: object.icon_change(itemstore[index]) ?
                          const Icon(Icons.favorite,color: Colors.red,) :
                          const Icon(Icons.favorite_border,color: Colors.black,),
                        )
                      ],
                    ),
                    const Divider(thickness: 2                                                                                                                                                                                                                                                                                                                                                                                                                                        ,),
                  ]
              ),
            );
          },
        ),
      ),
    );
  }
}