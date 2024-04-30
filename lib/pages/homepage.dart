import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:spareparts_platform/db/market_database.dart';
import 'package:spareparts_platform/model/market.dart';
import 'package:spareparts_platform/widgets/categoriesWidget.dart';
import 'package:spareparts_platform/widgets/homeappbar.dart';
import 'package:spareparts_platform/theme.dart';
import 'package:spareparts_platform/widgets/itemsWidget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Note> notes;
  bool isLoading= false;

  int _page=0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigatonKey= GlobalKey();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    refreshNotes();
  }

  @override
  void dispose() {
    MarketDatabase.instance.close();
    // TODO: implement dispose
    super.dispose();
  }

  Future refreshNotes() async{
    setState(() => isLoading = true);

    this.notes= await MarketDatabase.instance.readAllNotes();

    setState(() => isLoading = false);
  }
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: ListView(
        children: [
          HomeAppBar(),
          Container(
            //height: 500,
            padding: EdgeInsets.only(top: 15),
            decoration: BoxDecoration(
              color: Color(0xFFEDECF2),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35),
                topRight: Radius.circular(35),
              )
            ),
            child: Column(
              children: [

                //Search Widget
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 5),
                        height: 50,
                        width: 300,
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Golek kene...."
                          ),
                        ),
                      ),
                      Spacer(),
                      Icon(
                        Icons.camera_alt,
                        size: 27,
                        color: Color(0xFF4C53A5),
                      ),
                    ],
                  ),
                ),

                //Categories
                Container(
                  // alignment: Alignment(x, y),
                  margin: EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 10,
                  ),
                  child: Text(
                    "Categories",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF4C53A5),
                    ),
                  ),
                ),

                //Categories Widget
                CategoriesWidget(),

                 //items
                 Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: Text(
                    "Best Selling",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: werno.butterflyBush, 
                    ),
                  ),
                 ),
                 //itemsWidget

                 ItemsWidget(),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigatonKey,
        index: 0,
        backgroundColor: Colors.transparent,
        color: werno.butterflyBush,
        height: 60,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 500),
        onTap: (index) {
          setState(() {
            _page= index;
          });
        },
        letIndexChange: (index) => true,
        items: [
          Icon(
            Icons.home,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.add,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.home,
            size: 30,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}