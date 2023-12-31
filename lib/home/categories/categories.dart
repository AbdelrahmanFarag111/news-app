import 'package:flutter/material.dart';
import 'package:projects/home/categories/category_widget.dart';

import '../home_screen.dart';

class CategoriesFragment extends StatelessWidget {
  var categories = Category.getAllCategories();
  Function onCategoryClickCallBack;

  CategoriesFragment(this.onCategoryClickCallBack);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 20, mainAxisSpacing: 22),
        itemBuilder: (_, index) {
          return InkWell(
              onTap: () {
                onCategoryClickCallBack(categories[index]);
                title = categories[index].title;
              },
              child: CategoryWidget(categories[index], index));
        },
        itemCount: categories.length,
      ),
    );
  }
}

class Category {
  String id, title, imageName;
  Color color;

  Category(this.id, this.title, this.color, this.imageName);

  static List<Category> getAllCategories() {
    return [
      Category('sports', 'Sports', Color(0xFFC91C22), 'sports'),
      Category('general', 'General', Color(0xFF003E90), 'general'),
      Category('health', 'Health', Color(0xFFED1E79), 'health'),
      Category('business', 'Business', Color(0xFFCF7E48), 'business'),
      Category('technology', 'Technology', Color(0xFF4882CF), 'technology'),
      Category('science', 'Science', Color(0xFFF2D352), 'science'),
    ];
  }
}
