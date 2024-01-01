import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../model/icecream.dart';

class IcecreamCard extends StatelessWidget {
  const IcecreamCard({
    super.key,
    required this.icecream,
  });

  final IceCream icecream;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: Card(
        clipBehavior: Clip.hardEdge,
        color: Colors.orange.shade100,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        // We can take the stack when we want many childs but in stack flow
        child: Stack(
          fit: StackFit.expand,
          children: [
            Hero(
              tag: icecream.image,
              child: CachedNetworkImage(
                imageUrl: icecream.image,
                fit: BoxFit.cover,
                cacheKey: icecream.image,
                // color: Colors.orange.withOpacity(0.5),
                // colorBlendMode: BlendMode.color,
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      icecream.flavor,
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    Text(
                      '\$${icecream.price.toString()}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
