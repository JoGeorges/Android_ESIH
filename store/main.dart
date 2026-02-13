import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// Couleur orange personnalisée pour toute l'application
const Color orangeBoutique = Color(0xFFFF9800); // Orange vif

// Modèle de produit
class Product {
  final String name;
  final String description;
  final String price;
  final String imageUrl;
  final String detailedDescription;

  Product({
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    this.detailedDescription = '',
  });
}

// Données simulées avec URLs d'images 100% fonctionnelles - 6 produits seulement
final List<Product> allProducts = [
  Product(
    name: 'Mangue',
    description: 'Mangue fraîche',
    price: '2.50€',
    imageUrl: 'https://st4.depositphotos.com/13349494/19676/i/450/depositphotos_196764668-stock-photo-close-view-fresh-banana-isolated.jpg',
    detailedDescription: 'Mangue juteuse et sucrée, parfaite pour les desserts.',
  ),
  Product(
    name: 'Coco',
    description: 'Noix de coco',
    price: '3.00€',
    imageUrl: 'https://images.pexels.com/photos/5775270/pexels-photo-5775270.jpeg?auto=compress&cs=tinysrgb&w=400&h=300&fit=crop',
    detailedDescription: 'Noix de coco fraîche, riche en eau et en saveur.',
  ),
  Product(
    name: 'Banane',
    description: 'Banane plantain',
    price: '1.80€',
    imageUrl: 'https://images.pexels.com/photos/5946601/pexels-photo-5946601.jpeg?auto=compress&cs=tinysrgb&w=400&h=300&fit=crop',
    detailedDescription: 'Banane plantain mûre, idéale pour la friture.',
  ),
  Product(
    name: 'Ananas',
    description: 'Ananas Victoria',
    price: '4.50€',
    imageUrl: 'https://images.pexels.com/photos/1587292/pexels-photo-1587292.jpeg?auto=compress&cs=tinysrgb&w=400&h=300&fit=crop',
    detailedDescription: 'Ananas doux et parfumé, goût exotique.',
  ),
  Product(
    name: 'Goyave',
    description: 'Goyave rose',
    price: '3.20€',
    imageUrl: 'https://images.pexels.com/photos/6270457/pexels-photo-6270457.jpeg?auto=compress&cs=tinysrgb&w=400&h=300&fit=crop',
    detailedDescription: 'Goyave sucrée, riche en vitamines.',
  ),
  Product(
    name: 'Papaye',
    description: 'Papaye verte',
    price: '2.90€',
    imageUrl: 'https://images.pexels.com/photos/6243255/pexels-photo-6243255.jpeg?auto=compress&cs=tinysrgb&w=400&h=300&fit=crop',
    detailedDescription: 'Papaye croquante, parfaite en salade.',
  ),
];

// URLs pour les images de catégories
const String fruitsCategoryImage = 'https://images.pexels.com/photos/1132047/pexels-photo-1132047.jpeg?auto=compress&cs=tinysrgb&w=400&h=300&fit=crop';
const String vegetablesCategoryImage = 'https://images.pexels.com/photos/842571/pexels-photo-842571.jpeg?auto=compress&cs=tinysrgb&w=400&h=300&fit=crop';

// Gestion du panier
class CartProvider extends ChangeNotifier {
  List<Product> _cartItems = [];

  List<Product> get cartItems => _cartItems;

  void addToCart(Product product) {
    _cartItems.add(product);
    notifyListeners();
  }

  void removeFromCart(Product product) {
    _cartItems.remove(product);
    notifyListeners();
  }

  int get itemCount => _cartItems.length;
}

// Provider
class AppProvider extends InheritedWidget {
  final CartProvider cartProvider;

  const AppProvider({
    Key? key,
    required this.cartProvider,
    required Widget child,
  }) : super(key: key, child: child);

  static CartProvider of(BuildContext context) {
    final provider = context.dependOnInheritedWidgetOfExactType<AppProvider>();
    return provider!.cartProvider;
  }

  @override
  bool updateShouldNotify(AppProvider oldWidget) {
    return cartProvider != oldWidget.cartProvider;
  }
}

