import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:la_vie/utils/Api.dart';
import 'package:la_vie/utils/shared_pref.dart';

import '../../constansts.dart';
import '../../model/product.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Introduction(),
            PopularCategories(),
            BestSeller(),
            BlogsList(),
            AboutUs(),
            MobileApplicationSection(),
          ],
        ),
      ),
    );
  }
}

class Introduction extends StatelessWidget {
  const Introduction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Tree(),
        // Container(
        //     height: 300,
        //     width: 300,
        //     clipBehavior: Clip.hardEdge,
        //     decoration: BoxDecoration(),
        //     child: Transform.scale(
        //       scale: 2.6,
        //       alignment: Alignment.topCenter,
        //       origin: Offset(0, 200),
        //       child: Image.asset(
        //         'images/tools.png',
        //       ),
        //     )
        //     )
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Stack(
                  children: [
                    Container(
                      child: Text(
                        'Answer some questions and get points',
                        style: k12_400WhiteText,
                      ),
                      height: 50,
                      decoration: BoxDecoration(
                          color: Color(0x87000000),
                          borderRadius: BorderRadius.circular(5)),
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                    ),
                    Positioned(
                      right: -10,
                      top: 15,
                      child: ClipPath(
                        clipper: TriangleClipper(),
                        child: Container(
                          color: Color(0x87000000),
                          height: 20,
                          width: 10,
                        ),
                      ),
                    ),
                  ],
                  clipBehavior: Clip.none,
                ),
                SizedBox(width: 20),
                ElevatedButton(
                    onPressed: () {},
                    child: Icon(Icons.question_mark, size: 40),
                    style: ElevatedButton.styleFrom(
                        shape: CircleBorder(), minimumSize: Size(80, 80))),
              ],
            ),
            AutoSizeText('Perfect way to plant in house',
                style: k38_600GreenText, maxLines: 1),
            Text(
                'leaf, in botany, any usually flattened green outgrowth from the stem of a vascular plant. As the primary sites of photosynthesis, leaves manufacture food for plants, which in turn ultimately nourish and sustain all land animals. Botanically, leaves are an integral part of the stem system. They are attached by a continuous vascular system to the rest of the plant so that free exchange of nutrients, water, and end products of photosynthesis',
                style: k14_400BlackText)
          ],
        ))
      ],
    );
  }
}

class Tree extends StatefulWidget {
  @override
  State<Tree> createState() => _TreeState();
}

class _TreeState extends State<Tree> {
  Offset origin = Offset(0, 0);
  double scale = 1;
  bool hover = false;

  void changeTreePart(Offset offset, double scale, bool isHover) {
    setState(() {
      origin = offset;
      hover = isHover;
      this.scale = scale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 700,
      width: 640,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: -250,
            child: Container(
                height: 800,
                width: 800,
                decoration: ShapeDecoration(
                    shape: CircleBorder(
                        side: BorderSide(color: kGreen, width: 6)))),
          ),
          TreePart(
              name: 'Leaves',
              top: 145,
              right: 115,
              scale: 4,
              offset: Offset(0, 0),
              changePart: changeTreePart),
          TreePart(
              top: 300,
              right: 42,
              name: 'Branch',
              scale: 3,
              offset: Offset(120, 200),
              changePart: changeTreePart),
          TreePart(
              top: 465,
              right: 50,
              name: 'Trunk',
              scale: 3,
              offset: Offset(0, 450),
              changePart: changeTreePart),
          TreePart(
              top: 580,
              right: 92,
              name: 'Roots',
              scale: 3,
              offset: Offset(-30, 700),
              changePart: changeTreePart),
          Positioned(
            left: -180,
            bottom: -20,
            child: Container(
              height: 650,
              width: 650,
              decoration: ShapeDecoration(shape: CircleBorder()),
              clipBehavior: Clip.hardEdge,
              child: Transform.scale(
                alignment: Alignment.topCenter,
                origin: hover ? origin : Offset(0, 0),
                scale: hover ? scale : 1,
                child: Image.asset(
                  'images/tree.png',
                  height: 650,
                  //width: 600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TreePart extends StatelessWidget {
  TreePart(
      {required this.name,
      required this.top,
      required this.right,
      required this.offset,
      required this.scale,
      required this.changePart});
  final String name;
  final double top;
  final double right;
  final double scale;
  final Offset offset;
  final Function(Offset, double, bool) changePart;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      right: right,
      child: InkWell(
          child: Row(children: [
            Container(
              child: Icon(
                Icons.circle,
                color: kGreen,
              ),
              decoration: ShapeDecoration(
                  shape: CircleBorder(side: BorderSide(color: kGreen)),
                  color: Colors.white),
            ),
            Text(name),
          ]),
          onTap: () {},
          onHover: (hover) {
            changePart(offset, scale, hover);
          }),
    );
  }
}

class TriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    // path.lineTo(size.width, 0.0);
    // path.lineTo(size.width / 2, size.height);
    path.lineTo(size.width - 3, size.height / 2 - 3);
    path.quadraticBezierTo(
        size.width, size.height / 2, size.width - 3, size.height / 2 + 3);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(TriangleClipper oldClipper) => false;
}

class PopularCategories extends StatelessWidget {
  final List<Map<Category, String>> categories = [
    {Category.name: 'Tools', Category.imageUrl: 'images/tools.png'},
    {Category.name: 'Seeds', Category.imageUrl: 'images/seeds.png'},
    {
      Category.name: 'Low Light Plants',
      Category.imageUrl: 'images/low_light_plants.png'
    },
    {
      Category.name: 'Bright Light Plants',
      Category.imageUrl: 'images/bright_light_plants.png'
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 80),
      child: Column(
        children: [
          Header(text: 'Popular Categories'),
          SizedBox(
            height: 500,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) => Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: Column(
                        children: [
                          Image.asset(categories[index][Category.imageUrl]!,
                              width: 250),
                          SizedBox(height: 20),
                          Text(categories[index][Category.name]!,
                              style: k38_600Text)
                        ],
                      ),
                    )),
          )
        ],
      ),
    );
  }
}

