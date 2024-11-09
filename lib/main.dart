import 'package:carousel_slider/carousel_slider.dart';
import 'package:cuberto_bottom_bar/cuberto_bottom_bar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: EcommerceScreen(),
    );
  }
}

class EcommerceScreen extends StatefulWidget {
  const EcommerceScreen({super.key});

  @override
  State<EcommerceScreen> createState() => _EcommerceScreenState();
}

class _EcommerceScreenState extends State<EcommerceScreen> {
  int _currentPage = 0;
  String _currentTitle = "Home";
  Color _currentColor = Colors.blue;
  final Color _inactiveColor = Colors.grey;
  final List<Map<String, dynamic>> imgList = [
    {
      "title": "50% Off",
      "subtitle": "On everything today",
      "description": "NIYT80",
      "price": "\$200.00"
    },
    {
      "title": "70% Off",
      "subtitle": "On everything today",
      "description": "NIYT80",
      "price": "\$200.00"
    },
    {
      "title": "40% Off",
      "subtitle": "On everything today",
      "description": "NIYT80",
      "price": "\$400.00"
    }
  ];

  // List of bottom navigation items
  final List<TabData> tabs = [
    TabData(
      iconData: Icons.home,
      title: "Home",
      tabColor: Colors.black,
    ),
    TabData(
      iconData: Icons.shopping_cart,
      title: "Cart",
      tabColor: Colors.black,
    ),
    TabData(
      iconData: Icons.notifications,
      title: "Notification",
      tabColor: Colors.black,
    ),
    TabData(
      iconData: Icons.person,
      title: "Profile",
      tabColor: Colors.black,
    ),
  ];

