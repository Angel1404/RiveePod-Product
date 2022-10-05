import 'dart:convert';

ProductoModel productoModelFromMap(String str) => ProductoModel.fromMap(json.decode(str));

String productoModelToMap(ProductoModel data) => json.encode(data.toMap());

class ProductoModel {
  ProductoModel({
    required this.count,
    required this.start,
    required this.total,
    required this.products,
  });

  final int count;
  final int start;
  final int total;
  final List<Product> products;

  factory ProductoModel.fromMap(Map<String, dynamic> json) => ProductoModel(
        count: json["count"],
        start: json["start"],
        total: json["total"],
        products: List<Product>.from(json["products"].map((x) => Product.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "count": count,
        "start": start,
        "total": total,
        "products": List<dynamic>.from(products.map((x) => x.toMap())),
      };
}

class Product {
  Product({
    required this.id,
    required this.name,
    required this.gamme,
    required this.price,
    required this.linkedProducts,
    required this.color,
    required this.originalPrice,
    required this.productPromotions,
    required this.images,
    required this.finalUrl,
    required this.masterId,
    required this.orderable,
    required this.variants,
    required this.discountPrice,
  });

  final String id;
  final String name;
  final String gamme;
  final double price;
  final List<Product> linkedProducts;
  final String color;
  final double originalPrice;
  final List<ProductPromotion> productPromotions;
  final List<ImageProduct> images;
  final String finalUrl;
  final dynamic masterId;
  final bool orderable;
  final List<Variant>? variants;
  final String discountPrice;

  factory Product.fromMap(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        gamme: json["gamme"],
        price: json["price"].toDouble(),
        linkedProducts: List<Product>.from(json["linked_products"].map((x) => Product.fromMap(x))),
        color: json["color"],
        originalPrice: json["originalPrice"].toDouble(),
        productPromotions: List<ProductPromotion>.from(json["product_promotions"].map((x) => ProductPromotion.fromMap(x))),
        images: List<ImageProduct>.from(json["images"].map((x) => ImageProduct.fromMap(x))),
        finalUrl: json["finalUrl"],
        masterId: json["masterId"],
        orderable: json["orderable"],
        variants: json["variants"] == null ? null : List<Variant>.from(json["variants"].map((x) => Variant.fromMap(x))),
        discountPrice: json["discountPrice"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "gamme": gamme,
        "price": price,
        "linked_products": List<dynamic>.from(linkedProducts.map((x) => x.toMap())),
        "color": color,
        "originalPrice": originalPrice,
        "product_promotions": List<dynamic>.from(productPromotions.map((x) => x.toMap())),
        "images": List<dynamic>.from(images.map((x) => x.toMap())),
        "finalUrl": finalUrl,
        "masterId": masterId,
        "orderable": orderable,
        "variants": variants == null ? null : List<dynamic>.from(variants!.map((x) => x.toMap())),
        "discountPrice": discountPrice,
      };
}

class ImageProduct {
  ImageProduct({
    required this.alt,
    required this.link,
    required this.title,
  });

  final String alt;
  final String link;
  final String title;

  factory ImageProduct.fromMap(Map<String, dynamic> json) => ImageProduct(
        alt: json["alt"],
        link: json["link"],
        title: json["title"],
      );

  Map<String, dynamic> toMap() => {
        "alt": alt,
        "link": link,
        "title": title,
      };
}

class ProductPromotion {
  ProductPromotion({
    required this.link,
    required this.promotionId,
    required this.calloutMsg,
    required this.promotionalPrice,
  });

  final String link;
  final String promotionId;
  final String calloutMsg;
  final double promotionalPrice;

  factory ProductPromotion.fromMap(Map<String, dynamic> json) => ProductPromotion(
        link: json["link"],
        promotionId: json["promotion_id"],
        calloutMsg: json["callout_msg"],
        promotionalPrice: json["promotional_price"].toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "link": link,
        "promotion_id": promotionId,
        "callout_msg": calloutMsg,
        "promotional_price": promotionalPrice,
      };
}

class Variant {
  Variant({
    required this.productId,
    required this.orderable,
    required this.variationValues,
  });

  final String productId;
  final bool orderable;
  final VariationValues variationValues;

  factory Variant.fromMap(Map<String, dynamic> json) => Variant(
        productId: json["product_id"],
        orderable: json["orderable"],
        variationValues: VariationValues.fromMap(json["variation_values"]),
      );

  Map<String, dynamic> toMap() => {
        "product_id": productId,
        "orderable": orderable,
        "variation_values": variationValues.toMap(),
      };
}

class VariationValues {
  VariationValues({
    required this.size,
  });

  final String size;

  factory VariationValues.fromMap(Map<String, dynamic> json) => VariationValues(
        size: json["size"],
      );

  Map<String, dynamic> toMap() => {
        "size": size,
      };
}
