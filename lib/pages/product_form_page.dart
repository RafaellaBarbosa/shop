import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/product.dart';
import 'package:shop/models/product_list.dart';

class ProductFormPage extends StatefulWidget {
  const ProductFormPage({super.key});

  @override
  State<ProductFormPage> createState() => _ProductFormPageState();
}

class _ProductFormPageState extends State<ProductFormPage> {
  final _priceFocus = FocusNode();
  final _descriptionFocus = FocusNode();
  final _imageUrlFocus = FocusNode();
  final _imageUrlController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _formData = <String, Object>{};

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _imageUrlFocus.addListener(updateImage);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (_formData.isEmpty) {
      final arg = ModalRoute.of(context)?.settings.arguments;

      if (arg != null) {
        final product = arg as Product;
        _formData['id'] = product.id;
        _formData['name'] = product.name;
        _formData['price'] = product.price;
        _formData['description'] = product.description;
        _formData['imageUrl'] = product.imageUrl;
        _imageUrlController.text = product.imageUrl;
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    _priceFocus.dispose();
    _descriptionFocus.dispose();
    _imageUrlFocus.removeListener(updateImage);
    _imageUrlFocus.dispose();
  }

  void updateImage() {
    setState(() {});
  }

  bool isValidImageUrl(String url) {
    bool isValidUrl = Uri.tryParse(url)?.hasAbsolutePath ?? false;
    if (!isValidUrl) return false;

    List<String> imageExtensions = [
      '.png',
      '.jpg',
      '.jpeg',
      '.gif',
      '.bmp',
      '.webp',
    ];
    bool endsWithFile = imageExtensions.any(
      (ext) => url.toLowerCase().endsWith(ext),
    );
    return endsWithFile;
  }

  Future<void> _submitForm() async {
    final isValid = _formKey.currentState?.validate() ?? false;

    if (!isValid) {
      return;
    }

    _formKey.currentState?.save();

    setState(() {
      isLoading = true;
    });

    try {
      await Provider.of<ProductList>(
        context,
        listen: false,
      ).saveProduct(_formData);
    } catch (e) {
      if (mounted) {
        await showDialog<void>(
          context: context,
          builder:
              (ctx) => AlertDialog(
                title: const Text('Ocorreu um erro!'),
                content: const Text('Não foi possível salvar o produto.'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(ctx).pop(),
                    child: const Text('Fechar'),
                  ),
                ],
              ),
        );
      }
    } finally {
      setState(() {
        isLoading = false;
      });
      if (mounted) {
        Navigator.of(context).pop();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulário de Produto'),
        actions: [
          IconButton(onPressed: _submitForm, icon: const Icon(Icons.save)),
        ],
      ),
      body:
          isLoading
              ? const Center(child: CircularProgressIndicator())
              : Padding(
                padding: const EdgeInsets.all(15),
                child: Form(
                  key: _formKey,
                  child: ListView(
                    children: [
                      TextFormField(
                        initialValue: _formData['name']?.toString(),
                        decoration: const InputDecoration(labelText: 'Nome'),
                        textInputAction: TextInputAction.next,
                        onFieldSubmitted: (_) {
                          FocusScope.of(context).requestFocus(_priceFocus);
                        },
                        onSaved: (name) => _formData['name'] = name ?? '',
                        validator: (value) {
                          final name = value ?? '';

                          if (name.trim().isEmpty) {
                            return 'Nome é obrigatório.';
                          }

                          if (name.trim().length < 3) {
                            return 'Nome precisa no mínimo de 3 letras.';
                          }

                          return null;
                        },
                      ),
                      TextFormField(
                        initialValue: _formData['price']?.toString(),
                        decoration: const InputDecoration(labelText: 'Preço'),
                        textInputAction: TextInputAction.next,
                        focusNode: _priceFocus,
                        keyboardType: const TextInputType.numberWithOptions(
                          decimal: true,
                          signed: true,
                        ),
                        onFieldSubmitted: (_) {
                          FocusScope.of(
                            context,
                          ).requestFocus(_descriptionFocus);
                        },
                        onSaved:
                            (price) =>
                                _formData['price'] = double.parse(
                                  price?.replaceAll(',', '.') ?? '0',
                                ),
                        validator: (value) {
                          final priceString = value ?? '';
                          final price =
                              double.tryParse(
                                priceString.replaceAll(',', '.'),
                              ) ??
                              -1;
                          if (price <= 0) {
                            return 'Informe um preço válido.';
                          }

                          return null;
                        },
                      ),
                      TextFormField(
                        initialValue: _formData['description']?.toString(),
                        decoration: const InputDecoration(
                          labelText: 'Descrição',
                        ),
                        focusNode: _descriptionFocus,
                        keyboardType: TextInputType.multiline,
                        maxLines: 3,
                        onSaved:
                            (description) =>
                                _formData['description'] = description ?? '',
                        validator: (value) {
                          final description = value ?? '';

                          if (description.trim().isEmpty) {
                            return 'Descrição é obrigatória.';
                          }

                          if (description.trim().length < 10) {
                            return 'Descrição precisa no mínimo de 10 letras.';
                          }

                          return null;
                        },
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                            child: TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'Url da Imagem',
                              ),
                              keyboardType: TextInputType.url,
                              textInputAction: TextInputAction.done,
                              focusNode: _imageUrlFocus,
                              controller: _imageUrlController,
                              onFieldSubmitted: (_) => _submitForm(),
                              onSaved:
                                  (imageUrl) =>
                                      _formData['imageUrl'] = imageUrl ?? '',
                              validator: (value) {
                                final imageUrl = value ?? '';

                                if (!isValidImageUrl(imageUrl)) {
                                  return 'Informe uma Url válida!';
                                }

                                return null;
                              },
                            ),
                          ),
                          Container(
                            height: 100,
                            width: 100,
                            margin: const EdgeInsets.only(top: 10, left: 10),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey, width: 1),
                            ),
                            alignment: Alignment.center,
                            child:
                                _imageUrlController.text.isEmpty
                                    ? const Text('Informe a Url')
                                    : Image.network(_imageUrlController.text),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
    );
  }
}
