import 'package:flutter/material.dart';
import 'package:spareparts_platform/theme.dart';

class CartBottomNavBar extends StatelessWidget {
  const CartBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Total: ",
                style: TextStyle(
                  color: werno.butterflyBush,
                  fontSize: 22,
                  fontWeight: FontWeight.bold
                  ),
                ),
                Text("\$250",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: werno.butterflyBush
                  ),
                )
              ],
            ),

            Container(
              height: 50,
              decoration: BoxDecoration(
                color: werno.butterflyBush,
                borderRadius: BorderRadius.circular(20)
              ),
              child: Text(
                "check out",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}