import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

const Color orangeBoutique = Color(0xFFFF9800);

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

final List<Product> allProducts = [
  Product(
    name: 'Mango',
    description: 'Mango dous, fre, sòti nan jaden.',
    price: '115 HTG',
    imageUrl: 'https://st5.depositphotos.com/1027198/75356/i/1600/depositphotos_753566180-stock-photo-sliced-mango-healthy-eating-tropical.jpg',
    detailedDescription: 'Mango se yon fwi twopikal ki gen anpil vitmin. Li gen yon gou dous ak yon odè ki atire anpil moun. Moun renmen li paske li ka manje lè l mi, melanje nan ji, oswa fè konfiti. Gen plizyè kalite mango tankou francisque, pòm, ak madanm franç. Se yon fwi ki vann byen toupatou, sitou pandan sezon li.',
  ),
  Product(
    name: 'Papay',
    description: 'Papay mi dous, bon pou dijestif ou.',
    price: '150 HTG',
    imageUrl: 'https://static9.depositphotos.com/1030327/1220/i/950/depositphotos_12206614-stock-photo-papaya.jpg',
    detailedDescription: 'Papay se yon fwi ki rich an vitmin ak antioksidan. Moun konn manje l lè l mi byen jòn, oswa vèt nan salad. Li ede dijestif gras a anzim ki nan li. Anpil moun renmen l paske li pa twò dous e li bay enèji. Nan E-commerce, papay ka vann kòm fwi fre, siwo, oswa grenn seche.',
  ),
  Product(
    name: 'Korosol',
    description: 'Kowosol blan, dous, bon pou ji.',
    price: '100 HTG',
    imageUrl: 'https://st3.depositphotos.com/1561509/36320/i/1600/depositphotos_363207328-stock-photo-green-fresh-tropical-fruit-soursop.jpg',
    detailedDescription: 'Kowosol se yon fwi ki gen po vèt ak pikan, andedan li blan ak grenn nwa. Li gen yon gou dous ak yon sant espesyal. Anpil moun renmen l fè ji, krèm, oswa sòbè. Gen moun ki sèvi ak fey li pou fè te medsinat. Se yon fwi ki mande pou byen mi anvan ou manje l.',
  ),
  Product(
    name: 'Anana',
    description: 'Anana jòn, fre, anpil ji dous.',
    price: '250 HTG',
    imageUrl: 'https://st4.depositphotos.com/13324256/37918/i/1600/depositphotos_379189128-stock-photo-fresh-pineapple-juice-cut-delicious.jpg',
    detailedDescription: 'Anana se yon fwi ki soti nan plant ki grandi atè. Li gen po epè ak je, epi andedan li jòn ak anpil ji. Moun renmen l paske li dous ak yon ti asid. Yo manje l kri, fè ji, salad, oswa griye l. Li rich an vitmin C e li bon pou iminitè. Nan sit entènèt ou a, anana ka vin tounen yon gwo vant.',
  ),
  Product(
    name: 'Pom',
    description: 'Pòm frans, bon nan bouch',
    price: '150 HTG',
    imageUrl: 'https://static3.depositphotos.com/1009397/260/i/950/depositphotos_2606345-stock-photo-apples.jpg',
    detailedDescription: 'Pòm se yon fwi importe ki anpil moun renmen. Li gen yon po fen, epi andedan li blan ak yon ti dousè. Gen divès koulè tankou wouj, vèt, jòn. Timoun renmen l paske li fasil pou pote nan lekòl. Li ka manje kri, kwit, oswa fè ji. Pòm se yon fwi ki vann tout ane san pwoblèm.',
  ),
  Product(
    name: 'Rezen',
    description: 'Rezen dous, ti grenn, bèl prezantasyon.',
    price: '95 HTG',
    imageUrl: 'https://st2.depositphotos.com/1001348/5498/i/950/depositphotos_54981155-stock-photo-bunch-of-ripe-red-grapes.jpg',
    detailedDescription: 'Rezen se yon fwi importe ki fèt an grap. Gen koulè vèt ak wouj, tou de dous anpil. Moun renmen l paske li fasil pou lave ak manje. Se yon fwi ki fè bèl sou tab, nan fèt, oswa asosye ak fwomaj. Li ka sèvi tou fè ji, konfiti, oswa vin seche. Nan E-commerce, li vann byen lè byen prezante ak foto klè.',
  ),
];

const String fruitsCategoryImage = 'https://st4.depositphotos.com/17897224/19898/i/1600/depositphotos_198982256-stock-photo-selective-focus-pile-yellow-mangoes.jpg';
const String vegetablesCategoryImage = 'https://st.depositphotos.com/2215986/2346/i/950/depositphotos_23460924-stock-photo-banana.jpg';
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
            title: const Text('LIS FWI'),
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
            title: const Text('DEKONEKTE'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}

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
          'Boutik KREYOL',
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
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
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
                'LIS FWI',
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
                        SnackBar(content: Text('${product.name} Ajoute nan panye a')),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: orangeBoutique,
                      minimumSize: const Size(double.infinity, 50),
                    ),
                    child: const Text('AJOUTE NAN PANYE', style: TextStyle(fontSize: 16, color: Colors.white)),
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
                                      SnackBar(content: Text('${product.name} ajoute nan panye a')),
                                    );
                                  },
                                ),
                                IconButton(
                                  icon: const Text('❤️'),
                                  onPressed: () {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(content: Text('Ajoute pami prefere yo')),
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
                  Text('Panye w la vid', style: TextStyle(fontSize: 18, color: Colors.grey)),
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
        BottomNavigationBarItem(icon: Icon(Icons.list), label: 'LIS FWI'),
      ],
    );
  }
}

class MyApp extends StatelessWidget {
  final CartProvider cartProvider = CartProvider();

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppProvider(
      cartProvider: cartProvider,
      child: MaterialApp(
        title: 'Boutik KREYOL',
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
