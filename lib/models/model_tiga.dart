class ModelTiga {
  List<Data>? data;
  bool? success;

  ModelTiga({this.data, this.success});

  ModelTiga.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['success'] = this.success;
    return data;
  }
}

class Data {
  int? mainId;
  String? firstName;
  String? lastName;
  List<Categories>? categories;

  Data({this.mainId, this.firstName, this.lastName, this.categories});

  Data.fromJson(Map<String, dynamic> json) {
    mainId = json['MainId'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(new Categories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['MainId'] = this.mainId;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    if (this.categories != null) {
      data['categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Categories {
  int? categoryID;
  String? categoryName;

  Categories({this.categoryID, this.categoryName});

  Categories.fromJson(Map<String, dynamic> json) {
    categoryID = json['CategoryID'];
    categoryName = json['CategoryName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['CategoryID'] = this.categoryID;
    data['CategoryName'] = this.categoryName;
    return data;
  }
}
