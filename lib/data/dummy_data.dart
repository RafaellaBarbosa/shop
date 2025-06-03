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
    imageUrl:
        'https://m.media-amazon.com/images/I/51PEgOzPKLL.__AC_SX300_SY300_QL70_ML2_.jpg',
    isFavorite: false,
  ),

  Product(
    id: 'p6',
    name: 'Cafeteira Elétrica',
    description: 'Prepare café rapidamente com esta cafeteira prática.',
    price: 199.90,
    imageUrl:
        'https://m.media-amazon.com/images/I/51vVvDVetDL.__AC_SX300_SY300_QL70_ML2_.jpg',
    isFavorite: false,
  ),
  Product(
    id: 'p7',
    name:
        'O guia de Dart: Fundamentos, prática, conceitos avançados e tudo mais',
    description:
        'Dart é uma linguagem de programação que está em ascensão. Criada e mantida pelo Google, vem ganhando destaque e apoio da comunidade nos últimos anos, com a popularidade crescente do Flutter. Hoje, ela é considerada multiplataforma, já que a partir dela e de seus frameworks conseguimos gerar aplicações nativas e de alta performance em server-side, na web, em desktop, nos dispositivos mobile e em IoT. Dart é orientada a objetos, com o benefício de ser tipada, possui conceitos de linguagem funcional, ainda em conjunto com um belo suporte a programação reativa. Tudo isso a tem tornado uma grande carta na manga no repertório de pessoas desenvolvedoras.Neste livro, Julio Bitencourt traz um guia de viagem por todo o core da linguagem Dart. Você partirá dos conceitos mais básicos envolvendo a sintaxe, como tipos, operadores, estruturas de repetição, até features mais avançadas da linguagem, como programação assíncrona, generics, streams e isolates. Toda a parte teórica é aprofundada, seguida de prática com exemplos esclarecedores, permeados de dicas e boas práticas para você refinar suas habilidades em Dart. Pegue sua toalha e embarque nessa viagem.',
    price: 89.90,
    imageUrl:
        'https://m.media-amazon.com/images/I/51nn2rWyTVL._SY445_SX342_PQ7_.jpg',
    isFavorite: true,
  ),
  Product(
    id: 'p8',
    name: 'Tênis Esportivo',
    description: 'Tênis confortável para corrida e atividades físicas.',
    price: 299.99,
    imageUrl: 'https://imgnike-a.akamaihd.net/768x768/0116875JA1.jpg',
    isFavorite: true,
  ),
];