class BestSeller extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 80),
      child: Column(
        children: [
          Header(text: 'Best seller'),
          SizedBox(
            height: 450,
            child: FutureBuilder(
              future: Api.getProducts(
                  PreferenceUtils.getString(SharedKeys.accessToken)),
              builder: (context, snap) {
                if (!snap.hasData) return Container();
                final data = snap.data as List<Product>;
                return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: data.length,
                    itemBuilder: (context, index) => BestSellerItem(
                        index: index,
                        imagePath: data[index].imageUrl,
                        name: data[index].name,
                        price: data[index].price));
              },
            ),
          )
        ],
      ),
    );
  }
}

class BestSellerItem extends StatelessWidget {
  BestSellerItem(
      {required this.index,
      this.imagePath = '',
      required this.name,
      required this.price});
  final int index;
  final String? imagePath;
  final String name;
  final int price;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      width: 250,
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Stack(children: [
        Positioned(
          bottom: index % 2 == 1 ? 0 : null,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network('${Api.Domain_Name}${imagePath!}',
                  height: 250, width: 250, fit: BoxFit.contain),
              AutoSizeText(name, style: k26_600Text, maxLines: 1),
              Text('$price EGP', style: k22_500Text),
            ],
          ),
        )
      ]),
    );
  }
}

class BlogsList extends StatelessWidget {
  const BlogsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 80),
      child: Column(
        children: [
          Header(text: 'Blogs'),
          Row(
            children: [
              BlogItem(),
              SizedBox(width: 20),
              BlogItem(),
              SizedBox(width: 20),
              BlogItem(),
            ],
          )
        ],
      ),
    );
  }
}

class BlogItem extends StatelessWidget {
  const BlogItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        elevation: 10,
        child: Column(
          children: [
            Image.asset('images/plant1_blog.png'),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('2 days ago', style: k10_400GreenText),
                    Text('5 Simple Tips treat plant', style: k20_600Text),
                    Text(
                        'leaf, in botany, any usually flattened green outgrowth from the stem of',
                        style: k10_400_7DGreyText),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 80),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SizedBox(
              height: 600,
              child: Column(
                children: [
                  Header(text: 'About us'),
                  Text(
                    'Welcome to La Vie, your number one source for planting. We\'re dedicated to giving you the very best of plants, with a focus on dependability, customer service and uniqueness.\nFounded in 2020, La Vie has come a long way from its beginnings in a  home office our passion for helping people and give them some advices about how to plant and take care of plants. We now serve customers all over Egypt, and are thrilled to be a part of the eco-friendly wing ',
                    style: k14_400_8DGreyText,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 50),
          Stack(clipBehavior: Clip.none, children: [
            Positioned(
              top: 20,
              left: -20,
              child: Container(
                height: 400,
                width: 437,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: kGreen),
                ),
              ),
            ),
            Positioned(
              child: Container(
                clipBehavior: Clip.hardEdge,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: Image.asset(
                  'images/about_us.png',
                  height: 400,
                ),
              ),
            ),
          ]),
        ],
      ),
    );
  }
}

class MobileApplicationSection extends StatelessWidget {
  const MobileApplicationSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 80),
      child: Row(
        children: [
          Expanded(
            child: Stack(children: [
              Image.asset(
                'images/left_mobile.png',
                height: 500,
              ),
              Positioned(
                left: 140,
                child: Image.asset(
                  'images/right_mobile.png',
                  height: 500,
                ),
              ),
            ]),
          ),
          Expanded(
            child: SizedBox(
              height: 600,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Header(
                    text: 'Mobile Application',
                    addRightExpand: false,
                  ),
                  Text(
                    'You can install La Vie mobile application and enjoy with new featurs, earn more points and get discount\nAlso you can scan QR codes in your plants’ pots so that you can get discount on everything in the website up to 70%',
                    style: k14_400_8DGreyText,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      'Install by',
                      style: k14_600Text,
                    ),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        height: 52,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Row(
                            children: [
                              Image.asset('images/google_play.png',
                                  height: 26, width: 22),
                              SizedBox(width: 18),
                              Text('Play Store', style: k14_600WhiteText),
                            ],
                          ),
                          style:
                              ElevatedButton.styleFrom(primary: Colors.black),
                        ),
                      ),
                      SizedBox(width: 20),
                      SizedBox(
                        height: 52,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Row(
                            children: [
                              Image.asset('images/apple_icon.png',
                                  height: 26, width: 22),
                              SizedBox(width: 18),
                              Text('App Store', style: k14_600WhiteText),
                            ],
                          ),
                          style:
                              ElevatedButton.styleFrom(primary: Colors.black),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Header extends StatelessWidget {
  Header({required this.text, this.addRightExpand = true});
  final String text;
  final bool addRightExpand;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Expanded(
          child: AutoSizeText(
            '$text',
            style: TextStyle(fontSize: 54, fontWeight: FontWeight.w600),
            maxLines: 1,
          ),
        ),
        SizedBox(width: 20),
        SizedBox(
          width: 80,
          child: Divider(
            color: Colors.black,
            thickness: 4,
          ),
        ),
        if (addRightExpand) Expanded(child: Container())
      ]),
    );
  }
}

enum Category { name, imageUrl }
