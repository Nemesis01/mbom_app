/*
 * Copyright (c) 2019. Lorem ipsum dolor sit amet, consectetur adipiscing elit.
 * Morbi non lorem porttitor neque feugiat blandit. Ut vitae ipsum eget quam lacinia accumsan.
 * Etiam sed turpis ac ipsum condimentum fringilla. Maecenas magna.
 * Proin dapibus sapien vel ante. Aliquam erat volutpat. Pellentesque sagittis ligula eget metus.
 * Vestibulum commodo. Ut rhoncus gravida arcu.
 */

import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

part 'category.g.dart';

@JsonSerializable()
class Category {
  //region Field(s)
  final String name;
  final String description;
  final List<Category> subCategories;
  //endregion

  //region Constructor(s)
  Category({
    @required this.name,
    this.description,
    this.subCategories,
  });

  /* Category.fromJson(Map<String, dynamic> json)
      : this.name = json['name'],
        this.description = json['description'],
        this.subCategories = json['subCategories'];
*/
  Category.fromMap(Map<String, dynamic> map)
      : this.name = map['name'],
        this.description = map['description'],
        this.subCategories = map['subCategories'];

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
  //endregion

  //region Getter(s) and Setter(s)
  bool get hasChildren => (subCategories.length == 0 || subCategories == null);
  int get childrenCount => (subCategories != null) ? subCategories.length : 0;
  //endregion

  //region Other Method(s)
  Map<String, dynamic> toJson() => _$CategoryToJson(this);
  Map<String, dynamic> toMap() => {
        'name': name,
        'description': description,
        'subCategories': subCategories
      };
  //endregion

}

class CategoryList {
  final List<Category> categories;

  CategoryList({this.categories});
  factory CategoryList.fromJson(List<dynamic> json) {
    return CategoryList(
        categories: json
            .map((entry) => Category.fromJson(entry as Map<String, dynamic>))
            .toList());
  }
}
