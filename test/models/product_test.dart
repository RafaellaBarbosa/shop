import 'package:flutter_test/flutter_test.dart';
import 'package:shop/models/product.dart';

void main() {
  group('Product', () {
    late Product product;

    setUp(() {
      product = Product(
        id: '1',
        title: 'Test Product',
        description: 'Test Description',
        price: 9.99,
        imageUrl: 'https://example.com/image.png',
        isFavorite: false,
      );
    });
    test('should create a product with correct properties', () {
      expect(product.id, '1');
      expect(product.title, 'Test Product');
      expect(product.description, 'Test Description');
      expect(product.price, 9.99);
      expect(product.imageUrl, 'https://example.com/image.png');
      expect(product.isFavorite, false);
    });
  });
}
