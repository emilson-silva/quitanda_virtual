import 'package:quitanda_virtual/src/models/item_model.dart';

ItemModel apple = ItemModel(
  description:
      'A melhor maçã da região e que connta com o melhor preço de qualquer quitanda',
  imgUrl: 'assets/fruits/apple.png',
  itemName: 'Maçã',
  price: 5.5,
  unit: 'Kg',
);
ItemModel grape = ItemModel(
  description:
      'A melhor uva da região e que connta com o melhor preço de qualquer quitanda',
  imgUrl: 'assets/fruits/grape.png',
  itemName: 'Uva',
  price: 7.4,
  unit: 'Kg',
);
ItemModel guava = ItemModel(
  description:
      'A melhor Goiaba da região e que connta com o melhor preço de qualquer quitanda',
  imgUrl: 'assets/fruits/guava.png',
  itemName: 'Goiaba',
  price: 11.5,
  unit: 'Kg',
);
ItemModel kiwi = ItemModel(
  description:
      'O melhor kiwi da região e que connta com o melhor preço de qualquer quitanda',
  imgUrl: 'assets/fruits/kiwi.png',
  itemName: 'Kiwi',
  price: 2.5,
  unit: 'Kg',
);
ItemModel mango = ItemModel(
  description:
      'A melhor mang da região e que connta com o melhor preço de qualquer quitanda',
  imgUrl: 'assets/fruits/mango.png',
  itemName: 'Manga',
  price: 8,
  unit: 'Kg',
);
ItemModel papaya = ItemModel(
  description:
      'O melhor mamão da região e que connta com o melhor preço de qualquer quitanda',
  imgUrl: 'assets/fruits/papaya.png',
  itemName: 'Mamão',
  price: 9.5,
  unit: 'Kg',
);

List<ItemModel> items = [
  apple,
  grape,
  guava,
  kiwi,
  mango,
  papaya,
];

List<String> categories = [
  'Frutas',
  'Grãos',
  'Verduras',
  'Temperos',
  'Cereais',
];
