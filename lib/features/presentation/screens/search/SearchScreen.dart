import 'package:zimro/features/presentation/widgets/home/CustomListView.dart';
import 'package:zimro/features/presentation/widgets/home/appbarCustomWidget.dart';
import 'package:zimro/features/presentation/widgets/home/GridViewHorizontal.dart';
import 'package:zimro/features/presentation/widgets/search/RecentSearchWidget.dart';
import 'package:zimro/features/presentation/widgets/search/SearchWidget.dart';
import 'package:zimro/features/presentation/widgets/category/category_item.dart';
import 'package:zimro/features/presentation/widgets/category/category_list.dart';
import 'package:zimro/features/presentation/widgets/search/section_title.dart';
import 'package:zimro/features/presentation/widgets/home/sort_filter_bar.dart';

import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key, List<String>? images})
    : images = images ?? kCategoryDefaultImages;

  final List<String> images;

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBarCustomWidget(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 3, top: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Row(children: [Flexible(child: SearchWidget())]),
                ),
                SizedBox(height: 10),
                SectionTitle(title: 'Categories'),
                CategoryList(images: widget.images, labels: kCategories),
                const SizedBox(height: 20),
                SectionTitle(title: 'Recent search'),
                RecentSearchWidget(),
                const SizedBox(height: 20),
                const SectionTitle(title: 'Trending clothes'),
                const SizedBox(height: 8),
                CustomListView(),

                const SizedBox(height: 18),

                const SectionTitle(title: 'New arrivals'),
                const SizedBox(height: 8),
                HorizontalProductCardList(
                  image: 'assets/girl_h1.png',
                  text: 'Cotton long sleve jacket',
                  title: 'Women’s wear',
                  price: '26.55',
                ),
                const SizedBox(height: 15),
                const SectionTitle(title: 'Top sale products'),
                const SizedBox(height: 8),
                CustomListView(),

                const SizedBox(height: 15),
                SortFilterBar(
                  onSort: () => ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(const SnackBar(content: Text('Sort tapped'))),
                  onFilter: () => ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Filter tapped')),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
