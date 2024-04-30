import 'package:flutter/material.dart';
import 'package:spareparts_platform/db/market_database.dart';
import 'package:spareparts_platform/theme.dart';
import 'package:spareparts_platform/model/market.dart';

class ItemAppBar extends StatefulWidget {
  // final int noteId;

  const ItemAppBar({super.key});

  @override
  State<ItemAppBar> createState() => _ItemAppBarState();
}

class _ItemAppBarState extends State<ItemAppBar> {

  late Note note;
  bool isLoading=false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(25),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back,
            size: 30,
            color: werno.butterflyBush,
            ),
          ),
          Padding(padding: EdgeInsets.only(left: 20),
          child: Text("Product",
          style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.bold,
            color: werno.butterflyBush
              ),
            ),
          ),

          Spacer(),
          Icon(
            Icons.favorite,
            color: Colors.red,
          )

        ],
      ),
    );

  }
          //   Widget deleteButton() => IconButton(
          //   icon: Icon(Icons.delete),
          //   onPressed: () async {
          //     await MarketDatabase.instance.delete(widget.noteId);
          //   },
            
          
          // );
}