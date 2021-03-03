class Caracter {
  final String name;
  final String slogan;
  final int born;

  Caracter(this.name, this.slogan, this.born);

  @override
  String toString() {
    return 'Caracter{name: $name, slogan: $slogan, born: $born}';
  }
}