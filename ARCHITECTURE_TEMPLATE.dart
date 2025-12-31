/// Template for Creating New Features with Clean Architecture
/// 
/// Follow these templates when adding new features to maintain consistency
/// with the established clean architecture pattern.

// ============================================================================
// STEP 1: DOMAIN LAYER - Create Entity
// ============================================================================

/// Example: lib/features/domain/entities/product_entity.dart
class ProductEntity {
  final int id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;

  ProductEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
  });
}

// ============================================================================
// STEP 2: DOMAIN LAYER - Create Repository Interface
// ============================================================================

/// Example: lib/features/domain/repositories/product_repository.dart
abstract class ProductRepository {
  Future<List<ProductEntity>> getProducts();
  Future<ProductEntity> getProductById(int id);
  Future<void> addProductToCart(int productId, int quantity);
}

// ============================================================================
// STEP 3: DOMAIN LAYER - Create Use Cases
// ============================================================================

/// Example: lib/features/domain/usecases/get_products_usecase.dart
import 'package:zimro/features/domain/entities/product_entity.dart';
import 'package:zimro/features/domain/repositories/product_repository.dart';

class GetProductsUseCase {
  final ProductRepository repository;

  GetProductsUseCase(this.repository);

  Future<List<ProductEntity>> call() {
    return repository.getProducts();
  }
}

/// Example: lib/features/domain/usecases/get_product_by_id_usecase.dart
class GetProductByIdUseCase {
  final ProductRepository repository;

  GetProductByIdUseCase(this.repository);

  Future<ProductEntity> call(int productId) {
    return repository.getProductById(productId);
  }
}

// ============================================================================
// STEP 4: DATA LAYER - Create Remote Data Source Interface
// ============================================================================

/// Example: lib/features/data/datasources/product_remote_datasource.dart
abstract class ProductRemoteDataSource {
  Future<List<Map<String, dynamic>>> getProducts();
  Future<Map<String, dynamic>> getProductById(int id);
}

// ============================================================================
// STEP 5: DATA LAYER - Create Remote Data Source Implementation
// ============================================================================

/// Example: lib/features/data/datasources/product_remote_datasource_impl.dart
import 'package:dio/dio.dart';
import 'package:zimro/features/data/datasources/product_remote_datasource.dart';

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final Dio dio;

  ProductRemoteDataSourceImpl(this.dio);

  @override
  Future<List<Map<String, dynamic>>> getProducts() async {
    try {
      final response = await dio.get('https://api.example.com/products');
      return List<Map<String, dynamic>>.from(response.data);
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? 'Failed to fetch products');
    }
  }

  @override
  Future<Map<String, dynamic>> getProductById(int id) async {
    try {
      final response = await dio.get('https://api.example.com/products/$id');
      return response.data;
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? 'Failed to fetch product');
    }
  }
}

// ============================================================================
// STEP 6: DATA LAYER - Create Model
// ============================================================================

/// Example: lib/features/data/models/product_model.dart
import 'package:zimro/features/domain/entities/product_entity.dart';

class ProductModel extends ProductEntity {
  ProductModel({
    required super.id,
    required super.name,
    required super.description,
    required super.price,
    required super.imageUrl,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: json['price'].toDouble(),
      imageUrl: json['imageUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'imageUrl': imageUrl,
    };
  }
}

// ============================================================================
// STEP 7: DATA LAYER - Create Repository Implementation
// ============================================================================

/// Example: lib/features/data/repositories/product_repository_impl.dart
import 'package:zimro/features/data/datasources/product_remote_datasource.dart';
import 'package:zimro/features/data/models/product_model.dart';
import 'package:zimro/features/domain/entities/product_entity.dart';
import 'package:zimro/features/domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remoteDataSource;

  ProductRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<ProductEntity>> getProducts() async {
    final data = await remoteDataSource.getProducts();
    return data.map((item) => ProductModel.fromJson(item)).toList();
  }

