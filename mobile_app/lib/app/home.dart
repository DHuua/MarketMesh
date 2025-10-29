import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'categories.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomeContent(),
    const CategoriesPage(),
    const SearchPage(),
    const Center(child: Text('Account Page')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFFFF6B3D),
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Category',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffF15A24),
        toolbarHeight: 97,
        titleSpacing: 0.0,
        title: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            height: 45.0,
            decoration: BoxDecoration(
              color: Color(0xffEEF0F2),
              borderRadius: BorderRadius.circular(23.0),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 14, 16, 8),
              child: TextField(
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w500,
                  color: Color(0xff000000),
                ),
                onSubmitted: (value) {
                  if (value.trim().isEmpty) return;
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => SearchPage(initialQuery: value.trim()),
                    ),
                  );
                },
                decoration: InputDecoration(
                  hintText: 'What are you searching for ...',
                  border: InputBorder.none,
                  suffixIcon: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 4),
                    child: Image.asset(
                      'assets/magnifying_glass.png',
                      fit: BoxFit.fitHeight,
                      color: Color(0xFFFF6B3D),
                    ),
                  )
                ),
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Categories Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Top Categories',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CategoriesPage(),
                        ),
                      );
                    },
                    child: const Text(
                      'View All',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Color(0xFFFF6B3D),
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 190,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  _buildCategoryCard(
                    'Automobiles',
                    '1622 Items',
                    'assets/automobiles.png',
                    Colors.grey[700]!,
                  ),
                  _buildCategoryCard(
                    'Health',
                    '387 Items',
                    'assets/health.png',
                    Colors.red,
                  ),
                  _buildCategoryCard(
                    'Climbing\ngloves',
                    '154 Items',
                    'assets/climbing_gloves.png',
                    Colors.brown,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 2),

            // Featured Products Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Featured Products',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'View All',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Color(0xFFFF6B3D),
                        fontSize: 14,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => ProductDetailsPage(
                                  name: 'Product Name Lorem ipsum dolor sit amet...',
                                  price: '\$49.99',
                                  imagePath: 'assets/health.png',
                                  category: 'Health',
                                ),
                              ),
                            );
                          },
                          child: _buildProductCard(
                          'Product Name Lorem ipsum dolor sit amet...',
                          '\$49.99',
                          'assets/health.png',
                          Colors.red,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => ProductDetailsPage(
                                  name: 'Product Name',
                                  price: '\$410.99',
                                  imagePath: 'assets/automobiles.png',
                                  category: 'Automobiles',
                                ),
                              ),
                            );
                          },
                          child: _buildProductCard(
                          'Product Name',
                          '\$410.99',
                          'assets/automobiles.png',
                          Colors.grey[700]!,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => ProductDetailsPage(
                                  name: 'Product Name',
                                  price: '\$412.99',
                                  imagePath: 'assets/product_image.png',
                                  category: 'General',
                                ),
                              ),
                            );
                          },
                          child: _buildProductCard(
                          'Product Name',
                          '\$412.99',
                          'assets/product_image.png',
                          Colors.grey[400]!,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => ProductDetailsPage(
                                  name: 'Product Name',
                                  price: '\$48.99',
                                  imagePath: 'assets/climbing_gloves.png',
                                  category: 'Climbing',
                                ),
                              ),
                            );
                          },
                          child: _buildProductCard(
                          'Product Name',
                          '\$48.99',
                          'assets/climbing_gloves.png',
                          Colors.brown,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Top Seller This Week Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Top Seller This Week',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 130,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  _buildSellerCard(
                    'Seller Name',
                    'Kitchen, Garden, Kids',
                    'assets/seller1.png',
                  ),
                  _buildSellerCard(
                    'Seller Name',
                    'Beauty, Fashion',
                    'assets/seller2.png',
                  ),
                  _buildSellerCard(
                    'Seller Name',
                    'Car, Tools, Ve...',
                    'assets/seller3.png',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Hot Offers Today Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Text(
                        'Hot Offers Today ',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Text(
                        '🔥',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: _buildOfferCard(
                          'assets/offer1.png',
                          340,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _buildOfferCard(
                          'assets/offer2.png',
                          340,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: _buildOfferCard(
                          'assets/offer3.png',
                          260,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _buildOfferCard(
                          'assets/offer4.png',
                          260,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // You May Like Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'You May Like',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'View All',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Color(0xFFFF6B3D),
                        fontSize: 14,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 240,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  _buildYouMayLikeCard(
                    'Product Name\nLorem ipsum dolor...',
                    '\$162.8',
                    'assets/product1.png',
                  ),
                  _buildYouMayLikeCard(
                    'Product Name\nLorem ipsum dolor...',
                    '\$162.8',
                    'assets/product1.png',
                  ),
                  _buildYouMayLikeCard(
                    'Product Name\nLorem ipsum dolor...',
                    '\$162.8',
                    'assets/product1.png',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 80),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryCard(String title, String items, String imagePath, Color color) {
    return Container(
      width: 150,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: Color(0xffeef0f2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image(
              image: AssetImage(
                imagePath,
              )
            )
          ),
          const SizedBox(height: 10),
          Text( 
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            items,
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 12,
              color: Colors.grey[500],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductCard(String name, String price, String imagePath, Color color) {
    return Container(
      height: 260,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(topLeft: Radius.circular(12.0), topRight: Radius.circular(12.0)),
            child: Image(
              height: 160,
              width: double.infinity,
              fit: BoxFit.cover,
              image: AssetImage(
                imagePath,
              )
            )
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 14,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Text(
                  price,
                  style: const TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFFF6B3D),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSellerCard(String name, String categories, String imagePath) {
    return Container(
      width: 120,
      margin: const EdgeInsets.only(right: 12),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image(
              image: AssetImage(imagePath),
              height: 70,
              width: 120,
              fit: BoxFit.cover,
            )
          ),
          const SizedBox(height: 6),
          Text(
            name,
            style: const TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            categories,
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 10,
              color: Colors.grey[500],
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildOfferCard(String imagePath, double height) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image(
        image: AssetImage(imagePath),
        height: height,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildYouMayLikeCard(String name, String price, String imagePath) {
    return Container(
      width: 140,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(topLeft: Radius.circular(12.0), topRight: Radius.circular(12.0)),
            child: Image(
              height: 140,
              width: double.infinity,
              fit: BoxFit.cover,
              image: AssetImage(imagePath)
            )
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 13,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 6),
                Text(
                  price,
                  style: const TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFFF6B3D),
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

class SearchPage extends StatefulWidget {
  final String? initialQuery;
  const SearchPage({super.key, this.initialQuery});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _controller = TextEditingController();
  Future<List<dynamic>>? _futureResults;

  // Set this to your friend's LAN IP or an ngrok URL if backend is remote
  // Example: 'http://192.168.1.50:8080' or 'https://your-ngrok-id.ngrok-free.app'
  static const String kCustomApiBase = 'http://10.47.112.96:8080';

  String _resolveApiBase() {
    if (kCustomApiBase.isNotEmpty) return kCustomApiBase;
    if (kIsWeb) return 'http://localhost:8080';
    if (defaultTargetPlatform == TargetPlatform.android) return 'http://10.0.2.2:8080';
    return 'http://localhost:8080';
  }

  @override
  void initState() {
    super.initState();
    if (widget.initialQuery != null && widget.initialQuery!.isNotEmpty) {
      _controller.text = widget.initialQuery!;
      _futureResults = _searchOrAll(widget.initialQuery!);
    } else {
      _futureResults = _searchOrAll('');
    }
  }

  Future<List<dynamic>> _searchOrAll(String query) async {
    final base = _resolveApiBase();
    final bool doSearch = query.trim().isNotEmpty;
    final uri = doSearch
        ? Uri.parse('$base/api/products/search').replace(queryParameters: {'query': query})
        : Uri.parse('$base/api/products');
    final res = await http.get(uri);
    if (res.statusCode != 200) {
      throw Exception('Search failed (${res.statusCode})');
    }
    final data = jsonDecode(res.body);
    if (data is List) return data;
    return <dynamic>[];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 97,
        backgroundColor: Color(0xffF15A24),
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 8.0),
          child: Container(
            height: 45.0,
            decoration: BoxDecoration(
              color: Color(0xffEEF0F2),
              borderRadius: BorderRadius.circular(23.0),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 14, 16, 8),
              child: TextField(
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w500,
                  color: Color(0xff000000),
                ),
                onSubmitted: (value) {
                  if (value.trim().isEmpty) return;
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => SearchPage(initialQuery: value.trim()),
                    ),
                  );
                },
                decoration: InputDecoration(
                  hintText: 'What are you searching for ...',
                  border: InputBorder.none,
                  suffixIcon: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 4),
                    child: Image.asset(
                      'assets/magnifying_glass.png',
                      fit: BoxFit.fitHeight,
                      color: Color(0xFFFF6B3D),
                    ),
                  )
                ),
              ),
            ),
          ),
        ),
      ),
      body: _futureResults == null
          ? const Center(
              child: Text(
                'Type and press search',
                style: TextStyle(fontFamily: 'Montserrat'),
              ),
            )
          : FutureBuilder<List<dynamic>>(
              future: _futureResults,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return Center(
                    child: Text(
                      'Error: ${snapshot.error}',
                      style: const TextStyle(fontFamily: 'Montserrat'),
                    ),
                  );
                }
                final results = snapshot.data ?? <dynamic>[];
                if (results.isEmpty) {
                  return const Center(
                    child: Text(
                      'No results',
                      style: TextStyle(fontFamily: 'Montserrat'),
                    ),
                  );
                }
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      childAspectRatio: 0.72,
                    ),
                    itemCount: results.length,
                    itemBuilder: (context, index) {
                      final item = results[index] as Map<String, dynamic>;
                      final name = (item['name'] ?? '').toString();
                      final priceValue = (item['price'] ?? '').toString();
                      final price = priceValue.isNotEmpty ? '\$'+priceValue : '0.00';
                      // Images are not provided by backend yet; use default asset
                      final imagePath = 'assets/product1.png';
                      final category = (item['category'] ?? '').toString();
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => ProductDetailsPage(
                                name: name,
                                price: price.startsWith('\u0000') ? price : (price.startsWith('\$') ? price : '\$'+price),
                                imagePath: imagePath,
                                category: category,
                                shopName: (item['shopName'] ?? '').toString(),
                                contact: (item['contact'] ?? '').toString(),
                                mobile: (item['mobile'] ?? '').toString(),
                                packing: (item['packing'] ?? '').toString(),
                                placeOfOrigin: (item['placeOfOrigin'] ?? '').toString(),
                                description: (item['description'] ?? '').toString(),
                              ),
                            ),
                          );
                        },
                        child: HomeContent()._buildProductCard(name, price, imagePath, Colors.grey),
                      );
                    },
                  ),
                );
              },
            ),
    );
  }
}

