
import 'package:favourites/favourites.dart';
import 'package:favourites/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class AddFavourites extends StatefulWidget {
  const AddFavourites({Key? key}) : super(key: key);

  @override
  State<AddFavourites> createState() => _AddFavouritesState();
}

class _AddFavouritesState extends State<AddFavourites> {

  List words = ['Time','Year','People','Way','Day','Man','Thing','Women','Life','Child','World','School','Flower','Plant','Chair','Eyes'];

  @override
  Widget build(BuildContext context) {

    final object=Provider.of<FavoriteProvider>(context);

    return Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const Favourite()));
          },

          label: const Text('favorites',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),),
        ),
        appBar: AppBar(
          title: const Text('English Words',
            style: TextStyle(fontSize: 25),),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: SingleChildScrollView(
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: words.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 10.0,right: 10,top: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(words[index],
                            style: const TextStyle(fontSize: 25),),
                          IconButton(
                            onPressed: (){
                              object.favorites(words[index]);
                            },
                            icon: object.icon_change(words[index]) ?
                            const Icon(Icons.favorite,color: Colors.red,) :
                            Icon(Icons.favorite_outline,color: Colors.grey.shade500,),
                          ),
                        ],

                      ),
                      const Divider(thickness: 1,),
                    ],
                  ),
                );

              }
          ),

        )

    );





  }
}