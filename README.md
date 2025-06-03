
# 🛍️ Shop App - Flutter

Este é um aplicativo de **Loja Virtual** desenvolvido com **Flutter**, que permite ao usuário visualizar, adicionar, editar e excluir produtos, além de marcar itens como favoritos. O app também possui funcionalidades de gerenciamento de pedidos e carrinho de compras.

## ✨ Funcionalidades

✅ Listagem de produtos  
✅ Visualização de detalhes dos produtos  
✅ Marcar e desmarcar produtos como favoritos  
✅ Gerenciamento de carrinho de compras  
✅ Efetuar e visualizar pedidos  
✅ CRUD de produtos (Criar, Editar e Remover)  
✅ Filtros para exibir todos os produtos ou apenas favoritos  
✅ Validação de formulário para cadastro de produtos  
✅ Persistência temporária de dados via `Provider`  

## 🛠️ Tecnologias utilizadas

- **Flutter** >= 3.10  
- **Dart**  
- **Provider** (Gerenciamento de estado)  
- **Intl** (Formatação de datas e valores monetários)  

## 🚀 Como executar o projeto

### Pré-requisitos

- Flutter instalado e configurado ([Como instalar o Flutter](https://docs.flutter.dev/get-started/install))
- Dart instalado
- Emulador ou dispositivo físico

### Passos

1. Clone o repositório:

```bash
git clone https://github.com/RafaellaBarbosa/shop.git
```

2.Navegue até o diretório do projeto:

```bash
cd shop_app_flutter
```

3.Instale as dependências:

```bash
flutter pub get
```

4.Execute o aplicativo:

```bash
flutter run
```

## 📂 Estrutura de pastas

```
lib/
├── component/         # Componentes reutilizáveis (AppDrawer, ProductItem etc.)
├── data/              # Dados mockados (dummy data)
├── models/            # Modelos de dados (Product, Cart, Order etc.)
├── pages/             # Páginas principais do app
├── utils/             # Rotas e helpers
main.dart              # Ponto de entrada do app
```

## 🤝 Contribuições

Sinta-se à vontade para enviar **pull requests** ou abrir **issues** para sugerir melhorias!

## 👩‍💻 Desenvolvido por

- [Rafaella Barbosa](https://github.com/RafaellaBarbosa)

## 💡 Observação

Este projeto utiliza **dados mockados** (em `data/dummy_data.dart`). Não há integração com backend ou banco de dados, mas a arquitetura está preparada para isso.