class ProductDetailsPage extends StatelessWidget {
  final String name;
  final String price;
  final String imagePath;
  final String category;
  final String shopName;
  final String contact;
  final String mobile;
  final String packing;
  final String placeOfOrigin;
  final String description;

  const ProductDetailsPage({
    super.key,
    required this.name,
    required this.price,
    required this.imagePath,
    required this.category,
    this.shopName = '',
    this.contact = '',
    this.mobile = '',
    this.packing = '',
    this.placeOfOrigin = '',
    this.description = '',
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffF15A24),
        title: const Text('Product Details', style: TextStyle(fontFamily: 'Montserrat')),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(
              image: AssetImage(imagePath),
              width: double.infinity,
              height: 240,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    price.startsWith('\$') ? price : price,
                    style: const TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFFF6B3D),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    category,
                    style: const TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 13,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Supplier Information:',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 8),
                  _kv('Shop Name', shopName),
                  _kv('Contact', contact),
                  _kv('Mobile', mobile),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xffF15A24),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                      onPressed: () {},
                      child: const Text('Visit Shop', style: TextStyle(fontFamily: 'Montserrat', color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600)),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Product Details:',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 8),
                  _kv('Product Name', name),
                  _kv('Price', price),
                  _kv('Category', category),
                  _kv('Packing', packing),
                  _kv('Place of Origin', placeOfOrigin),
                  _kv('Description', description),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _kv(String keyLabel, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              keyLabel+':',
              style: const TextStyle(
                fontFamily: 'Montserrat',
                color: Colors.grey,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontFamily: 'Montserrat'),
            ),
          ),
        ],
      ),
    );
  }
}