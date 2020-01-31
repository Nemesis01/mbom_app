import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:mbom_app/blocs/bloc_base.dart';
import 'package:mbom_app/models/category.dart';
import 'package:rxdart/rxdart.dart';

class CategoriesBloc extends BlocBase {
  //region Field(s)
  List<Category> _categories;
  //endregion

  //region Streams Controllers Subjects
  BehaviorSubject<List<Category>> _categoriesSubject =
      new BehaviorSubject<List<Category>>();
  StreamController<List<Category>> _controller = new StreamController();

  StreamController<int> _intController = new StreamController<int>();
  //endregion

  //region Constructor(s)
  CategoriesBloc() {
    //_controller.sink.add(_categories);
    _intController.sink.add(1);
    _loadCategories();
  }
  //endregion

  //region Observables, Streams
  Observable<List<Category>> get categoriesObservable =>
      _categoriesSubject.stream;
  Stream<List<Category>> get categories => _controller.stream;
  Stream<int> get outIndex => _intController.stream;
  //endregion

  //region
  Future<String> _loadJsonFromAsset() async {
    return await rootBundle.loadString('assets/categories.json');
  }

  List<Category> _loadCategoriesFromJson(String response) {
    return (response == null)
        ? []
        : jsonDecode(response.toString())
            .cast<Map<String, dynamic>>()
            .map<Category>((json) => new Category.fromJson(json))
            .toList();
  }

  void _loadCategories() async {
    var jsonString = await _loadJsonFromAsset();
    _categories = _loadCategoriesFromJson(jsonString);
    _controller.sink.add(_categories);
  }
  //endregion

  @override
  void dispose() {
    _categoriesSubject.close();
    _controller.close();
  }
}
