class ApiEndpoints {
  static const String apiKey = 'e2f0698a8ab14dfdb4bdcbbafd23ca81';
  static String baseUrl = 'https://fakestoreapi.com';
  static const String login = '/auth/login';
  static const String register = '/users';
  static const String allProducts = '/products';
  static const String getCategory = '/category/';
  static const String allCategories = '/products/categories';
  static const String categoryProducts = '/products/category/';
  static const String carts = '/carts';

  void pr() {
    print(ApiEndpoints.carts);
  }
}
