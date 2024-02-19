class Cart {
  int? id;
  String? name;
  int? price;
  String? imageUrl;

  Cart({this.id, this.name, this.price, this.imageUrl});

  Cart.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['price'] = price;
    data['image_url'] = imageUrl;
    return data;
  }
}