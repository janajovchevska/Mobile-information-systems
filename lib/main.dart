import 'package:flutter/material.dart';
import 'package:mis_labs/models/ClothingItem.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clothing App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink),
        useMaterial3: true,
      ),
      home: ClothingItemsScreen(),
    );
  }
}
class ClothingItemsScreen extends StatelessWidget {
   ClothingItemsScreen({super.key});

  final List<ClothingItem> clothingItems=[
  ClothingItem(
  name: "Dress",
  image: "https://www.kissprom.com/cdn/shop/files/image_ebab5287-6d37-4e7c-860a-4b23ea927024.jpg?v=1701834619&width=800",
  description: "Long pink flowery dress",
  price: 100.00
  ),
  ClothingItem(
  name: "Purse",
   image: "https://www.shoppriceless.com/cdn/shop/files/Gianna-Pink-Mini-Purse-4.jpg?v=1696433357&width=1333",
   description: "Pink bag with golden chain",
   price: 75.00),
    ClothingItem(
        name: "High Heels",
        image: "https://www.linzi.com/cdn/shop/files/N4A71971.jpg?v=1723628271&width=320",
        description: "Pink high heels",
        price: 65.00),
    ClothingItem(
        name: "Summer Hat",
        image: "https://helloquality.co.za/cdn/shop/files/Summerhat_4.jpg?v=1721159282&width=1920",
        description: "Pink flowery summer hat",
        price: 30.00),
    ClothingItem(
        name: "Glasses",
        image: "https://i.pinimg.com/736x/8b/0a/0e/8b0a0e30c75a896eaf7efe865ff71983.jpg",
        description: "Pink heart-shaped glasses",
        price: 40.00)

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("213002"),
        backgroundColor: Colors.pink[100],
        leading: const Icon(Icons.menu),
        elevation: 3,
      ),
      body: ListView.builder(
        itemCount: clothingItems.length,
        itemBuilder: (context, index) {
          final ClothingItem item = clothingItems[index];
          return InkWell(
            onTap: () {
                Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ItemDetailsScreen(item: item),
                ),
              );
            },
            child: Card(
              margin: const EdgeInsets.all(10),
              child: Container(
                height: 450,
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(
                      item.image,
                      height: 300,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      item.name,
                      style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '\$${item.price.toStringAsFixed(2)}',
                      style: const TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class ItemDetailsScreen extends StatelessWidget {

  final ClothingItem item;
  const ItemDetailsScreen({required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.name),
        backgroundColor: Colors.pink[100],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
              item.image,
              height: 500,
              width: double.infinity,
              fit:BoxFit.cover),
          const SizedBox(height:20),
          Padding(
              padding: const EdgeInsets.only(left: 10),
          child: Text(
              item.name,
              style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.pink,
                  decorationThickness: 1))
          ),
          const SizedBox(height:10),
          Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
              item.description,
              style: const TextStyle(fontSize: 20))),
          Padding(
              padding: const EdgeInsets.only(left: 10),child:
          Text(
              '\$${item.price.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 18))),
        ],
      ),
    );
  }
}

