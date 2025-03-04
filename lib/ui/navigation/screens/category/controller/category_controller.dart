import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../../../data/model/category_model.dart';
import '../../../../../data/model/subcategory_model.dart';
import '../../../../../global_variables.dart';
import '../../../../../common/base/controller/base_controller.dart';

class CategoryController extends BaseController {
  var categories = <Category>[].obs;
  var subcategories = <SubCategory>[].obs;
  var isLoading = true.obs;
  var selectedCategory = Rx<Category?>(null);
  var isLoadingSubcategories = false.obs;
 
  @override
  void onInit() {
    super.onInit();
    loadCategories().then((_) {
      for (var category in categories) {
        if (category.name == "Electronic") {
          selectCategory(category);
          break;
        }
      }
    });
  }

  Future<void> loadCategories() async {
    try {
      isLoading(true);
      http.Response response = await http.get(
        Uri.parse('$uri/api/categories'),
        headers: <String, String>{
          "Content-Type": 'application/json; charset=UTF-8'
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        categories.value = data.map((category) =>
            Category.fromJson(category as Map<String, dynamic>)).toList();
      } else {
        throw Exception('Failed to load categories.');
      }
    } catch (e) {
      print("Error loading categories: $e");
    } finally {
      isLoading(false);
    }
  }

  void loadSubCategories(String categoryName) async {
    try {
      isLoadingSubcategories(true);
      final apiUrl = "$uri/api/category/$categoryName/subcategories";
      print("Fetching subcategories from: $apiUrl");

      http.Response response = await http.get(
        Uri.parse(apiUrl),
        headers: <String, String>{"Content-Type": "application/json; charset=UTF-8"},
      );

      print("API Response: ${response.body}");

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        subcategories.value = data.map((subcategory) =>
            SubCategory.fromJson(subcategory as Map<String, dynamic>)).toList();
      } else {
        subcategories.clear();
        print("No subcategories found.");
      }
    } catch (e) {
      print("Error fetching subcategories: $e");
      subcategories.clear();
    } finally {
      isLoadingSubcategories(false);
    }
  }

  void selectCategory(Category category) {
    selectedCategory.value = category;
    loadSubCategories(category.name);
  }
}
