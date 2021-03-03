class Caracter {
  final int id;
  final String name;
  final String slogan;
  final int born;

  Caracter(this.id,this.name, this.slogan, this.born);

  @override
  String toString() {
    return 'Caracter{id: $id, name: $name, slogan: $slogan, born: $born}';
  }
}