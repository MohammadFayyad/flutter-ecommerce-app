import 'package:ecommerce_app/features/home_page_screen/cubit/categories_state.dart';
import 'package:ecommerce_app/features/home_page_screen/repo/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  final HomeRepo repo;
  CategoriesCubit(this.repo) : super(CategoriesInitial());
  Future<void> getCategories() async {
    emit(CategoriesLoading());
    final result = await repo.getCategories();
    if (isClosed) return;
    result.fold(
      (e) => emit(CategoriesError(message: e)),
      (list) => emit(CategoriesLoaded(list, categories: list)),
    );
  }
}
