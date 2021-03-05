class Caracter {
  final int id;
  final String name;
  final String slogan;
  final int born;
  final int size;


  Caracter(this.id,this.name, this.slogan, this.born, this.size);

  @override
  String toString() {
    return 'Caracter{id: $id, name: $name, slogan: $slogan, born: $born, lado: $size}';
  }
}