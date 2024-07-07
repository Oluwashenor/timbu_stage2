import 'dart:collection';
import 'package:flutter/material.dart';
import 'models/product.dart';
import 'network/network.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // final List<Product> products = [];

  List<Product> myCart = [];

  showSnackBar(String message) {
    SnackBar snackbar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  int currentScreen = 0;
  double total = 0;

  void removeFromCart(String productName) {
    showSnackBar("Removing $productName from cart");
    Product product = myCart.firstWhere((x) => x.name == productName);
    myCart.remove(product);
    //total -= product.amount;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(currentScreen == 0 ? "Shopping" : "Cart Total - $total"),
        centerTitle: true,
      ),
      body: const Products(),
    );
  }
}

class Products extends StatefulWidget {
  const Products({super.key});

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  Network network = Network();
  List<Product> products = [];

  Future<List<Product>> fetchProducts() async {
    try {
      List<Product> ps = await network.fetchProducts();
      return ps;
    } catch (ex) {
      print(ex);
      return [];
    }
  }

  @override
  void initState() {
    fetchProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchProducts(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(
            child: Text('No data available'),
          );
        } else {
          return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (BuildContext context, int index) {
                return ProductWidget(
                    product: snapshot.data![index], index: index);
              });
        }
      },
    );
  }
}

class ProductWidget extends StatelessWidget {
  const ProductWidget(
      {super.key,
      required this.product,
      this.cartItem = false,
      required this.index});

  final Product product;
  final bool cartItem;
  final int index;

  @override
  Widget build(BuildContext context) {
    var image = 'https://api.timbu.cloud/images/${product.photos[0]?['url']}';
    return ListTile(
      leading: Image.network(image, width: 50, height: 200),
      title: Text(product.name as String),
      subtitle: Text("${product.currentPrice[0].ngn.first}"),
    );
  }
}

class ShoppingCart extends StatelessWidget {
  const ShoppingCart(
      {super.key, required this.myCart, required this.buttonPressed});

  final List<Product> myCart;
  final Function(String) buttonPressed;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(
        flex: 9,
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: myCart.length,
            itemBuilder: (BuildContext context, int index) {
              if (myCart.isEmpty) {
                return const Text("You have no item on cart");
              } else {
                return ProductWidget(
                  product: myCart[index],
                  cartItem: true,
                  index: index,
                );
              }
            }),
      ),
      if (myCart.isNotEmpty)
        Expanded(
            flex: 1,
            child: Container(
              child: TextButton(
                  child: const Text("Checkout"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CheckOutScreen()));
                  }),
            ))
    ]);
  }
}

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Thank you for shopping with us"),
      ),
    );
  }
}
