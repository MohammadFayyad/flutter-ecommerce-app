# E-Commerce App

A modern, production-ready Flutter e-commerce application featuring clean architecture, BLoC state management, GoRouter navigation, and robust networking with Dio. This project is designed for scalability, maintainability, and a seamless user experience across platforms.

## Features

- User authentication (login, registration)
- Product listing and details
- Shopping cart management
- Secure storage for sensitive data
- Responsive UI (mobile, web, desktop)
- State management with BLoC
- Navigation with GoRouter
- Network requests with Dio
- Dependency injection via service locator
- Error handling and loading animations

## Folder Structure

```
lib/
 main.dart                # App entry point
 core/
  constants/             # App-wide constants
  networking/            # API endpoints, network logic
  routing/               # App routing (GoRouter)
  style/                 # Theme and style definitions
  utils/                 # Utilities, service locator
  widgets/               # Shared widgets
 features/
  account_screen/        # User account features
  address_screen/        # Address management
  auth/                  # Login, registration
  home_page_screen/      # Home page and product list
  my_cart/               # Shopping cart
  product_details_screen/# Product details
  sign_up_screen/        # Registration
  splash_screen/         # Splash/loading
assets/
 icons/                   # App icons
 images/                  # Product and UI images
 lottie/                  # Lottie animations
```

## Getting Started

1. **Clone the repository:**

   ```sh
   git clone https://github.com/YOUR_GITHUB_USERNAME/e_commerce_app.git
   cd e_commerce_app
   ```

2. **Install dependencies:**

   ```sh
   flutter pub get
   ```

3. **Run the app:**

   ```sh
   flutter run
   ```

## Requirements

- Flutter 3.10.4 or later
- Dart 3.0+
- Android Studio, VS Code, or Xcode (for platform-specific builds)

## Contribution Guidelines

- Fork the repository and create your branch from `main`.
- Ensure code is well-documented and tested.
- Submit a pull request with a clear description of your changes.

## Documentation

- See `COMPREHENSIVE_REVIEW.md` and `REVIEW_VERIFICATION.md` for code review and verification details.
- See `README_REVIEW.md` for a navigation index and summary.

## License

This project is licensed under the MIT License.

## Contact

For questions or support, please open an issue or contact the maintainer at [your-email@example.com].
