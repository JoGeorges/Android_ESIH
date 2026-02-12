import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class Stockage {
  static final List<String> _data = [];

  Future<void> write(String url) async {
    _data.add(url);
  }

  Future<List<String>> readAll() async {
    return _data;
  }
}

final stockage = Stockage();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Colors.blue,
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final List<String> images = const [
    "https://images.unsplash.com/photo-1517433670267-08bbd4be890f", // Laptop
    "https://images.unsplash.com/photo-1546868871-7041f2a55e12", // Smartwatch
    "https://images.unsplash.com/photo-1592899677977-9c10ca588bbd", // Smartphone
    "https://images.unsplash.com/photo-1585298723682-7115561c51b7", // Écouteurs
    "https://images.unsplash.com/photo-1621259182978-fbf93132d53d", // Tablette
    "https://images.unsplash.com/photo-1605647540924-852290f6b0d5", // Drone
  ];

  final List<String> productNames = const [
    "MacBook Pro M3",
    "Apple Watch Series 9",
    "iPhone 15 Pro",
    "AirPods Max",
    "iPad Air",
    "DJI Mavic 3",
  ];

  final List<double> productPrices = const [
    1999.99,
    499.99,
    1299.99,
    579.99,
    799.99,
    1499.99,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TechStore"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        elevation: 2,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ListeAchatPage()),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: images.length,
        itemBuilder: (context, index) {
          final url = images[index];
          final productName = productNames[index];
          final productPrice = productPrices[index];
          
          return Card(
            margin: const EdgeInsets.all(12),
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                  child: Image.network(
                    url,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        height: 200,
                        color: Colors.grey[300],
                        child: const Center(
                          child: Icon(Icons.broken_image, size: 50, color: Colors.grey),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        productName,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "\$${productPrice.toStringAsFixed(2)}",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          color: Colors.blue[700],
                        ),
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: () async {
                            await stockage.write(url);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("$productName ajouté au panier"),
                                backgroundColor: Colors.green,
                                behavior: SnackBarBehavior.floating,
                              ),
                            );
                          },
                          icon: const Icon(Icons.add_shopping_cart),
                          label: const Text(
                            "Ajouter au panier",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class ListeAchatPage extends StatefulWidget {
  const ListeAchatPage({super.key});

  @override
  State<ListeAchatPage> createState() => _ListeAchatPageState();
}

class _ListeAchatPageState extends State<ListeAchatPage> {
  List<String> achats = [];

  @override
  void initState() {
    super.initState();
    loadAchats();
  }

  Future<void> loadAchats() async {
    final data = await stockage.readAll();
    setState(() {
      achats = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mon Panier"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        elevation: 2,
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_sweep),
            onPressed: () {
              // Fonctionnalité pour vider le panier (à implémenter)
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Fonctionnalité à venir"),
                  backgroundColor: Colors.orange,
                ),
              );
            },
          ),
        ],
      ),
      body: achats.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.shopping_cart_outlined,
                    size: 80,
                    color: Colors.grey[400],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "Votre panier est vide",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Découvrez nos produits tech",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[500],
                    ),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Continuer mes achats"),
                  ),
                ],
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: achats.length,
                    itemBuilder: (context, index) {
                      return Card(
                        margin: const EdgeInsets.all(8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ListTile(
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              achats[index],
                              width: 60,
                              height: 60,
                              fit: BoxFit.cover,
                            ),
                          ),
                          title: Text("Produit Tech ${index + 1}"),
                          subtitle: const Text("Quantité: 1"),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete_outline, color: Colors.red),
                            onPressed: () {
                              // Fonctionnalité pour supprimer un item (à implémenter)
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: const Offset(0, -3),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Total:",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "\$${achats.length * 999}.99",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue[700],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text("Commande confirmée !"),
                                content: const Text("Votre commande a bien été enregistrée."),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: const Text("OK"),
                                  ),
                                ],
                              ),
                            );
                          },
                          child: const Text(
                            "Passer la commande",
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
