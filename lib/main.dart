import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:slide_countdown/slide_countdown.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon:
                  Image.asset('assets/icons/home1.png', width: 24, height: 24),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon:
                  Image.asset('assets/icons/heart.png', width: 24, height: 24),
              label: 'Save',
            ),
            BottomNavigationBarItem(
              icon: Image.asset('assets/icons/shopping_cart.png',
                  width: 24, height: 24),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Image.asset('assets/icons/profile.png',
                  width: 24, height: 24),
              label: 'Profile',
            ),
          ],
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          showSelectedLabels: true,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
        body: const Center(
            child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Header(),
              ImageAdd(),
              Sale(),
              Categories(),
              Offers(),
              BrandAdd(),
              Summer(),
              Footer()
            ],
          ),
        )),
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({super.key});

  void onCategoryTap(String category) {
    print('Tapped on $category');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 393,
          height: 211,
          child: Stack(
            children: [
              _buildBackgroundContainer(),
              _buildSearchBar(),
              _buildAddressSection(),
              _buildProfileIcon(),
              _buildCategoryScrollView(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBackgroundContainer() {
    return Positioned(
      left: 0,
      top: 0,
      child: Container(
        width: 393,
        height: 211,
        clipBehavior: Clip.antiAlias,
        decoration: const ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(33),
              topRight: Radius.circular(33),
            ),
          ),
          shadows: [
            BoxShadow(
              color: Color(0x3F343333),
              blurRadius: 4,
              offset: Offset(0, 5),
              spreadRadius: -1,
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildSearchBar() {
    return Positioned(
      left: 11,
      top: 99,
      child: SizedBox(
        width: 372,
        height: 49,
        child: Container(
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 1, color: Color(0xFFD7D7D7)),
              borderRadius: BorderRadius.circular(13),
            ),
          ),
          child: Row(
            children: [
              const SizedBox(width: 10),
              IconButton(
                icon: const Icon(Icons.search, color: Colors.blue),
                onPressed: () => print('Search icon pressed'),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: TextField(
                  decoration: const InputDecoration(
                    hintText: 'Search for “Pair of Shoe”',
                    border: InputBorder.none,
                  ),
                  onSubmitted: (query) => print('Searching for: $query'),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.mic, color: Colors.blue),
                onPressed: () => print('Microphone icon pressed'),
              ),
              const SizedBox(width: 10),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAddressSection() {
    return Positioned(
      top: 30,
      left: 28,
      child: SizedBox(
        width: 233,
        height: 70,
        child: Row(
          children: [
            _buildDaySelector(),
            const SizedBox(width: 8.0),
            _buildAddressInput(),
          ],
        ),
      ),
    );
  }

  Widget _buildDaySelector() {
    return Container(
      width: 38,
      height: 39,
      decoration: BoxDecoration(
        color: const Color(0xFF3E77FF),
        borderRadius: BorderRadius.circular(13),
      ),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '2',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFFF3F3F3),
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            'Day',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFFF3F3F3),
              fontSize: 10,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildAddressInput() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Delivery to Flat',
            style: TextStyle(
              color: Color(0xFF292929),
              fontSize: 17,
              fontWeight: FontWeight.w700,
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  initialValue: 'Random address 110 block A',
                  style: const TextStyle(
                    color: Color(0xFF5F5F5F),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.edit, color: Color(0xFF5F5F5F)),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProfileIcon() {
    return Positioned(
      left: 349,
      top: 52,
      child: InkWell(
        onTap: () => print('Icon button pressed'),
        child: Container(
          width: 24,
          height: 24,
          child: Image.asset('assets/images/Vector.png'),
        ),
      ),
    );
  }

  Widget _buildCategoryScrollView() {
    return Positioned(
      left: 11,
      top: 155,
      child: SizedBox(
        width: 600,
        height: 50,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              CategoryItem(
                imagePath: 'assets/images/all.png',
                label: 'All',
                onTap: () => onCategoryTap('All'),
              ),
              const SizedBox(width: 10),
              CategoryItem(
                imagePath: 'assets/images/sale.png',
                label: 'Sale',
                onTap: () => onCategoryTap('Sale'),
              ),
              const SizedBox(width: 10),
              CategoryItem(
                imagePath: 'assets/images/men.png',
                label: 'Mens',
                onTap: () => onCategoryTap('Mens'),
              ),
              const SizedBox(width: 10),
              CategoryItem(
                imagePath: 'assets/images/girls.png',
                label: 'Women',
                onTap: () => onCategoryTap('Women'),
              ),
              const SizedBox(width: 10),
              CategoryItem(
                imagePath: 'assets/images/all.png',
                label: 'Kids',
                onTap: () => onCategoryTap('Kids'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final String imagePath;
  final String label;
  final VoidCallback onTap;

  const CategoryItem({super.key, 
    required this.imagePath,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: ShapeDecoration(
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.fill,
              ),
              shape: const OvalBorder(),
            ),
          ),
          const SizedBox(width: 8),
          SizedBox(
            height: 18,
            child: Text(
              label,
              style: const TextStyle(
                color: Color(0xFF707070),
                fontSize: 16,
                fontFamily: 'SF Pro Text',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ImageAdd extends StatelessWidget {
  const ImageAdd({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Opacity(
          opacity: 1,
          child: Container(
            width: 392.36,
            height: 232,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/addviertise.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class Sale extends StatelessWidget {
  final Duration _duration = const Duration(hours: 4);

  const Sale({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      color: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Lottie.asset(
            'assets/animations/AnimationSale.json',
            width: 80, // Adjust width as needed
            height: 80, // Adjust height as needed
            fit: BoxFit.cover,
          ),
          const Text(
            'Flash Sale',
            style: TextStyle(
              color: Color(0xFF202020),
              fontSize: 21,
              fontFamily: 'SF Pro Text',
              fontWeight: FontWeight.w700,
              letterSpacing: -0.21,
            ),
          ),
          Row(
            children: [
              Container(
                width: 17.10,
                height: 19.95,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/clock.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(width: 8.0),
              Container(
                color: Colors.white,
                child: SlideCountdown(
                  duration: _duration,
                  slideDirection: SlideDirection.up,
                  separator: ':',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 358,
          height: 242,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              _buildRow([
                'assets/images/image100.png',
                'assets/images/image101.png',
                'assets/images/image102.png'
              ]),
              const SizedBox(height: 6),
              _buildRow([
                'assets/images/image103.png',
                'assets/images/image104.png',
                'assets/images/image105.png'
              ]),
            ],
          ),
        ),
      ],
    );
  }

  Row _buildRow(List<String> imagePaths) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(3, (index) => _buildCard(imagePaths[index])),
    );
  }

  Widget _buildCard(String imagePath) {
    return Container(
      width: 114,
      height: 118,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(13),
      ),
      child: Stack(
        children: [
          Positioned(
            left: 9,
            top: 9,
            child: Container(
              width: 95,
              height: 95,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(6),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 30,
              decoration: const BoxDecoration(
                color: Color(0xFF111111),
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(13),
                ),
              ),
              alignment: Alignment.center,
              child: const Text(
                '50% off',
                style: TextStyle(
                  color: Color(0xFFDADADA),
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Offers extends StatelessWidget {
  const Offers({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 391.95,
      height: 171.72,
      child: Stack(
        children: [
          Container(
            color: Colors.blue[50],
          ),
          Positioned.fill(
            right: 220.00,
            left: 0,
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/background_image.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const Positioned(
            left: 197.34,
            top: 22.56,
            child: Text(
              'CHOOSE YOUR LOOK',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.05,
                fontFamily: 'Oswald',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const Positioned(
            left: 197.54,
            top: 74.78,
            child: Text(
              'See our clothing collections',
              style: TextStyle(
                color: Colors.black,
                fontSize: 12.53,
                fontFamily: 'Roboto Light',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Positioned(
            left: 197.62,
            top: 107.79,
            child: InkWell(
              onTap: () {
                print('See Offers button tapped!');
              },
              child: Container(
                width: 114.22,
                height: 40.11,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 1),
                  borderRadius: BorderRadius.circular(5),
                ),
                alignment: Alignment.center,
                child: const Text(
                  'SEE OFFERS',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12.53,
                    fontFamily: 'Oswald',
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.63,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BrandAdd extends StatelessWidget {
  const BrandAdd({super.key});

  @override
  Widget build(BuildContext context) {
    final images = [
      'assets/images/image11.png',
      'assets/images/image12.png',
      'assets/images/image13.png',
      'assets/images/image14.png',
      'assets/images/image15.png',
      'assets/images/image16.png',
    ];

    return Column(
      children: [
        Container(
          width: 393,
          height: 473,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/back.png'),
              fit: BoxFit.fill,
            ),
          ),
          child: Stack(
            children: [
              const Positioned(
                left: 6,
                top: 21,
                child: Text(
                  'THE ULTIMATE',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const Positioned(
                left: 6,
                top: 40,
                child: Text(
                  'BRAND BRIGADE',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 32,
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Positioned(
                left: 13,
                top: 98,
                child: SizedBox(
                  width: 367,
                  height: 353,
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 14,
                      crossAxisSpacing: 14,
                      childAspectRatio: 114 / 171,
                    ),
                    itemCount: images.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          print('Tapped on ${images[index]}');
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(images[index]),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class Summer extends StatelessWidget {
  const Summer({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 393,
          height: 636.53,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/Summer_back.png'),
              // Add your background image here
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          left: 70,
          top: 39,
          child: SizedBox(
            width: 250.64,
            height: 267.81,
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  top: 15.77,
                  child: Container(
                    width: 150.37,
                    height: 235.90,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage('assets/images/girl2.png'),
                        fit: BoxFit.fill,
                      ),
                      borderRadius: BorderRadius.circular(13),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x3F000000),
                          blurRadius: 31.05,
                          offset: Offset(12.94, 12.94),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 81.88,
                  top: 0,
                  child: Container(
                    width: 168.76,
                    height: 267.81,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage('assets/images/girl1.png'),
                        fit: BoxFit.fill,
                      ),
                      borderRadius: BorderRadius.circular(13),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x3F000000),
                          blurRadius: 31.05,
                          offset: Offset(12.94, 12.94),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const Positioned(
          left: 17.19,
          top: 331.20,
          child: SizedBox(
            width: 358.61,
            height: 145.84,
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'SUMMER SALE GET 30% OFF ON ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 41.40,
                      fontFamily: 'Oswald',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextSpan(
                    text: 'ALL APPARELS.',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 41.40,
                      fontFamily: 'Oswald',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Positioned(
          left: 126.50,
          top: 500.16,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              side: const BorderSide(width: 1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(13),
              ),
              padding: EdgeInsets.zero,
            ),
            onPressed: () {
            },
            child: const SizedBox(
              width: 141.23,
              height: 53.04,
              child: Center(
                child: Text(
                  'SHOP NOW',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.11,
                    fontFamily: 'Oswald',
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.65,
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          left: 17.19,
          top: 569.25,
          child: Container(
            width: 50.35,
            height: 53.04,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.9),
              borderRadius: BorderRadius.circular(4),
            ),
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
              onPressed: () {
              },
            ),
          ),
        ),
        Positioned(
          right: 17.19,
          top: 569.25,
          child: Transform.rotate(
            angle: -3.14, // Rotate 180 degrees to make it point right
            child: Container(
              width: 50.35,
              height: 53.04,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.9),
                borderRadius: BorderRadius.circular(4),
              ),
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
                onPressed: () {
                },
              ),
            ),
          ),
        ),
        Positioned(
          left: 180.36,
          top: 588,
          child: Row(
            children: [
              Container(
                width: 5.70,
                height: 6,
                decoration: const BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 7.59),
              Container(
                width: 5.70,
                height: 6,
                decoration: const BoxDecoration(
                  color: Color(0xFF6C6C6C),
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 7.59),
              Container(
                width: 5.70,
                height: 6,
                decoration: const BoxDecoration(
                  color: Color(0xFF6C6C6C),
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}


class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 399,
      height: 376,
      color: const Color(0xFFF7FAFF),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 1),
            child: Row(
              children: [
                const Column(
                  children: [
                    Text(
                      'Experience the mobile app',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'Assured Quality I 100% Handpicked I Easy Exchange',
                      style: TextStyle(
                        color: Color(0xFF707070),
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                Image.asset(
                  'assets/images/playstore.png',
                  width: 158,
                  height: 126,
                  fit: BoxFit.fill,
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 14, top: 2),
            child: Text(
              'About App',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25),
            child: Row(
              children: [
                _buildFooterButton('App', selected: true),
                _buildFooterButton('Help'),
                _buildFooterButton('Shop By'),
                _buildFooterButton('Follow Us', isLast: true),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 10, top: 20),
            child: Text(
              'Who We Are\nJoin our Team\nTerms & Conditions\nFees & Payments\nReturn & Refunds Policy\nPromotions Terms & Conditions',
              style: TextStyle(
                color: Color(0xFF707070),
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFooterButton(String text,
      {bool selected = false, bool isLast = false}) {
    return Expanded(
      child: Container(
        height: 44,
        decoration: BoxDecoration(
          color: selected ? const Color(0xFF2E2E2E) : Colors.white,
          borderRadius: BorderRadius.horizontal(
            left: selected ? const Radius.circular(13) : Radius.zero,
            right: isLast ? const Radius.circular(13) : Radius.zero,
          ),
          border: Border.all(color: Colors.grey),
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(
            color: selected ? Colors.white : const Color(0xFF707070),
            fontSize: selected ? 20 : 16,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
    );
  }
}
