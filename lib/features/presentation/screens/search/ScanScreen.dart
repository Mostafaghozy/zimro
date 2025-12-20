// import 'package:camera/camera.dart';
// import 'package:zimro/features/presentation/screens/search/SearchResultsScreen.dart';
// import 'package:flutter/material.dart';
// import 'package:permission_handler/permission_handler.dart';

// class ScanScreen extends StatefulWidget {
//   const ScanScreen({super.key});

//   @override
//   State<ScanScreen> createState() => _ScanScreenState();
// }

// class _ScanScreenState extends State<ScanScreen> with TickerProviderStateMixin {
//   CameraController? _cameraController;
//   List<CameraDescription>? _cameras;
//   bool _isInitialized = false;
//   bool _isScanning = false;
//   bool _showProductCard = false;
//   late AnimationController _scanAnimationController;
//   late Animation<double> _scanAnimation;

//   // Mock detected product (in real app, this would come from ML/AI)
//   final Map<String, dynamic> _detectedProduct = {
//     'title': 'Cotton jacket',
//     'category': 'Women\'s wear',
//     'price': 26.00,
//     'imageUrl': 'assets/girl_h1.png',
//   };

//   @override
//   void initState() {
//     super.initState();
//     _initializeCamera();
//     _setupScanAnimation();
//   }

//   void _setupScanAnimation() {
//     _scanAnimationController = AnimationController(
//       duration: const Duration(seconds: 2),
//       vsync: this,
//     );
//     _scanAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
//       CurvedAnimation(
//         parent: _scanAnimationController,
//         curve: Curves.easeInOut,
//       ),
//     );
//   }

//   Future<void> _initializeCamera() async {
//     // Request camera permission
//     final status = await Permission.camera.request();
//     // Handle different permission statuses
//     if (status == PermissionStatus.denied) {
//       // Permission denied, show dialog to user
//       // _showPermissionDeniedDialog(); // Commented out to prevent immediate dialog on first denial
//     } else if (status == PermissionStatus.permanentlyDenied ||
//         status == PermissionStatus.restricted) {
//       _showPermissionDeniedDialog();
//       return;
//     }

//     try {
//       _cameras = await availableCameras();
//       if (_cameras!.isNotEmpty) {
//         _cameraController = CameraController(
//           _cameras![0],
//           ResolutionPreset.high,
//           enableAudio: false,
//         );

//         await _cameraController!.initialize();
//         if (mounted) {
//           setState(() {
//             _isInitialized = true;
//           });
//         }
//       }
//     } catch (e) {
//       print('Error initializing camera: $e');
//       _showCameraErrorDialog();
//     }
//   }

//   void _showPermissionDeniedDialog() {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: const Text('Camera Permission Required'),
//         content: const Text(
//           'This app needs camera access to scan products. Please enable camera permission in settings.',
//         ),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.of(context).pop(),
//             child: const Text('Cancel'),
//           ),
//           TextButton(
//             onPressed: () {
//               Navigator.of(context).pop();
//               openAppSettings();
//             },
//             child: const Text('Settings'),
//           ),
//         ],
//       ),
//     );
//   }

//   void _showCameraErrorDialog() {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: const Text('Camera Error'),
//         content: const Text('Failed to initialize camera. Please try again.'),
//         actions: [
//           TextButton(
//             onPressed: () {
//               Navigator.of(context).pop();
//               Navigator.of(context).pop();
//             },
//             child: const Text('OK'),
//           ),
//         ],
//       ),
//     );
//   }

//   void _startScanning() {
//     setState(() {
//       _isScanning = true;
//     });
//     _scanAnimationController.repeat(reverse: true);

//     // Simulate scanning process
//     Future.delayed(const Duration(seconds: 3), () {
//       if (mounted) {
//         setState(() {
//           _isScanning = false;
//           _showProductCard = true;
//         });
//         _scanAnimationController.stop();
//       }
//     });
//   }

//   void _viewProductDetails() {
//     // Navigate to product details or search results
//     // Navigator.of(context).push(
//     //   MaterialPageRoute(
//     //     builder: (context) =>
//     //         SearchResultsScreen(searchQuery: _detectedProduct['title']),
//     //   ),
//     // );
//   }

//   @override
//   void dispose() {
//     _cameraController?.dispose();
//     _scanAnimationController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: Stack(
//         children: [
//           // Camera preview
//           if (_isInitialized && _cameraController != null)
//             SizedBox(
//               width: double.infinity,
//               height: double.infinity,
//               child: CameraPreview(_cameraController!),
//             )
//           else
//             Container(
//               color: Colors.black,
//               child: const Center(
//                 child: CircularProgressIndicator(color: Colors.white),
//               ),
//             ),

