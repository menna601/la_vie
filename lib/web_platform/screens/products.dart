import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:la_vie/model/categories.dart';
import 'package:provider/provider.dart';

import '../../constansts.dart';
import '../../model/categories.dart';
import '../../model/product.dart';
import '../../model/search.dart';
import '../../utils/Api.dart';
import '../../utils/shared_pref.dart';
import '../Component/custom_field.dart';

class Products extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final search = Provider.of<Search>(context, listen: false);
    return Container(
      color: Colors.white,
      child: Column(children: [
        Padding(
            padding: EdgeInsets.symmetric(vertical: 40),
            child: Text('Plants', style: k35_600Text)),
        Expanded(
          child: Row(children: [
            Expanded(child: CategoriesList()),
            Expanded(
              flex: 3,
              child: Padding(
                padding: EdgeInsets.only(right: 30),
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          color: kFAGrey,
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Row(children: [
                            Icon(Icons.search, color: kGreen, size: 30),
                            SizedBox(width: 10),
                            Expanded(
                              child: CustomField(
                                onChanged: (val) {
                                  search.updateSearch(val);
                                },
                                height: 50,
                                border: false,
                              ),
                            ),
                          ]),
                        ),
                      ),
                      SizedBox(width: 20),
                      Text('viewing 20 0f 100 products'),
                    ],
                  ),
                  SizedBox(height: 30),
                  Expanded(
                    child: FutureBuilder(
                        future: Api.getProducts(
                            PreferenceUtils.getString(SharedKeys.accessToken)),
                        builder: (context, snap) {
                          if (!snap.hasData) return Container();
                          final data = snap.data as List<Product>;
                          return ProductsList(data: data);
                        }),
                  ),
                ]),
              ),
            ),
          ]),
        ),
      ]),
    );
  }
}

class ProductsList extends StatelessWidget {
  const ProductsList({required this.data});

  final List<Product> data;

  List<Product> filter(String keyword) {
    List<Product> filtered = [];
    data.forEach((product) {
      if (product.name.toLowerCase().contains(keyword.toLowerCase()))
        filtered.add(product);
    });
    return filtered;
  }

  @override
  Widget build(BuildContext context) {
    final keyword = Provider.of<Search>(context).search;
    List<Product> filtered = keyword == '' ? data : filter(keyword);
    return GridView.builder(
      itemCount: filtered.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 30.0,
        mainAxisSpacing: 50.0,
      ),
      itemBuilder: (BuildContext context, int index) {
        return ProductItem(
          name: filtered[index].name,
          imageUrl: filtered[index].imageUrl!,
          price: filtered[index].price,
          description: filtered[index].description,
        );
      },
    );
  }
}

class CategoriesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final categories = Provider.of<Categories>(context).categories;
    categories.general = [
      {'name': 'Plants'},
      {'name': 'Tools'},
      {'name': 'Seeds'}
    ];
    categories.getCategories();
    return SingleChildScrollView(
      controller: ScrollController(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CategoryList(name: 'Categories', list: categories.general),
          SizedBox(height: 30),
          CategoryList(name: 'Plants', list: categories.plants),
          SizedBox(height: 30),
          CategoryList(name: 'Tools', list: categories.tools),
          SizedBox(height: 30),
          CategoryList(name: 'seeds', list: categories.seeds),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}

class CategoryList extends StatefulWidget {
  CategoryList({required this.name, required this.list});

  final String name;
  final List list;

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  bool extend = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kFAGrey,
      margin: EdgeInsets.symmetric(horizontal: 30),
      padding: EdgeInsets.only(left: 10, right: 10, top: 20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(widget.name, style: k19_500Text),
            GestureDetector(
              onTap: () {
                setState(() {
                  extend = !extend;
                });
              },
              child: Icon(Icons.keyboard_arrow_down),
            )
          ],
        ),
        SizedBox(
            height: extend ? 400 : 200,
            child: ListView.builder(
                controller: ScrollController(),
                itemCount: widget.list.length,
                itemBuilder: (context, index) =>
                    CheckListTile(name: widget.list[index]['name']))),
      ]),
    );
  }
}

class CheckListTile extends StatefulWidget {
  CheckListTile({required this.name});
  final String name;

  @override
  State<CheckListTile> createState() => _CheckListTileState();
}

class _CheckListTileState extends State<CheckListTile> {
  bool rememberMe = false;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Transform.scale(
        scale: 0.8,
        child: Checkbox(
          activeColor: kGreen,
          value: rememberMe,
          onChanged: (val) {
            setState(() {
              rememberMe = val!;
            });
          },
        ),
      ),
      title: Text(widget.name, style: k12_400_97GreyText),
    );
  }
}

class ProductItem extends StatelessWidget {
  ProductItem(
      {required this.name,
      required this.price,
      required this.description,
      required this.imageUrl});
  final String name;
  final int price;
  final String description;
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Column(
        children: [
          Image.network('${Api.Domain_Name}${imageUrl!}', height: 200),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                              child: AutoSizeText(
                            name,
                            style: k20_600Text,
                            maxLines: 1,
                          )),
                          Text(price.toString(), style: k20_500GreenText)
                        ]),
                    Text(description, style: k10_400_7DGreyText),
                    SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: ElevatedButton(
                        onPressed: () async {},
                        child: Text('Add to Cart', style: k18_500Text),
                        style: TextButton.styleFrom(
                            backgroundColor: Color(0xFF1ABC00),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                    ),
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}
