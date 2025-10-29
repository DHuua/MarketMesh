import 'package:flutter/material.dart';
import 'category_list.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffF15A24),
        toolbarHeight: 97,
        titleSpacing: 0.0,
        automaticallyImplyLeading: false,
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
                  color: Color(0xff797979),
                ),
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
                  ),
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
            // Auto & Motorcycle Section
            _buildCategorySection(
              context,
              'Auto & Motorcycle',
              [
                {'name': 'Health', 'items': '387 Items', 'image': 'assets/health.png'},
                {'name': 'Electronics', 'items': '2089 Items', 'image': 'assets/electronics.png'},
              ],
            ),

            // Fashion Accessories Section
            _buildCategorySection(
              context,
              'Fashion Accessories',
              [
                {'name': 'Climbing\ngloves', 'items': '154 Items', 'image': 'assets/climbing_gloves.png'},
              ],
            ),

            // Sports & Outdoors Section
            _buildCategorySection(
              context,
              'Sports & Outdoors',
              [
                {'name': 'Health', 'items': '387 Items', 'image': 'assets/health.png'},
                {'name': 'Appliances', 'items': '3512 Items', 'image': 'assets/appliances.png'},
                {'name': 'Automobiles', 'items': '1622 Items', 'image': 'assets/automobiles.png'},
              ],
            ),

            // Health & Beauty Section
            _buildCategorySection(
              context,
              'Health & Beauty',
              [
                {'name': 'Automobiles', 'items': '1622 Items', 'image': 'assets/automobiles.png'},
                {'name': 'Health', 'items': '387 Items', 'image': 'assets/health.png'},
                {'name': 'Climbing\ngloves', 'items': '154 Items', 'image': 'assets/climbing_gloves.png'},
              ],
            ),

            // Pet Supplies Section
            _buildCategorySection(
              context,
              'Pet Supplies',
              [
                {'name': 'Automobiles', 'items': '1622 Items', 'image': 'assets/automobiles.png'},
                {'name': 'Health', 'items': '387 Items', 'image': 'assets/health.png'},
                {'name': 'Climbing\ngloves', 'items': '154 Items', 'image': 'assets/climbing_gloves.png'},
              ],
            ),

            const SizedBox(height: 80),
          ],
        ),
      ),
    );
  }

  Widget _buildCategorySection(BuildContext context, String title, List<Map<String, String>> categories) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
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
                      builder: (context) => CategoryListPage(categoryName: title),
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
          height: 140,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final category = categories[index];
              return _buildCategoryCard(
                context,
                category['name']!,
                category['items']!,
                category['image']!,
              );
            },
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  Widget _buildCategoryCard(BuildContext context, String name, String items, String imagePath) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoryListPage(categoryName: name),
          ),
        );
      },
      child: Container(
        width: 120,
        margin: const EdgeInsets.only(right: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image(
                image: AssetImage(imagePath),
                height: 70,
                width: 100,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              items,
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 11,
                color: Colors.grey[500],
              ),
            ),
          ],
        ),
      ),
    );
  }
}