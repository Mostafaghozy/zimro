// import 'package:zimro/features/presentation/widgets/CustomBottomNavBar.dart';
// import 'package:zimro/features/presentation/widgets/appbarCustomWidget.dart';
// import 'package:zimro/features/presentation/widgets/category/HorizontalProductList.dart';
// import 'package:zimro/features/presentation/widgets/category/ProductCardGrid.dart';
// import 'package:zimro/features/presentation/widgets/category/SortBySheet.dart';
// import 'package:zimro/features/presentation/widgets/category/sort_filter_bar.dart';
// import 'package:zimro/features/presentation/screens/home/Root.dart';

// import 'package:zimro/features/data/services/ProductDataService.dart';
// import 'package:flutter/material.dart';

// class SearchResultsScreen extends StatefulWidget {
//   final String searchQuery;
//   final String? category;

//   const SearchResultsScreen({
//     super.key,
//     required this.searchQuery,
//     this.category,
//   });

//   @override
//   State<SearchResultsScreen> createState() => _SearchResultsScreenState();
// }

// class _SearchResultsScreenState extends State<SearchResultsScreen> {
//   late List<dynamic> searchResults;
//   String selectedSortOption = 'Recommended';
//   bool isGridView = false;

//   @override
//   void initState() {
//     super.initState();
//     _performSearch();
//   }

//   void _performSearch() {
//     if (widget.category != null) {
//       searchResults = ProductDataService.getProductsByCategory(
//         widget.category!,
//       );
//     } else {
//       searchResults = ProductDataService.searchProducts(widget.searchQuery);
//     }
//   }

//   void toggleFavorite(String productId) {
//     setState(() {
//       ProductDataService.toggleFavorite(productId);
//     });
//   }

//   void _sortResults() {
//     setState(() {
//       switch (selectedSortOption) {
//         case 'Recently added':
//           // Sort by ID (assuming higher ID = more recent)
//           searchResults.sort(
//             (a, b) => int.parse(b.id).compareTo(int.parse(a.id)),
//           );
//           break;
//         case 'Price low - high':
//           searchResults.sort((a, b) => a.price.compareTo(b.price));
//           break;
//         case 'Price high - low':
//           searchResults.sort((a, b) => b.price.compareTo(a.price));
//           break;
//         case 'Recommended':
//         default:
//           // Keep original order
//           break;
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBarCustomWidget(),
//       body: Column(
//         children: [
//           // Search header
//           Container(
//             padding: const EdgeInsets.all(16),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: Text(
//                     widget.category != null
//                         ? '${widget.category} Products'
//                         : 'Search results for "${widget.searchQuery}"',
//                     style: const TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//                 IconButton(
//                   onPressed: () {
//                     setState(() {
//                       isGridView = !isGridView;
//                     });
//                   },
//                   icon: Icon(
//                     isGridView ? Icons.list : Icons.grid_view,
//                     color: Colors.black,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           // Results count
//           Container(
//             padding: const EdgeInsets.symmetric(horizontal: 16),
//             child: Row(
//               children: [
//                 Text(
//                   '${searchResults.length} products found',
//                   style: TextStyle(color: Colors.grey[600], fontSize: 14),
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(height: 10),
//           // Sort and Filter bar
//           SortFilterBar(
//             onSort: () async {
//               final result = await showModalBottomSheet<String>(
//                 context: context,
//                 isScrollControlled: true,
//                 backgroundColor: Colors.transparent,
//                 builder: (ctx) => const SortBySheet(),
//               );
//               if (result != null) {
//                 setState(() {
//                   selectedSortOption = result;
//                 });
//                 _sortResults();
//               }
//             },
//             onFilter: () {
//               // Filter functionality can be added here
//               ScaffoldMessenger.of(context).showSnackBar(
//                 const SnackBar(
//                   content: Text('Filter functionality coming soon'),
//                 ),
//               );
//             },
//           ),
//           // Results
//           Expanded(
//             child: searchResults.isEmpty
//                 ? _buildEmptyState()
//                 : isGridView
//                 ? _buildGridView()
//                 : _buildListView(),
//           ),
//         ],
//       ),
//       bottomNavigationBar: CustomBottomNavBar(
//         currentIndex: 1,
//         onTap: (index) {
//           Navigator.of(context).pushAndRemoveUntil(
//             MaterialPageRoute(
//               builder: (context) => RootScreen(initialIndex: index),
//             ),
//             (route) => false,
//           );
//         },
//       ),
//     );
//   }

//   Widget _buildEmptyState() {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(Icons.search_off, size: 80, color: Colors.grey[400]),
//           const SizedBox(height: 16),
//           Text(
//             'No products found',
//             style: TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.w600,
//               color: Colors.grey[600],
//             ),
//           ),
//           const SizedBox(height: 8),
//           Text(
//             widget.category != null
//                 ? 'No products in this category'
//                 : 'Try searching with different keywords',
//             style: TextStyle(fontSize: 14, color: Colors.grey[500]),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildListView() {
//     return ListView.builder(
//       padding: const EdgeInsets.all(16),
//       itemCount: searchResults.length,
//       itemBuilder: (context, index) {
//         final product = searchResults[index];
//         return Container(
//           margin: const EdgeInsets.only(bottom: 12),
//           child: HorizontalProductList(
//             products: [product],
//             onToggleFavorite: toggleFavorite,
//           ),
//         );
//       },
//     );
//   }

//   Widget _buildGridView() {
//     return GridView.builder(
//       padding: const EdgeInsets.all(16),
//       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 2,
//         childAspectRatio: 0.7,
//         crossAxisSpacing: 12,
//         mainAxisSpacing: 12,
//       ),
//       itemCount: searchResults.length,
//       itemBuilder: (context, index) {
//         final product = searchResults[index];
//         return ProductCardGrid(
//           imageUrl: product.imageUrl,
//           title: product.title,
//           price: product.price,
//           isFavorite: product.isFavorite,
//           onFavoritePressed: () => toggleFavorite(product.id),
//           onCardPressed: () {
//             ScaffoldMessenger.of(
//               context,
//             ).showSnackBar(SnackBar(content: Text('Opening ${product.title}')));
//           },
//           onAddToCart: () {
//             ScaffoldMessenger.of(context).showSnackBar(
//               SnackBar(content: Text('Added ${product.title} to cart')),
//             );
//           },
//         );
//       },
//     );
//   }
// }
