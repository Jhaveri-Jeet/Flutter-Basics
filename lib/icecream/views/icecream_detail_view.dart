import 'package:cached_network_image/cached_network_image.dart';
import 'package:demo/icecream/model/icecream.dart';
import 'package:flutter/material.dart';

class IcecreamDetailView extends StatelessWidget {
  const IcecreamDetailView({super.key, required this.icecream});

  final IceCream icecream;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(icecream.flavor),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Hero(
                    tag: icecream.image,
                    child: CircleAvatar(
                      radius: 100,
                      backgroundColor: Colors.transparent,
                      backgroundImage: CachedNetworkImageProvider(
                          icecream.image,
                          cacheKey: icecream.image),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    "\$${icecream.price.toString()}",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 40.0),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                icecream.description,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Toppings",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 100,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: icecream.toppings.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Chip(
                        label: Text(icecream.toppings[index]),
                      ),
                    );
                  },
                ),
              ),
              const Text(
                "Ingredients",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: icecream.ingredients.length,
                itemBuilder: (context, index) {
                  final ingredient = icecream.ingredients[index];
                  return Card(
                    child: ListTile(
                      title: Text(ingredient.name),
                      subtitle: Text("QTY - ${ingredient.quantity}"),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
