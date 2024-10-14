import 'package:flutter/material.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
          const Row(
            children: [
              Icon(Icons.location_on_outlined),
              Text(
                'Delivery Address',
                style: TextStyle(
                  color: Color(0xFF133B5C),
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          const Row(
            children: [
              Card(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text('Address :'),
                        Icon(Icons.edit),
                      ],
                    ),
                    Text('216 St Paul\'s Rd, London N1 2LL, UK'),
                    Text('Contact :  +44-784232'),
                  ],
                ),
              ),
              Card(
                child: Center(
                  child: Icon(Icons.add_circle_outline),
                ),
              )
            ],
          ),
          const Text(
            'Shopping List',
            style: TextStyle(
              color: Color(0xFF133B5C),
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
          ListView.builder(
              itemCount: 100,
              itemBuilder: (context, index) {
                return Card(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Image.asset('assets/images/item.png'),
                          const Column(
                            children: [
                              Text(
                                'Women’s Casual Wear',
                                style: TextStyle(
                                  color: Color(0xFF133B5C),
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Variations : ',
                                    style: TextStyle(
                                      color: Color(0xFF133B5C),
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                    ),
                                  ),
                                  Text(
                                    'Black',
                                    style: TextStyle(
                                      color: Color(0xFF133B5C),
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 10,
                                    ),
                                  ),
                                  Text(
                                    'Red',
                                    style: TextStyle(
                                      color: Color(0xFF133B5C),
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 10,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    '4.8',
                                    style: TextStyle(
                                      color: Color(0xFF133B5C),
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                    ),
                                  ),
                                  Text('Stars'),
                                ],
                              ),
                              Row(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        '\$ 34.00',
                                        style: TextStyle(
                                          color: Color(0xFF133B5C),
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        'up to 33% off  ',
                                        style: TextStyle(
                                          color: Color(0xFF38B6FF),
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 8,
                                        ),
                                      ),
                                      Text(
                                        '\$ 64.00',
                                        style: TextStyle(
                                            color: Color(0xFFA7A7A7),
                                            fontFamily: 'Montserrat',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 8,
                                            decoration:
                                                TextDecoration.lineThrough),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                      const Row(
                        children: [
                          Text(
                            'Total Order (1)   :',
                            style: TextStyle(
                              color: Color(0xFF133B5C),
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            '\$ 34.00',
                            style: TextStyle(
                              color: Color(0xFF133B5C),
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }),
        ],
      ),
    );
  }
}
