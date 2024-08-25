import 'package:e_commerce_app/services/api_service.dart';
import 'package:flutter/material.dart';

class CategorySlider extends StatefulWidget {
  const CategorySlider({
    super.key,
  });

  @override
  State<CategorySlider> createState() => _CategorySliderState();
}

class _CategorySliderState extends State<CategorySlider> {
  List<Text> categoryList = [];

  @override
  void initState() {
    print("INIT STATE");
    // TODO: implement initState
    super.initState();

    ApiService.getCategories().then((categories) {
      setState(() {
        categoryList.add(const Text("ALL"));
        for (var category in categories) {
          categoryList.add(Text(category.toString().toUpperCase()));
        }
      });
      print(categoryList);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, left: 10, bottom: 20),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SizedBox(
          width: 600,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: categoryList,
          ),
        ),
      ),
    );
  }
}
