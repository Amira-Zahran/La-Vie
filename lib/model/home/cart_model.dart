class Plants {
  String name = "";
  String price = "";
  int quantity = 1;
  String img = "";
  int id = -1;
  Plants();

  Plants.fromDbMap(Map<String, dynamic> map) {
    name = map['name'];
    price = map['price'];
    quantity = map['quantity'];
    img = map['img'];
    id = map['id'];
  }

}
