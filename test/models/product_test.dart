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

    test('toggleFavorite should toggle isFavorite state', () {
      expect(product.isFavorite, false);

      product.toggleFavorite();
      expect(product.isFavorite, true);

      product.toggleFavorite();
      expect(product.isFavorite, false);
    });

    test('toString should return correct string representation', () {
      final expectedString =
          'Product{id: 1, title: Test Product, description: Test Description, price: 9.99, imageUrl: https://example.com/image.png, isFavorite: false}';
      expect(product.toString(), expectedString);
    });

    test('toggleFavorite should notify listeners', () {
      bool listenerCalled = false;
      product.addListener(() {
        listenerCalled = true;
      });

      product.toggleFavorite();

      expect(listenerCalled, true);
    });
  });
}
