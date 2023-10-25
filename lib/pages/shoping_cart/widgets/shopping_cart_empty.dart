import 'package:flutter/material.dart';

class ShoppingCartEmpty extends StatelessWidget {
  const ShoppingCartEmpty({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.all(50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            buildImage(),
            Text(
              'Your shopping cart is empty',
              style:
                  TextStyle(color: Colors.black.withOpacity(.5), fontSize: 18),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Fortunately,there's an easy solution.",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  Color.fromARGB(255, 3, 68, 121),
                ),
              ),
              onPressed: () {
                // Add your button's onPressed logic here
              },
              child: Text('Go Shopping'),
            )
          ],
        ),
      ),
    );
  }

  Widget buildImage() {
    return Image.asset(
      'assets/images/cart.png',
      height: 300,
    );
  }
}