  // List of pages for navigation
  // final List<Widget> _pages = [
  //   const HomePage(),
  //   const CartPage(),
  //   const NotificationsPage(),
  //   const ProfilePage(),
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: const Icon(Icons.menu, color: Colors.black),
        actions: const [
          Icon(Icons.search, color: Colors.black),
          SizedBox(width: 16),
        ],
      ),
      // bottomNavigationBar: Container(
      //   height: 80,
      //   decoration: const BoxDecoration(
      //     borderRadius: BorderRadius.only(
      //         topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0)),
      //     color: Colors.amber,
      //     boxShadow: [
      //       BoxShadow(
      //         color: Colors.black12,
      //       ),
      //     ],
      //   ),
      //   child: ClipRRect(
      //     borderRadius: const BorderRadius.only(
      //       topLeft: Radius.circular(30.0),
      //       topRight: Radius.circular(30.0),
      //     ),
      //     child: BottomNavigationBar(
      //       backgroundColor: Colors.amber,
      //       currentIndex: 0,
      //       items: const [
      //         BottomNavigationBarItem(
      //           icon: Icon(Icons.home),
      //           label: 'Home',
      //         ),
      //         BottomNavigationBarItem(
      //           icon: Icon(Icons.favorite_border),
      //           label: 'Favorites',
      //         ),
      //         BottomNavigationBarItem(
      //           icon: Icon(Icons.person_outline),
      //           label: 'User',
      //         ),
      //       ],
      //     ),
      //   ),
      // ),

      bottomNavigationBar: CubertoBottomBar(
        key: const Key("BottomBar"),
        // inactiveIconColor: _inactiveColor,
        inactiveIconColor: Colors.black,

        tabStyle: CubertoTabStyle.styleFadedBackground,
        selectedTab: _currentPage,
        tabs: tabs
            .map(
              (value) => TabData(
                key: Key(value.title),
                iconData: value.iconData,
                // title: value.title,
                tabColor: value.tabColor,
                title: _currentPage == tabs.indexOf(value) ? value.title : "",
                // tabColor: Colors.black,
                // tabGradient: const LinearGradient(
                //   colors: [Colors.redAccent, Colors.white],
                //   begin: Alignment.topLeft,
                //   end: Alignment.bottomRight,
                // ),
              ),
            )
            .toList(),
        onTabChangedListener: (position, title, color) {
          setState(() {
            _currentPage = position;
            _currentTitle = title;
            if (color != null) {
              _currentColor = Colors.green;
            }
          });
        },
        barBackgroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        // selectedIconScale: 1.2,
        // selectedIconColor: Colors.black,
        // enableShadow: true,
        // shadowColor: Colors.grey.shade300,
        // shadowBlurRadius: 10,
        // curve: Curves.easeInOut,
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Promotions Section
              Container(
                  child: CarouselSlider(
                      options: CarouselOptions(
                        aspectRatio: 16 / 7,
                        viewportFraction: 0.6,
                        autoPlay: true,
                      ),
                      items: imgList
                          .map((item) => _buildPromotionCard(item["title"],
                              item["subtitle"], item["description"]))
                          .toList())),

              const SizedBox(height: 20),
              // New Arrivals Section
              _buildSectionHeader("New Arrivals"),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildProductCard(
                    imageUrl: 'assets/images/banner6.jpg',
                    title: "The Marc Jacobs",
                    subtitle: "Traveler Tote",
                    price: "\$195.00",
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  _buildProductCard(
                    imageUrl: 'assets/images/banner2.jpeg',
                    title: "Axel Arigato",
                    subtitle: "Clean 90 Triple Sneakers",
                    price: "\$245.00",
                  ),
                ],
              ),

              // Expanded(
              //   child: ListView.builder(
              //       scrollDirection: Axis.horizontal,
              //       itemCount: 2,
              //       itemBuilder: (BuildContext context, index) {
              //         return _buildProductCard(
              //           imageUrl: 'assets/images/banner2.jpeg',
              //           title: "Gia Borghini",
              //           subtitle: "FW Rosie 1 Sandals",
              //           price: "\$740.00",
              //         );
              //       }),
              // ),

              const SizedBox(height: 20),
              // Popular Section
              _buildSectionHeader("Popular"),
              const SizedBox(height: 10),
              _buildPopularProductCard(
                  imageUrl: "assets/images/banner5.jpg",
                  title: "Gia Borghini",
                  subtitle: "FW Rosie Sandals",
                  price: "\$740.00",
                  rating: 4.6),
              _buildPopularProductCard(
                  imageUrl: "assets/images/banner3.jpg",
                  title: "Gia Borghini",
                  subtitle: "FW Rosie Sandals",
                  price: "\$740.00",
                  rating: 4.6),
              _buildPopularProductCard(
                  imageUrl: "assets/images/banner4.jpg",
                  title: "Gia Borghini",
                  subtitle: "FW Rosie Sandals",
                  price: "\$740.00",
                  rating: 4.6)
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPromotionCard(String title, String description, String code) {
    return Container(
      // margin: const EdgeInsets.only(right: 2),
      // padding: const EdgeInsets.all(16),

      width: MediaQuery.of(context).size.width / 2,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(12),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: -70,
              child: Image.asset("assets/images/banner1.jpg",
                  height: 250, width: MediaQuery.of(context).size.width / 1.0),
            ),
            Positioned(
                top: 12,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(title,
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                              fontWeight: FontWeight.w900)),
                      const SizedBox(height: 4),
                      Text(description,
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.w600)),
                      const SizedBox(height: 4),
                      Text("With code: $code",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w400)),
                      const SizedBox(height: 8),
                      // Get Now Button
                      ElevatedButton(
                        onPressed: () {
                          // Define the button action here
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: 2,
                            horizontal: 22,
                          ),
                        ),
                        child: const Text(
                          'Get Now',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 2.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const Text("View All",
            style: TextStyle(fontSize: 14, color: Colors.grey)),
      ],
    );
  }

  Widget _buildProductCard(
      {required String imageUrl,
      required String title,
      required String subtitle,
      required String price}) {
    return Column(
      children: [
        Container(
          height: 120,
          width: MediaQuery.of(context).size.width / 2.3,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.grey[300],
            image: DecorationImage(
              image: AssetImage(imageUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(title,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
        Text(subtitle,
            style: const TextStyle(fontSize: 12, color: Colors.grey)),
        Text(price,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _buildPopularProductCard(
      {required String imageUrl,
      required String title,
      required String subtitle,
      required String price,
      required double rating}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Image Container
          Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.grey[300],
              image: DecorationImage(
                image: AssetImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 16),

          // Title and Rating
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.amber, size: 19),
                    const SizedBox(width: 4),
                    Text(
                      "$rating",
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ],
            ),
          ),

          // Price Text
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              price,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
    // return Container(
    //   padding: const EdgeInsets.all(16),
    //   decoration: BoxDecoration(
    //     color: Colors.white,
    //     borderRadius: BorderRadius.circular(12),
    //   ),
    //   child: Row(
    //     children: [
    //       Container(
    //         height: 80,
    //         width: 80,
    //         decoration: BoxDecoration(
    //           borderRadius: BorderRadius.circular(12),
    //           color: Colors.grey[300],
    //           image: DecorationImage(
    //             image: AssetImage(imageUrl),
    //             fit: BoxFit.cover,
    //           ),
    //         ),
    //       ),
    //       const SizedBox(width: 16),
    //       Column(
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: [
    //           Text(title,
    //               style: const TextStyle(
    //                   fontSize: 14, fontWeight: FontWeight.bold)),
    //           Text(subtitle,
    //               style: const TextStyle(fontSize: 12, color: Colors.grey)),
    //           // Price Text
    //           Row(
    //             children: [
    //               const Icon(Icons.star, color: Colors.amber, size: 16),
    //               const SizedBox(width: 4),
    //               Text("$rating", style: const TextStyle(fontSize: 12)),
    //             ],
    //           ),
    //           Align(
    //             alignment: Alignment.centerRight,
    //             child: Text(price,
    //                 style: const TextStyle(
    //                     fontSize: 14, fontWeight: FontWeight.bold)),
    //           )
    //         ],
    //       ),
    //     ],
    //   ),
    // );
  }
}
