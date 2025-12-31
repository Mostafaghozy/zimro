# Fashion E-Commerce 🛒

[![Flutter Version](https://img.shields.io/badge/Flutter-%3E%3D3.9.0-blue.svg)](https://flutter.dev/)
[![Dart Version](https://img.shields.io/badge/Dart-%3E%3D3.9.0-blue.svg)](https://dart.dev/)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

A sophisticated cross-platform e-commerce solution built with Flutter, delivering a premium shopping experience across mobile and web platforms. This application implements modern e-commerce patterns and best practices, featuring a comprehensive suite of shopping functionalities, secure payment integrations, and a responsive, theme-aware design system.

## Key Features

### Product Discovery & Catalog

- Dynamic home feed with curated product sections
- Advanced product categorization and filtering
- Intelligent favorites system with persistent state management
- High-performance product grid and list views

### User Experience

- Intuitive bottom navigation with state preservation
- Responsive design supporting multiple form factors
- Seamless light/dark theme transitions
- Custom typography with Jost font family
- Optimized asset delivery system

### Payment Integration

- Secure PayPal payment gateway integration
- PCI-compliant credit card processing
- Comprehensive order management system
- Transaction history and tracking

### Architecture & Quality

- Clean architecture with separation of concerns
- Modular widget system for maximum reusability
- Comprehensive lint rules enforcement
- Automated testing infrastructure
- Performance-optimized state management

## Project Structure

```
lib/
├── main.dart                              # App entry point: MaterialApp, theming, routes
├── SplashScreen.dart                      # Splash screen widget
├── test.json                              # Test data file
│
├── core/                                  # Core application layer
│   ├── api_keys.dart                      # API configuration and keys
│   ├── theme.dart                         # AppThemes (light/dark), typography, colors
│   ├── di/                                # Dependency injection setup
│   └── errors/                            # Error handling and exceptions
│
└── features/                              # Feature modules (Clean Architecture)
    ├── data/                              # Data layer
    │   ├── model/                         # Data models
    │   │   └── productModel.dart          # Product entity with copyWith
    │   └── services/                      # Data services
    │       └── ProductDataService.dart    # In-memory product data and selectors
    │
    ├── domain/                            # Domain layer (business logic)
    │   ├── entities/                      # Entity definitions
    │   ├── repositories/                  # Repository interfaces
    │   └── usecases/                      # Use case implementations
    │
    └── presentation/                      # Presentation layer (UI)
        ├── cubit/                         # State management (BLoC/Cubit)
        │   ├── login/                     # Login cubit and states
        │   ├── sign_up/                   # Sign-up cubit and states
        │   └── [other cubits]/            # Additional feature cubits
        │
        ├── screens/                       # Feature screens organized by domain
        │   ├── auth/                      # Authentication screens
        │   │   ├── loginScreen.dart       # Login screen
        │   │   ├── signUpScreen.dart      # Sign-up screen
        │   │   └── [auth screens]/        # Other auth-related screens
        │   ├── home/                      # Home feature screens
        │   │   ├── MainScreen.dart        # Tab scaffold and navigation
        │   │   ├── homeScreen.dart        # Home composition using widgets
        │   │   └── [home screens]/        # Other home-related screens
        │   ├── payment/                   # Payment feature screens
        │   │   ├── PayPalScreen.dart      # PayPal payment screen
        │   │   ├── CreditCardScreen.dart  # Credit card payment screen
        │   │   └── OrdersScreen.dart      # Orders and transaction history
        │   └── [other features]/          # Additional feature screens
        │
        └── widgets/                       # Reusable UI components
            ├── CustomBottomNavBar.dart    # Bottom navigation bar
            ├── ProductCardComponent.dart  # Product card widget
            ├── HorizontalProductList.dart # Horizontal scrollable product list
            ├── ProductGridSection.dart    # Product grid display
            │
            ├── auth/                      # Authentication-specific widgets
            │   ├── ButtonSignUp.dart      # Sign-up button
            │   ├── ButtonLoginWith.dart   # Social login button
            │   ├── ButtonContinueLogin.dart # Continue login button
            │   ├── CustomInputField.dart  # Custom text input field
            │   ├── PasswordField.dart     # Password input field
            │   ├── RowFirstAndLastName.dart # First/last name row input
            │   ├── AlreadyHaveAccountRow.dart # "Already have account?" section
            │   ├── TermsAndPrivacyText.dart # Terms and privacy text
            │   └── [auth widgets]/        # Other auth-specific widgets
            │
            └── [other widgets]/           # Other feature-specific widgets


assets/                                    # Static assets
├── icons/                                 # Icon assets
├── all_product/                           # Product images
└── pay/                                   # Payment-related images

fonts/                                     # Custom fonts

pubspec.yaml                               # Dart package configuration
analysis_options.yaml                      # Lint rules configuration
devtools_options.yaml                      # DevTools configuration
```

### Key Directory Descriptions

- **`assets/`** - Images, icons, and other static resources
- **`fonts/`** - Custom typography (Jost font family)

---

Copyright © 2025 Fashion E-Commerce Platform. All rights reserved.
