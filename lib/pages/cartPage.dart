import 'package:flutter/material.dart';
import 'package:spareparts_platform/widgets/cartAppBar.dart';
import 'package:spareparts_platform/theme.dart';
import 'package:spareparts_platform/widgets/cartItemSamples.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          CartAppBar(),

          Container(
            height: 700,
            padding: EdgeInsets.only(top: 15),
            decoration: BoxDecoration(
              color: werno.butterflyBush,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35),
                topRight: Radius.circular(35),
              )),
            child: Column(
              children: [
                CartItemSamples(),
                Container(
                  // decoration: BoxDecoration(
                  //   borderRadius: BorderRadius.circular(10)
                  // ),
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: werno.butterflyBush,
                          borderRadius: BorderRadius.circular(20)
                        ),
                        child: Icon(Icons.add, 
                        color: Colors.white,),
                      ),
                      Padding(padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "Add Coupon Code",
                        style: TextStyle(
                          color: werno.butterflyBush,
                          fontWeight: FontWeight.bold,
                          fontSize: 16
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}