  @override
  Future<ProductEntity> getProductById(int id) async {
    final data = await remoteDataSource.getProductById(id);
    return ProductModel.fromJson(data);
  }

  @override
  Future<void> addProductToCart(int productId, int quantity) {
    // TODO: Implement cart functionality
    throw UnimplementedError();
  }
}

// ============================================================================
// STEP 8: PRESENTATION LAYER - Create State
// ============================================================================

/// Example: lib/features/presentation/cubit/product/product_state.dart
abstract class ProductState {
  const ProductState();
}

class ProductInitial extends ProductState {
  const ProductInitial();
}

class ProductLoading extends ProductState {
  const ProductLoading();
}

class ProductSuccess extends ProductState {
  final List<dynamic> data;

  const ProductSuccess(this.data);
}

class ProductFailure extends ProductState {
  final String errMessage;

  const ProductFailure({required this.errMessage});
}

// ============================================================================
// STEP 9: PRESENTATION LAYER - Create Cubit
// ============================================================================

/// Example: lib/features/presentation/cubit/product/product_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zimro/features/domain/usecases/get_products_usecase.dart';
import 'package:zimro/features/presentation/cubit/product/product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final GetProductsUseCase getProductsUseCase;

  ProductCubit(this.getProductsUseCase) : super(const ProductInitial());

  Future<void> getProducts() async {
    try {
      emit(const ProductLoading());
      final products = await getProductsUseCase();
      emit(ProductSuccess(products));
    } catch (e) {
      emit(ProductFailure(errMessage: e.toString()));
    }
  }
}

// ============================================================================
// STEP 10: UPDATE DEPENDENCY INJECTION
// ============================================================================

/// Update: lib/core/di/service_locator.dart
/// Add these lines to setupServiceLocator():

/*
  // Product data layer
  final productRemoteDataSource = ProductRemoteDataSourceImpl(dio);
  
  // Product repositories
  final productRepository = ProductRepositoryImpl(productRemoteDataSource);
  
  // Product use cases
  final getProductsUseCase = GetProductsUseCase(productRepository);
  final getProductByIdUseCase = GetProductByIdUseCase(productRepository);
  
  // Product cubits
  _productCubit = ProductCubit(getProductsUseCase);
  
  // Add getters
  static ProductCubit getProductCubit() => _productCubit;
*/

// ============================================================================
// SUMMARY OF FILE STRUCTURE
// ============================================================================

/*
lib/features/
├── domain/
│   ├── entities/
│   │   └── product_entity.dart
│   ├── repositories/
│   │   └── product_repository.dart
│   └── usecases/
│       ├── get_products_usecase.dart
│       └── get_product_by_id_usecase.dart
├── data/
│   ├── datasources/
│   │   ├── product_remote_datasource.dart
│   │   └── product_remote_datasource_impl.dart
│   ├── models/
│   │   └── product_model.dart
│   └── repositories/
│       └── product_repository_impl.dart
└── presentation/
    └── cubit/
        └── product/
            ├── product_cubit.dart
            └── product_state.dart
*/

// ============================================================================
// KEY PRINCIPLES TO REMEMBER
// ============================================================================

/*
1. ENTITIES are pure domain objects - no dependencies, no frameworks
   - Represent core business concepts
   - Should be immutable where possible

2. USE CASES orchestrate domain logic
   - One use case = one business operation
   - Take parameters and return results
   - Use repository to fetch/manipulate data

3. REPOSITORIES are abstractions (interfaces)
   - Define what data operations are available
   - Can have multiple implementations

4. DATA SOURCES handle external communication
   - Remote: API calls
   - Local: Database, SharedPreferences
   - Multiple data sources feed one repository

5. MODELS are data-specific (API responses, DB records)
   - Extend or map to entities
   - Handle serialization/deserialization

6. CUBITS manage state for UI
   - Depend on use cases
   - Emit states as reactions to events
   - Don't do business logic directly

7. DEPENDENCY INJECTION
   - Inject dependencies through constructors
   - Manage all creation in ServiceLocator
   - Makes testing easier with mocks
*/
