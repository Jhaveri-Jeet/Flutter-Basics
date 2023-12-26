class IceCream {
  String flavor;
  String description;
  List<String> toppings;
  double price;
  String image;
  List<Ingredient> ingredients;

  IceCream({
    required this.flavor,
    required this.description,
    required this.toppings,
    required this.price,
    required this.image,
    required this.ingredients,
  });

  factory IceCream.fromJson(Map<String, dynamic> json) {
    return IceCream(
      flavor: json['flavor'],
      description: json['description'],
      toppings: List<String>.from(json['toppings']),
      price: json['price'],
      image: json['image'],
      ingredients: List<Ingredient>.from(
        json['ingredients']
            .map((ingredient) => Ingredient.fromJson(ingredient)),
      ),
    );
  }
}

class Ingredient {
  String name;
  String quantity;

  Ingredient({
    required this.name,
    required this.quantity,
  });

  factory Ingredient.fromJson(Map<String, dynamic> json) {
    return Ingredient(
      name: json['name'],
      quantity: json['quantity'],
    );
  }
}
