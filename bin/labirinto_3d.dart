import 'dart:math';

void main() {
  // Definir uma matriz tridimensional de 100x100x100
  List<List<List<int>>> matrix = List.generate(
    100,
    (i) => List.generate(
      100,
      (j) => List.generate(100, (k) => Random().nextInt(201) - 100),
    ),
  );

  // Coordenadas iniciais e finais
  int x1 = 0, y1 = 0, z1 = 0;
  int xf = 99, yf = 99, zf = 99;

  // Coletar valores a partir das coordenadas iniciais até as coordenadas finais
  List<int> coletados = [];
  List<String> caminho = [];
  int x = x1, y = y1, z = z1;
  while (x <= xf && y <= yf && z <= zf && coletados.length < 300) {
    // Verificar se essa posição já foi coletada antes
    int valor = matrix[x][y][z];
    if (!coletados.contains(valor)) {
      // Coletar o valor da posição atual
      coletados.add(valor);

      // Encontrar a próxima posição a coletar baseada no valor
      if (valor >= 0) {
        if (x < xf) {
          x += 1;
        } else if (y < yf) {
          y += 1;
        } else {
          z += 1;
        }
      } else {
        if (x > x1) {
          x -= 1;
        } else if (y > y1) {
          y -= 1;
        } else {
          z -= 1;
        }
      }
    } else {
      // Se essa posição já foi coletada, encontrar a próxima posição a coletar
      if (x < xf) {
        x += 1;
      } else if (y < yf) {
        y += 1;
      } else {
        z += 1;
      }
    }
    caminho.add("($x, $y, $z)");
  }

  // Imprimir os valores coletados e a quantidade de valores coletados
  print("Valores coletados: $coletados");
  print("$caminho\n");
  print("Quantidade de valores coletados: ${coletados.length}");
}
