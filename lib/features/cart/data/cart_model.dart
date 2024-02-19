class Cart {
  int? id;
  String? name;
  int? price;
  String? imageUrl;
  int? count;

  Cart({this.id, this.name, this.price, this.imageUrl, this.count});

  Cart.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    imageUrl = json['image_url'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['price'] = price;
    data['image_url'] = imageUrl;
    data['count'] = count;
    return data;
  }
}