// Drawer simple et fonctionnel
class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            height: 100,
            color: orangeBoutique,
            padding: const EdgeInsets.all(16),
            child: const Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                'MENU',
                style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.login),
            title: const Text('KONEKTE'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.list),
            title: const Text('LIS PWODUI'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProductListScreen()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('DEKONKTE'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}

// SCREEN 1: PAGE D'ACCUEIL (AKEY)
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: orangeBoutique,
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu, color: Colors.white),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        title: const Text(
          'Boutique Créole',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Center(
              child: Text(
                'PEYE',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
      drawer: const CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Section Catégories - Images les unes en dessous des autres
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  // Première catégorie
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Stack(
                      children: [
                        Image.network(
                          fruitsCategoryImage,
                          height: 180,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Container(
                              height: 180,
                              color: orangeBoutique.withOpacity(0.1),
                              child: const Center(
                                child: CircularProgressIndicator(color: orangeBoutique),
                              ),
                            );
                          },
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              height: 180,
                              color: orangeBoutique.withOpacity(0.1),
                              child: const Icon(Icons.broken_image, size: 50, color: orangeBoutique),
                            );
                          },
                        ),
                        Positioned(
                          bottom: 10,
                          right: 10,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 4,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: const Text(
                              'KATEGORI 1',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Deuxième catégorie
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Stack(
                      children: [
                        Image.network(
                          vegetablesCategoryImage,
                          height: 180,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Container(
                              height: 180,
                              color: Colors.green.shade50,
                              child: const Center(
                                child: CircularProgressIndicator(color: Colors.green),
                              ),
                            );
                          },
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              height: 180,
                              color: Colors.green.shade50,
                              child: const Icon(Icons.broken_image, size: 50, color: Colors.green),
                            );
                          },
                        ),
                        Positioned(
                          bottom: 10,
                          right: 10,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 4,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: const Text(
                              'KATEGORI 2',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
              child: Text(
                'PWODUI POPILÈ',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            ProductGrid(count: 4),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(currentIndex: 0),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CartScreen()),
          );
        },
        backgroundColor: orangeBoutique,
        foregroundColor: Colors.white,
        child: const Icon(Icons.shopping_cart),
      ),
    );
  }
}

// SCREEN 2: PAGE DÉTAIL PRODUIT (DETAY)
class ProductDetailScreen extends StatelessWidget {
  final Product product;

  const ProductDetailScreen({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: orangeBoutique,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'DETAY',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Center(
              child: Text(
                'PEYE',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              child: Image.network(
                product.imageUrl,
                width: double.infinity,
                height: 250,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Container(
                    height: 250,
                    color: orangeBoutique.withOpacity(0.1),
                    child: const Center(
                      child: CircularProgressIndicator(color: orangeBoutique),
                    ),
                  );
                },
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 250,
                    color: orangeBoutique.withOpacity(0.1),
                    child: const Icon(Icons.broken_image, size: 80, color: orangeBoutique),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    product.price,
                    style: const TextStyle(fontSize: 20, color: orangeBoutique, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'DESKRIPSYON',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    product.detailedDescription,
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () {
                      final cartProvider = AppProvider.of(context);
                      cartProvider.addToCart(product);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('${product.name} ajouté au panier')),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: orangeBoutique,
                      minimumSize: const Size(double.infinity, 50),
                    ),
                    child: const Text('AJOUTE AU PANYE', style: TextStyle(fontSize: 16, color: Colors.white)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(currentIndex: 1),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CartScreen()),
          );
        },
        backgroundColor: orangeBoutique,
        foregroundColor: Colors.white,
        child: const Icon(Icons.shopping_cart),
      ),
    );
  }
}

// SCREEN 3: LISTE PRODUITS (LIS PWODUI) - 6 produits seulement
class ProductListScreen extends StatelessWidget {
  const ProductListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: orangeBoutique,
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu, color: Colors.white),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        title: const Text(
          'LIS PWODUI',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Center(
              child: Text(
                'PEYE',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
      drawer: const CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.7,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemCount: 6,
          itemBuilder: (context, index) {
            final product = allProducts[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailScreen(product: product),
                  ),
                );
              },
              child: Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 3,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
                        ),
                        child: Image.network(
                          product.imageUrl,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Container(
                              color: orangeBoutique.withOpacity(0.1),
                              child: const Center(
                                child: CircularProgressIndicator(color: orangeBoutique),
                              ),
                            );
                          },
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              color: orangeBoutique.withOpacity(0.1),
                              child: const Icon(Icons.broken_image, size: 40, color: orangeBoutique),
                            );
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product.name,
                              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 2),
                            Text(
                              product.description,
                              style: const TextStyle(fontSize: 12, color: Colors.grey),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 2),
                            Text(
                              product.price,
                              style: const TextStyle(fontSize: 14, color: orangeBoutique, fontWeight: FontWeight.bold),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  icon: const Text('🛒'),
                                  onPressed: () {
                                    AppProvider.of(context).addToCart(product);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text('${product.name} ajouté au panier')),
                                    );
                                  },
                                ),
                                IconButton(
                                  icon: const Text('❤️'),
                                  onPressed: () {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(content: Text('Ajouté aux favoris')),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: const BottomNavBar(currentIndex: 2),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CartScreen()),
          );
        },
        backgroundColor: orangeBoutique,
        foregroundColor: Colors.white,
        child: const Icon(Icons.shopping_cart),
      ),
    );
  }
}

