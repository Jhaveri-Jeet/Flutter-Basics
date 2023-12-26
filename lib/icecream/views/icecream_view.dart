import 'dart:convert';

import 'package:demo/icecream/model/icecream.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../customWidget/icecream_card.dart';
import 'icecream_detail_view.dart';

class IcecreamView extends StatelessWidget {
  const IcecreamView({super.key});

  Future<Map<String, dynamic>> loadData() async {
    // RootBundle will store/load the data from the given path
    final rawData = await rootBundle.loadString("assets/icecream.json");
    await Future.delayed(const Duration(seconds: 1));
    final decodedData = jsonDecode(rawData);
    return decodedData;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Icecreams",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "We have something yummy for you",
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(
            height: 30,
          ),
          Expanded(
              child: FutureBuilder(
            future: loadData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                final icecreamData = snapshot.data as Map<String, dynamic>;
                final icecreams = icecreamData['icecreams'] as List<dynamic>;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width,
                      height: MediaQuery.sizeOf(context).height / 2,
                      // ListView.builder is a powerful Flutter widget used for efficiently creating scrollable lists or grids of items. It's particularly useful when dealing with a large number of items because it creates items on-demand as the user scrolls, reducing memory usage and improving performance.
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: icecreams.length,
                        itemBuilder: (context, index) {
                          final icecream = IceCream.fromJson(icecreams[index]);
                          return InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => IcecreamDetailView(
                                      icecream: icecream,
                                    ),
                                  ),
                                );
                              },
                              child: IcecreamCard(icecream: icecream));
                        },
                      ),
                    ),
                  ],
                );
              } else {
                return const Center(
                  // loader till the content loads
                  child: CircularProgressIndicator.adaptive(),
                );
              }
            },
          ))
        ],
      ),
    );
  }
}
