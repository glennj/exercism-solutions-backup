class BinarySearchTree {
  String data;
  BinarySearchTree? left;
  BinarySearchTree? right;

  BinarySearchTree(this.data);

  BinarySearchTree get root => this;

  void insert(String value) {
    if (value.compareTo(this.data) <= 0) {
      if (this.left == null) {
        this.left = BinarySearchTree(value);
      } else {
        this.left!.insert(value);
      }
    } else {
      if (this.right == null) {
        this.right = BinarySearchTree(value);
      } else {
        this.right!.insert(value);
      }
    }
  }

  List<String> get sortedData {
    var values = <String>[];
    this.forEach((value) => values.add(value));
    return values;
  }

  void forEach(void Function(String) func) {
    this.left?.forEach(func);
    func(this.data);
    this.right?.forEach(func);
  }
}
