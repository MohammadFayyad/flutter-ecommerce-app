abstract class CategoriesState {}

class CategoriesInitial extends CategoriesState {}

class CategoriesLoaded extends CategoriesState {
  final List<String> categories;
  CategoriesLoaded(List<String> list, {required this.categories});
}

class CategoriesError extends CategoriesState {
  final String message;
  CategoriesError({required this.message});
}

class CategoriesLoading extends CategoriesState {}
