import 'package:flutter/material.dart';

class ProductPage extends StatefulWidget {
  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite_border, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                'assets/sneaker.png', // replace with your image path
                height: 200,
              ),
            ),
            SizedBox(height: 16),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.circle, size: 8, color: Colors.grey[400]),
                  SizedBox(width: 8),
                  Icon(Icons.circle, size: 8, color: Colors.grey[400]),
                  SizedBox(width: 8),
                  Icon(Icons.circle, size: 8, color: Colors.black),
                ],
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Axel Arigato',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              'Clean 90 Triple Sneakers',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.star, color: Colors.amber, size: 20),
                Text(
                  '4.5',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  ' (270 Review)',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(
              'Size',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [39, 39.5, 40, 40.5, 41].map((size) {
                return ChoiceChip(
                  label: Text(size.toString()),
                  selected: size == 41, // default selected size
                  onSelected: (selected) {},
                );
              }).toList(),
            ),
            SizedBox(height: 16),
            Text(
              'Description',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Engineered to crush any movement-based workout, these '
              'sneakers enhance the label\'s original Cloud sneaker '
              'with cutting edge technologies for a pair.',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$245.00',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                    iconColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'Add to cart',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
