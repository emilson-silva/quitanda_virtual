import 'package:flutter/material.dart';

class OrdersTab extends StatelessWidget {
  const OrdersTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pedidos'),
      ),
      body: ListView.separated(separatorBuilder: (_, index)=>  const SizedBox(height: 10), itemBuilder: , itemCount: itemCount,),
    );
  }
}
