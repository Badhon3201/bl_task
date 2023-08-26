import 'dart:convert';

class ProductListResponseModel {
  String? q;
  int? from;
  int? to;
  bool? more;
  int? count;
  List<Hit>? hits;

  ProductListResponseModel({
    this.q,
    this.from,
    this.to,
    this.more,
    this.count,
    this.hits,
  });

  factory ProductListResponseModel.fromRawJson(String str) => ProductListResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProductListResponseModel.fromJson(Map<String, dynamic> json) => ProductListResponseModel(
    q: json["q"],
    from: json["from"],
    to: json["to"],
    more: json["more"],
    count: json["count"],
    hits: json["hits"] == null ? [] : List<Hit>.from(json["hits"]!.map((x) => Hit.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "q": q,
    "from": from,
    "to": to,
    "more": more,
    "count": count,
    "hits": hits == null ? [] : List<dynamic>.from(hits!.map((x) => x.toJson())),
  };
}

class Hit {
  Recipe? recipe;

  Hit({
    this.recipe,
  });

  factory Hit.fromRawJson(String str) => Hit.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Hit.fromJson(Map<String, dynamic> json) => Hit(
    recipe: json["recipe"] == null ? null : Recipe.fromJson(json["recipe"]),
  );

  Map<String, dynamic> toJson() => {
    "recipe": recipe?.toJson(),
  };
}

class Recipe {
  String? uri;
  String? label;
  String? image;
  String? source;
  String? url;
  String? shareAs;
  int? recipeYield;
  List<String>? dietLabels;
  List<String>? healthLabels;
  List<String>? cautions;
  List<String>? ingredientLines;
  List<Ingredient>? ingredients;
  double? calories;
  double? totalWeight;
  int? totalTime;
  List<String>? cuisineType;
  List<MealType>? mealType;
  List<DishType>? dishType;
  Map<String, Total>? totalNutrients;
  Map<String, Total>? totalDaily;
  List<Digest>? digest;

  Recipe({
    this.uri,
    this.label,
    this.image,
    this.source,
    this.url,
    this.shareAs,
    this.recipeYield,
    this.dietLabels,
    this.healthLabels,
    this.cautions,
    this.ingredientLines,
    this.ingredients,
    this.calories,
    this.totalWeight,
    this.totalTime,
    this.cuisineType,
    this.mealType,
    this.dishType,
    this.totalNutrients,
    this.totalDaily,
    this.digest,
  });

  factory Recipe.fromRawJson(String str) => Recipe.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Recipe.fromJson(Map<String, dynamic> json) => Recipe(
    uri: json["uri"],
    label: json["label"],
    image: json["image"],
    source: json["source"],
    url: json["url"],
    shareAs: json["shareAs"],
    recipeYield: json["yield"],
    dietLabels: json["dietLabels"] == null ? [] : List<String>.from(json["dietLabels"]!.map((x) => x)),
    healthLabels: json["healthLabels"] == null ? [] : List<String>.from(json["healthLabels"]!.map((x) => x)),
    cautions: json["cautions"] == null ? [] : List<String>.from(json["cautions"]!.map((x) => x)),
    ingredientLines: json["ingredientLines"] == null ? [] : List<String>.from(json["ingredientLines"]!.map((x) => x)),
    ingredients: json["ingredients"] == null ? [] : List<Ingredient>.from(json["ingredients"]!.map((x) => Ingredient.fromJson(x))),
    calories: json["calories"]?.toDouble(),
    totalWeight: json["totalWeight"]?.toDouble(),
    totalTime: json["totalTime"],
    cuisineType: json["cuisineType"] == null ? [] : List<String>.from(json["cuisineType"]!.map((x) => x)),
    mealType: json["mealType"] == null ? [] : List<MealType>.from(json["mealType"]!.map((x) => mealTypeValues.map[x]!)),
    dishType: json["dishType"] == null ? [] : List<DishType>.from(json["dishType"]!.map((x) => dishTypeValues.map[x]!)),
    totalNutrients: Map.from(json["totalNutrients"]!).map((k, v) => MapEntry<String, Total>(k, Total.fromJson(v))),
    totalDaily: Map.from(json["totalDaily"]!).map((k, v) => MapEntry<String, Total>(k, Total.fromJson(v))),
    digest: json["digest"] == null ? [] : List<Digest>.from(json["digest"]!.map((x) => Digest.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "uri": uri,
    "label": label,
    "image": image,
    "source": source,
    "url": url,
    "shareAs": shareAs,
    "yield": recipeYield,
    "dietLabels": dietLabels == null ? [] : List<dynamic>.from(dietLabels!.map((x) => x)),
    "healthLabels": healthLabels == null ? [] : List<dynamic>.from(healthLabels!.map((x) => x)),
    "cautions": cautions == null ? [] : List<dynamic>.from(cautions!.map((x) => x)),
    "ingredientLines": ingredientLines == null ? [] : List<dynamic>.from(ingredientLines!.map((x) => x)),
    "ingredients": ingredients == null ? [] : List<dynamic>.from(ingredients!.map((x) => x.toJson())),
    "calories": calories,
    "totalWeight": totalWeight,
    "totalTime": totalTime,
    "cuisineType": cuisineType == null ? [] : List<dynamic>.from(cuisineType!.map((x) => x)),
    "mealType": mealType == null ? [] : List<dynamic>.from(mealType!.map((x) => mealTypeValues.reverse[x])),
    "dishType": dishType == null ? [] : List<dynamic>.from(dishType!.map((x) => dishTypeValues.reverse[x])),
    "totalNutrients": Map.from(totalNutrients!).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
    "totalDaily": Map.from(totalDaily!).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
    "digest": digest == null ? [] : List<dynamic>.from(digest!.map((x) => x.toJson())),
  };
}

class Digest {
  String? label;
  String? tag;
  SchemaOrgTag? schemaOrgTag;
  double? total;
  bool? hasRdi;
  double? daily;
  Unit? unit;
  List<Digest>? sub;

  Digest({
    this.label,
    this.tag,
    this.schemaOrgTag,
    this.total,
    this.hasRdi,
    this.daily,
    this.unit,
    this.sub,
  });

  factory Digest.fromRawJson(String str) => Digest.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Digest.fromJson(Map<String, dynamic> json) => Digest(
    label: json["label"],
    tag: json["tag"],
    schemaOrgTag: schemaOrgTagValues.map[json["schemaOrgTag"]]!,
    total: json["total"]?.toDouble(),
    hasRdi: json["hasRDI"],
    daily: json["daily"]?.toDouble(),
    unit: unitValues.map[json["unit"]]!,
    sub: json["sub"] == null ? [] : List<Digest>.from(json["sub"]!.map((x) => Digest.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "label": label,
    "tag": tag,
    "schemaOrgTag": schemaOrgTagValues.reverse[schemaOrgTag],
    "total": total,
    "hasRDI": hasRdi,
    "daily": daily,
    "unit": unitValues.reverse[unit],
    "sub": sub == null ? [] : List<dynamic>.from(sub!.map((x) => x.toJson())),
  };
}

enum SchemaOrgTag {
  CARBOHYDRATE_CONTENT,
  CHOLESTEROL_CONTENT,
  FAT_CONTENT,
  FIBER_CONTENT,
  PROTEIN_CONTENT,
  SATURATED_FAT_CONTENT,
  SODIUM_CONTENT,
  SUGAR_CONTENT,
  TRANS_FAT_CONTENT
}

final schemaOrgTagValues = EnumValues({
  "carbohydrateContent": SchemaOrgTag.CARBOHYDRATE_CONTENT,
  "cholesterolContent": SchemaOrgTag.CHOLESTEROL_CONTENT,
  "fatContent": SchemaOrgTag.FAT_CONTENT,
  "fiberContent": SchemaOrgTag.FIBER_CONTENT,
  "proteinContent": SchemaOrgTag.PROTEIN_CONTENT,
  "saturatedFatContent": SchemaOrgTag.SATURATED_FAT_CONTENT,
  "sodiumContent": SchemaOrgTag.SODIUM_CONTENT,
  "sugarContent": SchemaOrgTag.SUGAR_CONTENT,
  "transFatContent": SchemaOrgTag.TRANS_FAT_CONTENT
});

enum Unit {
  EMPTY,
  G,
  KCAL,
  MG,
  UNIT_G
}

final unitValues = EnumValues({
  "%": Unit.EMPTY,
  "g": Unit.G,
  "kcal": Unit.KCAL,
  "mg": Unit.MG,
  "µg": Unit.UNIT_G
});

enum DishType {
  CONDIMENTS_AND_SAUCES,
  MAIN_COURSE,
  STARTER
}

final dishTypeValues = EnumValues({
  "condiments and sauces": DishType.CONDIMENTS_AND_SAUCES,
  "main course": DishType.MAIN_COURSE,
  "starter": DishType.STARTER
});

class Ingredient {
  String? text;
  double? weight;
  String? foodCategory;
  String? foodId;
  String? image;

  Ingredient({
    this.text,
    this.weight,
    this.foodCategory,
    this.foodId,
    this.image,
  });

  factory Ingredient.fromRawJson(String str) => Ingredient.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Ingredient.fromJson(Map<String, dynamic> json) => Ingredient(
    text: json["text"],
    weight: json["weight"]?.toDouble(),
    foodCategory: json["foodCategory"],
    foodId: json["foodId"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "text": text,
    "weight": weight,
    "foodCategory": foodCategory,
    "foodId": foodId,
    "image": image,
  };
}

enum MealType {
  BRUNCH,
  LUNCH_DINNER
}

final mealTypeValues = EnumValues({
  "brunch": MealType.BRUNCH,
  "lunch/dinner": MealType.LUNCH_DINNER
});

class Total {
  String? label;
  double? quantity;
  Unit? unit;

  Total({
    this.label,
    this.quantity,
    this.unit,
  });

  factory Total.fromRawJson(String str) => Total.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Total.fromJson(Map<String, dynamic> json) => Total(
    label: json["label"],
    quantity: json["quantity"]?.toDouble(),
    unit: unitValues.map[json["unit"]]!,
  );

  Map<String, dynamic> toJson() => {
    "label": label,
    "quantity": quantity,
    "unit": unitValues.reverse[unit],
  };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