//           // Top navigation bar
//           Positioned(
//             top: 0,
//             left: 0,
//             right: 0,
//             child: Container(
//               padding: EdgeInsets.only(
//                 top: MediaQuery.of(context).padding.top + 10,
//                 left: 16,
//                 right: 16,
//                 bottom: 10,
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   GestureDetector(
//                     onTap: () => Navigator.of(context).pop(),
//                     child: Container(
//                       padding: const EdgeInsets.all(8),
//                       decoration: BoxDecoration(
//                         color: Colors.black.withOpacity(0.5),
//                         shape: BoxShape.circle,
//                       ),
//                       child: const Icon(
//                         Icons.arrow_back,
//                         color: Colors.white,
//                         size: 20,
//                       ),
//                     ),
//                   ),
//                   Text(
//                     _isScanning ? 'SCANNING...' : 'SCAN PAGE',
//                     style: const TextStyle(
//                       color: Colors.white,
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                       letterSpacing: 1.2,
//                     ),
//                   ),
//                   GestureDetector(
//                     onTap: () => Navigator.of(context).pop(),
//                     child: Container(
//                       padding: const EdgeInsets.all(8),
//                       decoration: BoxDecoration(
//                         color: Colors.black.withOpacity(0.5),
//                         shape: BoxShape.circle,
//                       ),
//                       child: const Icon(
//                         Icons.close,
//                         color: Colors.white,
//                         size: 20,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),

//           // Scanning overlay
//           if (_isScanning) _buildScanningOverlay(),

//           // Product detection card
//           if (_showProductCard) _buildProductCard(),

//           // Scan button
//           if (!_isScanning && !_showProductCard)
//             Positioned(
//               bottom: 100,
//               left: 0,
//               right: 0,
//               child: Center(
//                 child: GestureDetector(
//                   onTap: _startScanning,
//                   child: Container(
//                     width: 80,
//                     height: 80,
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       shape: BoxShape.circle,
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.black.withOpacity(0.3),
//                           blurRadius: 10,
//                           spreadRadius: 2,
//                         ),
//                       ],
//                     ),
//                     child: const Icon(
//                       Icons.camera_alt,
//                       color: Colors.black,
//                       size: 40,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//         ],
//       ),
//     );
//   }

//   Widget _buildScanningOverlay() {
//     return AnimatedBuilder(
//       animation: _scanAnimation,
//       builder: (context, child) {
//         return Container(
//           width: double.infinity,
//           height: double.infinity,
//           child: Stack(
//             children: [
//               // Main scanning frame
//               Positioned(
//                 top: MediaQuery.of(context).size.height * 0.25,
//                 left: 50,
//                 right: 50,
//                 child: Container(
//                   height: 200,
//                   decoration: BoxDecoration(
//                     border: Border.all(color: Colors.white, width: 2),
//                     borderRadius: const BorderRadius.only(
//                       topLeft: Radius.circular(20),
//                       topRight: Radius.circular(20),
//                     ),
//                   ),
//                   child: Stack(
//                     children: [
//                       // Scanning line animation
//                       Positioned(
//                         top: _scanAnimation.value * 200,
//                         left: 0,
//                         right: 0,
//                         child: Container(
//                           height: 2,
//                           decoration: BoxDecoration(
//                             gradient: LinearGradient(
//                               colors: [
//                                 Colors.transparent,
//                                 Colors.white,
//                                 Colors.transparent,
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               // Secondary scanning frame
//               Positioned(
//                 top: MediaQuery.of(context).size.height * 0.35,
//                 left: 80,
//                 right: 80,
//                 child: Container(
//                   height: 100,
//                   decoration: BoxDecoration(
//                     border: Border.all(color: Colors.white, width: 1.5),
//                     borderRadius: const BorderRadius.only(
//                       topLeft: Radius.circular(15),
//                       topRight: Radius.circular(15),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }

//   Widget _buildProductCard() {
//     return Positioned(
//       bottom: 0,
//       left: 0,
//       right: 0,
//       child: Container(
//         margin: const EdgeInsets.all(16),
//         padding: const EdgeInsets.all(16),
//         decoration: BoxDecoration(
//           color: Colors.black.withOpacity(0.9),
//           borderRadius: BorderRadius.circular(12),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.3),
//               blurRadius: 10,
//               spreadRadius: 2,
//             ),
//           ],
//         ),
//         child: Row(
//           children: [
//             // Product thumbnail
//             Container(
//               width: 60,
//               height: 60,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(8),
//                 image: DecorationImage(
//                   image: AssetImage(_detectedProduct['imageUrl']),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//             const SizedBox(width: 12),
//             // Product details
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     _detectedProduct['category'],
//                     style: TextStyle(color: Colors.grey[400], fontSize: 12),
//                   ),
//                   const SizedBox(height: 4),
//                   Text(
//                     _detectedProduct['title'],
//                     style: const TextStyle(
//                       color: Colors.white,
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const SizedBox(height: 4),
//                   Text(
//                     '\$${_detectedProduct['price'].toStringAsFixed(2)}',
//                     style: const TextStyle(
//                       color: Colors.white,
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             // Action button
//             GestureDetector(
//               onTap: _viewProductDetails,
//               child: Container(
//                 width: 40,
//                 height: 40,
//                 decoration: const BoxDecoration(
//                   color: Colors.white,
//                   shape: BoxShape.circle,
//                 ),
//                 child: const Icon(
//                   Icons.play_arrow,
//                   color: Colors.black,
//                   size: 24,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
