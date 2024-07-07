class Product {
  Product({
    required this.name,
    required this.description,
    required this.uniqueId,
    required this.urlSlug,
    required this.isAvailable,
    required this.isService,
    required this.previousUrlSlugs,
    required this.unavailable,
    required this.unavailableStart,
    required this.unavailableEnd,
    required this.id,
    required this.parentProductId,
    required this.parent,
    required this.organizationId,
    required this.stockId,
    required this.productImage,
    required this.categories,
    required this.dateCreated,
    required this.lastUpdated,
    required this.userId,
    required this.photos,
    required this.prices,
    required this.stocks,
    required this.currentPrice,
    required this.isDeleted,
    required this.availableQuantity,
    required this.sellingPrice,
    required this.discountedPrice,
    required this.buyingPrice,
    required this.extraInfos,
    required this.featuredReviews,
    required this.unavailability,
  });

  final String? name;
  final dynamic description;
  final String? uniqueId;
  final String? urlSlug;
  final bool? isAvailable;
  final bool? isService;
  final dynamic previousUrlSlugs;
  final bool? unavailable;
  final dynamic unavailableStart;
  final dynamic unavailableEnd;
  final String? id;
  final dynamic parentProductId;
  final dynamic parent;
  final String? organizationId;
  final dynamic stockId;
  final List<dynamic> productImage;
  final List<dynamic> categories;
  final DateTime? dateCreated;
  final DateTime? lastUpdated;
  final String? userId;
  final List<dynamic> photos;
  final dynamic prices;
  final dynamic stocks;
  final List<CurrentPrice> currentPrice;
  final bool? isDeleted;
  final dynamic availableQuantity;
  final dynamic sellingPrice;
  final dynamic discountedPrice;
  final dynamic buyingPrice;
  final dynamic extraInfos;
  final dynamic featuredReviews;
  final List<dynamic> unavailability;

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      name: json["name"],
      description: json["description"],
      uniqueId: json["unique_id"],
      urlSlug: json["url_slug"],
      isAvailable: json["is_available"],
      isService: json["is_service"],
      previousUrlSlugs: json["previous_url_slugs"],
      unavailable: json["unavailable"],
      unavailableStart: json["unavailable_start"],
      unavailableEnd: json["unavailable_end"],
      id: json["id"],
      parentProductId: json["parent_product_id"],
      parent: json["parent"],
      organizationId: json["organization_id"],
      stockId: json["stock_id"],
      productImage: json["product_image"] == null
          ? []
          : List<dynamic>.from(json["product_image"]!.map((x) => x)),
      categories: json["categories"] == null
          ? []
          : List<dynamic>.from(json["categories"]!.map((x) => x)),
      dateCreated: DateTime.tryParse(json["date_created"] ?? ""),
      lastUpdated: DateTime.tryParse(json["last_updated"] ?? ""),
      userId: json["user_id"],
      photos: json["photos"] == null
          ? []
          : List<dynamic>.from(json["photos"]!.map((x) => x)),
      prices: json["prices"],
      stocks: json["stocks"],
      currentPrice: json["current_price"] == null
          ? []
          : List<CurrentPrice>.from(
              json["current_price"]!.map((x) => CurrentPrice.fromJson(x))),
      isDeleted: json["is_deleted"],
      availableQuantity: json["available_quantity"],
      sellingPrice: json["selling_price"],
      discountedPrice: json["discounted_price"],
      buyingPrice: json["buying_price"],
      extraInfos: json["extra_infos"],
      featuredReviews: json["featured_reviews"],
      unavailability: json["unavailability"] == null
          ? []
          : List<dynamic>.from(json["unavailability"]!.map((x) => x)),
    );
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "unique_id": uniqueId,
        "url_slug": urlSlug,
        "is_available": isAvailable,
        "is_service": isService,
        "previous_url_slugs": previousUrlSlugs,
        "unavailable": unavailable,
        "unavailable_start": unavailableStart,
        "unavailable_end": unavailableEnd,
        "id": id,
        "parent_product_id": parentProductId,
        "parent": parent,
        "organization_id": organizationId,
        "stock_id": stockId,
        "product_image": productImage.map((x) => x).toList(),
        "categories": categories.map((x) => x).toList(),
        "date_created": dateCreated?.toIso8601String(),
        "last_updated": lastUpdated?.toIso8601String(),
        "user_id": userId,
        "photos": photos.map((x) => x).toList(),
        "prices": prices,
        "stocks": stocks,
        "current_price": currentPrice.map((x) => x?.toJson()).toList(),
        "is_deleted": isDeleted,
        "available_quantity": availableQuantity,
        "selling_price": sellingPrice,
        "discounted_price": discountedPrice,
        "buying_price": buyingPrice,
        "extra_infos": extraInfos,
        "featured_reviews": featuredReviews,
        "unavailability": unavailability.map((x) => x).toList(),
      };

  @override
  String toString() {
    return "$name, $description, $uniqueId, $urlSlug, $isAvailable, $isService, $previousUrlSlugs, $unavailable, $unavailableStart, $unavailableEnd, $id, $parentProductId, $parent, $organizationId, $stockId, $productImage, $categories, $dateCreated, $lastUpdated, $userId, $photos, $prices, $stocks, $currentPrice, $isDeleted, $availableQuantity, $sellingPrice, $discountedPrice, $buyingPrice, $extraInfos, $featuredReviews, $unavailability, ";
  }
}

class CurrentPrice {
  CurrentPrice({
    required this.ngn,
  });

  final List<dynamic> ngn;

  factory CurrentPrice.fromJson(Map<String, dynamic> json) {
    return CurrentPrice(
      ngn: json["NGN"] == null
          ? []
          : List<dynamic>.from(json["NGN"]!.map((x) => x)),
    );
  }

  Map<String, dynamic> toJson() => {
        "NGN": ngn.map((x) => x).toList(),
      };

  @override
  String toString() {
    return "$ngn, ";
  }
}
