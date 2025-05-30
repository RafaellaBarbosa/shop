import 'package:shop/models/product.dart';

final dummyProducts = [
  Product(
    id: 'p1',
    name: 'Red Shirt',
    description: 'A red shirt - it is pretty red!',
    price: 29.99,
    imageUrl:
        'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    isFavorite: false,
  ),
  Product(
    id: 'p2',
    name: 'Trousers',
    description: 'A nice pair of trousers.',
    price: 59.99,
    imageUrl:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
    isFavorite: false,
  ),
  Product(
    id: 'p3',
    name: 'Yellow Scarf',
    description: 'Warm and cozy - exactly what you need for the winter.',
    price: 19.99,
    imageUrl: 'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
    isFavorite: false,
  ),
  Product(
    id: 'p4',
    name: 'A Pan',
    description: 'Prepare any meal you want.',
    price: 49.99,
    imageUrl:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
    isFavorite: false,
  ),

  Product(
    id: 'p5',
    name: 'Smartphone X',
    description: 'Um smartphone de última geração com excelente desempenho.',
    price: 3999.99,
    imageUrl: 'https://example.com/images/smartphone.png',
    isFavorite: false,
  ),
  Product(
    id: 'p5',
    name: 'Tênis Esportivo',
    description: 'Tênis confortável para corrida e atividades físicas.',
    price: 299.99,
    imageUrl: 'https://example.com/images/tenis.png',
    isFavorite: true,
  ),
  Product(
    id: 'p6',
    name: 'Cafeteira Elétrica',
    description: 'Prepare café rapidamente com esta cafeteira prática.',
    price: 199.90,
    imageUrl: 'https://example.com/images/cafeteira.png',
    isFavorite: false,
  ),
  Product(
    id: 'p7',
    name: 'Livro de Flutter',
    description:
        'Aprenda Flutter do básico ao avançado com este guia completo.',
    price: 89.90,
    imageUrl: 'https://example.com/images/flutter_book.png',
    isFavorite: true,
  ),
];