// SCREEN PANIER (PANYE) - AVEC SUPPRESSION INSTANTANÉE
class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartProvider = AppProvider.of(context);
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: orangeBoutique,
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu, color: Colors.white),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        title: const Text(
          'PANYE',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Center(
              child: Text(
                'PEYE',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
      drawer: const CustomDrawer(),
      body: AnimatedBuilder(
        animation: cartProvider,
        builder: (BuildContext context, Widget? child) {
          final cartItems = cartProvider.cartItems;
          
          if (cartItems.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.shopping_cart, size: 80, color: Colors.grey),
                  SizedBox(height: 16),
                  Text('Panye vid', style: TextStyle(fontSize: 18, color: Colors.grey)),
                ],
              ),
            );
          }
          
          return ListView.builder(
            itemCount: cartItems.length,
            itemBuilder: (context, index) {
              final product = cartItems[index];
              return ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    product.imageUrl,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Container(
                        width: 50,
                        height: 50,
                        color: orangeBoutique.withOpacity(0.1),
                        child: const Center(
                          child: CircularProgressIndicator(color: orangeBoutique),
                        ),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        width: 50,
                        height: 50,
                        color: orangeBoutique.withOpacity(0.1),
                        child: const Icon(Icons.broken_image, size: 30, color: orangeBoutique),
                      );
                    },
                  ),
                ),
                title: Text(product.name),
                subtitle: Text(product.price),
                trailing: IconButton(
                  icon: Icon(Icons.delete, color: orangeBoutique),
                  onPressed: () {
                    cartProvider.removeFromCart(product);
                  },
                ),
              );
            },
          );
        },
        child: const SizedBox.shrink(),
      ),
      bottomNavigationBar: const BottomNavBar(currentIndex: 1),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CartScreen()),
          );
        },
        backgroundColor: orangeBoutique,
        foregroundColor: Colors.white,
        child: const Icon(Icons.shopping_cart),
      ),
    );
  }
}

// Widget pour les produits en grille
class ProductGrid extends StatelessWidget {
  final int count;

  const ProductGrid({Key? key, required this.count}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(8.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.75,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: count,
      itemBuilder: (context, index) {
        final product = allProducts[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductDetailScreen(product: product),
              ),
            );
          },
          child: Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 3,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                    child: Image.network(
                      product.imageUrl,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Container(
                          color: orangeBoutique.withOpacity(0.1),
                          child: const Center(
                            child: CircularProgressIndicator(color: orangeBoutique),
                          ),
                        );
                      },
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: orangeBoutique.withOpacity(0.1),
                          child: const Icon(Icons.broken_image, size: 40, color: orangeBoutique),
                        );
                      },
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.name,
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 2),
                        Text(
                          product.description,
                          style: const TextStyle(fontSize: 11, color: Colors.grey),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 2),
                        Text(
                          product.price,
                          style: const TextStyle(fontSize: 13, color: orangeBoutique, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

// Barre de navigation fixe en bas
class BottomNavBar extends StatelessWidget {
  final int currentIndex;

  const BottomNavBar({Key? key, required this.currentIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: orangeBoutique,
      unselectedItemColor: Colors.grey,
      onTap: (index) {
        if (index == 0) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const HomeScreen()),
            (route) => false,
          );
        } else if (index == 1) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CartScreen()),
          );
        } else if (index == 2) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ProductListScreen()),
          );
        }
      },
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'AKEY'),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'PANYE'),
        BottomNavigationBarItem(icon: Icon(Icons.list), label: 'LIS PWODUI'),
      ],
    );
  }
}

// Application principale
class MyApp extends StatelessWidget {
  final CartProvider cartProvider = CartProvider();

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppProvider(
      cartProvider: cartProvider,
      child: MaterialApp(
        title: 'Boutique Créole',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Colors.white,
        ),
        home: const HomeScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
