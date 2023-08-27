import 'dart:convert';

class ProductListResponseModel {
  int? from;
  int? to;
  int? count;
  ProductListResponseModelLinks? links;
  List<Hit>? hits;

  ProductListResponseModel({
    this.from,
    this.to,
    this.count,
    this.links,
    this.hits,
  });

  factory ProductListResponseModel.fromRawJson(String str) =>
      ProductListResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProductListResponseModel.fromJson(Map<String, dynamic> json) =>
      ProductListResponseModel(
        from: json["from"],
        to: json["to"],
        count: json["count"],
        links: json["_links"] == null
            ? null
            : ProductListResponseModelLinks.fromJson(json["_links"]),
        hits: json["hits"] == null
            ? []
            : List<Hit>.from(json["hits"]!.map((x) => Hit.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "from": from,
        "to": to,
        "count": count,
        "_links": links?.toJson(),
        "hits": hits == null
            ? []
            : List<dynamic>.from(hits!.map((x) => x.toJson())),
      };
}

class Hit {
  Recipe? recipe;
  HitLinks? links;

  Hit({
    this.recipe,
    this.links,
  });

  factory Hit.fromRawJson(String str) => Hit.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Hit.fromJson(Map<String, dynamic> json) => Hit(
        recipe: json["recipe"] == null ? null : Recipe.fromJson(json["recipe"]),
        links:
            json["_links"] == null ? null : HitLinks.fromJson(json["_links"]),
      );

  Map<String, dynamic> toJson() => {
        "recipe": recipe?.toJson(),
        "_links": links?.toJson(),
      };
}

class HitLinks {
  Self? self;

  HitLinks({
    this.self,
  });

  factory HitLinks.fromRawJson(String str) =>
      HitLinks.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory HitLinks.fromJson(Map<String, dynamic> json) => HitLinks(
        self: json["self"] == null ? null : Self.fromJson(json["self"]),
      );

  Map<String, dynamic> toJson() => {
        "self": self?.toJson(),
      };
}

class Self {
  String? title;
  String? href;

  Self({
    this.title,
    this.href,
  });

  factory Self.fromRawJson(String str) => Self.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Self.fromJson(Map<String, dynamic> json) => Self(
        title: json["title"],
        href: json["href"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "href": href,
      };
}

class Recipe {
  String? uri;
  String? label;
  String? image;
  Images? images;
  String? source;
  String? url;
  String? shareAs;
  dynamic recipeYield;
  List<String>? dietLabels;
  List<String>? healthLabels;
  List<String>? cautions;
  List<String>? ingredientLines;
  List<Ingredient>? ingredients;
  double? calories;
  double? totalWeight;
  dynamic totalTime;
  List<String>? cuisineType;
  List<String>? mealType;
  List<String>? dishType;
  Map<String, Total>? totalNutrients;
  Map<String, Total>? totalDaily;
  List<Digest>? digest;

  Recipe({
    this.uri,
    this.label,
    this.image,
    this.images,
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
        images: json["images"] == null ? null : Images.fromJson(json["images"]),
        source: json["source"],
        url: json["url"],
        shareAs: json["shareAs"],
        recipeYield: json["yield"],
        dietLabels: json["dietLabels"] == null
            ? []
            : List<String>.from(json["dietLabels"]!.map((x) => x)),
        healthLabels: json["healthLabels"] == null
            ? []
            : List<String>.from(json["healthLabels"]!.map((x) => x)),
        cautions: json["cautions"] == null
            ? []
            : List<String>.from(json["cautions"]!.map((x) => x)),
        ingredientLines: json["ingredientLines"] == null
            ? []
            : List<String>.from(json["ingredientLines"]!.map((x) => x)),
        ingredients: json["ingredients"] == null
            ? []
            : List<Ingredient>.from(
                json["ingredients"]!.map((x) => Ingredient.fromJson(x))),
        calories: json["calories"]?.toDouble(),
        totalWeight: json["totalWeight"]?.toDouble(),
        totalTime: json["totalTime"],
        cuisineType: json["cuisineType"] == null
            ? []
            : List<String>.from(json["cuisineType"]!.map((x) => x)),
        mealType: json["mealType"] == null
            ? []
            : List<String>.from(json["mealType"]!.map((x) => x)),
        dishType: json["dishType"] == null
            ? []
            : List<String>.from(json["dishType"]!.map((x) => x)),
        totalNutrients: Map.from(json["totalNutrients"]!)
            .map((k, v) => MapEntry<String, Total>(k, Total.fromJson(v))),
        totalDaily: Map.from(json["totalDaily"]!)
            .map((k, v) => MapEntry<String, Total>(k, Total.fromJson(v))),
        digest: json["digest"] == null
            ? []
            : List<Digest>.from(json["digest"]!.map((x) => Digest.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "uri": uri,
        "label": label,
        "image": image,
        "images": images?.toJson(),
        "source": source,
        "url": url,
        "shareAs": shareAs,
        "yield": recipeYield,
        "dietLabels": dietLabels == null
            ? []
            : List<dynamic>.from(dietLabels!.map((x) => x)),
        "healthLabels": healthLabels == null
            ? []
            : List<dynamic>.from(healthLabels!.map((x) => x)),
        "cautions":
            cautions == null ? [] : List<dynamic>.from(cautions!.map((x) => x)),
        "ingredientLines": ingredientLines == null
            ? []
            : List<dynamic>.from(ingredientLines!.map((x) => x)),
        "ingredients": ingredients == null
            ? []
            : List<dynamic>.from(ingredients!.map((x) => x.toJson())),
        "calories": calories,
        "totalWeight": totalWeight,
        "totalTime": totalTime,
        "cuisineType": cuisineType == null
            ? []
            : List<dynamic>.from(cuisineType!.map((x) => x)),
        "mealType":
            mealType == null ? [] : List<dynamic>.from(mealType!.map((x) => x)),
        "dishType":
            dishType == null ? [] : List<dynamic>.from(dishType!.map((x) => x)),
        "totalNutrients": Map.from(totalNutrients!)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        "totalDaily": Map.from(totalDaily!)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        "digest": digest == null
            ? []
            : List<dynamic>.from(digest!.map((x) => x.toJson())),
      };
}

class Digest {
  String? label;
  String? tag;
  String? schemaOrgTag;
  double? total;
  bool? hasRdi;
  double? daily;
  String? unit;
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
        schemaOrgTag: json["schemaOrgTag"],
        total: json["total"]?.toDouble(),
        hasRdi: json["hasRDI"],
        daily: json["daily"]?.toDouble(),
        unit: json["unit"],
        sub: json["sub"] == null
            ? []
            : List<Digest>.from(json["sub"]!.map((x) => Digest.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "label": label,
        "tag": tag,
        "schemaOrgTag": schemaOrgTag,
        "total": total,
        "hasRDI": hasRdi,
        "daily": daily,
        "unit": unit,
        "sub":
            sub == null ? [] : List<dynamic>.from(sub!.map((x) => x.toJson())),
      };
}

class Images {
  Large? thumbnail;
  Large? small;
  Large? regular;
  Large? large;

  Images({
    this.thumbnail,
    this.small,
    this.regular,
    this.large,
  });

  factory Images.fromRawJson(String str) => Images.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Images.fromJson(Map<String, dynamic> json) => Images(
        thumbnail: json["THUMBNAIL"] == null
            ? null
            : Large.fromJson(json["THUMBNAIL"]),
        small: json["SMALL"] == null ? null : Large.fromJson(json["SMALL"]),
        regular:
            json["REGULAR"] == null ? null : Large.fromJson(json["REGULAR"]),
        large: json["LARGE"] == null ? null : Large.fromJson(json["LARGE"]),
      );

  Map<String, dynamic> toJson() => {
        "THUMBNAIL": thumbnail?.toJson(),
        "SMALL": small?.toJson(),
        "REGULAR": regular?.toJson(),
        "LARGE": large?.toJson(),
      };
}

class Large {
  String? url;
  int? width;
  int? height;

  Large({
    this.url,
    this.width,
    this.height,
  });

  factory Large.fromRawJson(String str) => Large.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Large.fromJson(Map<String, dynamic> json) => Large(
        url: json["url"],
        width: json["width"],
        height: json["height"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "width": width,
        "height": height,
      };
}

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

  factory Ingredient.fromRawJson(String str) =>
      Ingredient.fromJson(json.decode(str));

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

class Total {
  String? label;
  double? quantity;
  String? unit;

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
        unit: json["unit"],
      );

  Map<String, dynamic> toJson() => {
        "label": label,
        "quantity": quantity,
        "unit": unit,
      };
}

class ProductListResponseModelLinks {
  ProductListResponseModelLinks();

  factory ProductListResponseModelLinks.fromRawJson(String str) =>
      ProductListResponseModelLinks.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProductListResponseModelLinks.fromJson(Map<String, dynamic> json) =>
      ProductListResponseModelLinks();

  Map<String, dynamic> toJson() => {};
}
