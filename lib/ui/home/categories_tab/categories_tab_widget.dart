import 'package:flutter/material.dart';
import '../../widgets/category_widget.dart';
import 'category_item.dart';

typedef OnCategoryItemClicked = void Function(CategoryItem catItem);

class CategoriesTabWidget extends StatelessWidget {
  final List<CategoryItem> allCategories = CategoryItem.getCategoriesList();
  final OnCategoryItemClicked onCategoryItemClicked;

  CategoriesTabWidget({required this.onCategoryItemClicked});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          const Text(
            'Pick your category of interest', // Static text replacing AppLocalizations
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              color: Color(0xFF4F5A69),
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 12, mainAxisSpacing: 12),
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  onCategoryItemClicked(allCategories[index]);
                },
                child: CategoryWidget(
                  catItem: allCategories[index],
                  index: index,
                ),
              ),
              itemCount: allCategories.length,
            ),
          ),
        ],
      ),
    );
  }
}
