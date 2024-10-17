import 'package:flutter/material.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold( backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.lightBlue,
        leading: BackButton(
          onPressed: () {},
        ),
        title: const Text(
          'Cart',
          style: TextStyle(
            color: Color(0xFF133B5C),
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
           Text(
            '    SOOOOOOOOOOOOOOOOOOOOOOOOOON',
            style: TextStyle(
              color: Color(0xFF133B5C),
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),

        ],
      ),
    );
  }
}
