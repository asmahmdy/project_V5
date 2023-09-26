class Product {
  int? id;
  String? title;
  String? date;
  String? image;
  int? quantity;
  int? sellingPrice;
  String? description;
  int? catagory;

  Product(
      {this.id,
      this.title,
      this.date,
      this.image,
      this.quantity,
      this.sellingPrice,
      this.description,
      this.catagory});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    date = json['date'];
    image = json['image'];
    quantity = json['market_price'];
    sellingPrice = json['selling_price'];
    description = json['description'];
    catagory = json['catagory'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['date'] = this.date;
    data['image'] = this.image;
    data['market_price'] = this.quantity;
    data['selling_price'] = this.sellingPrice;
    data['description'] = this.description;
    data['catagory'] = this.catagory;
    return data;
  }
}
