import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:restmeal/screens/CustomReserve.dart';
import 'tools/models.dart';
import 'package:flutter_svg/flutter_svg.dart';

final Widget restLogo = new SvgPicture.asset(
  'assets/images/logo.svg',
  color: Color(0xFFAA0114),
  height: 80,
);

class MenuListing extends StatefulWidget {
  @override
  _MenuListingState createState() => _MenuListingState();
}

class _MenuListingState extends State<MenuListing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Color(0xFFF0F0F0), body: MenuList());
  }
}

class MenuList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Meals>>(
        future: loadMeals(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? ListPage(meal: snapshot.data)
              : Center(
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 90.0,
                    child: Image.asset(
                      "assets/images/cooking.gif",
                      scale: 2.7,
                    ),
                  ),
                );
        },
      ),
    );
  }
}

class ListPage extends StatefulWidget {
  final List<Meals> meal;

  ListPage({Key key, this.meal}) : super(key: key);

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  Meals dropdownValue;
  List basket = [];
  


  var exist;
  _addtoBasket(id, name, price) {
    setState(() {
      exist=basket.where((item) => item['id'] == id);
      if(exist.length > 0){
         Scaffold.of(context).showSnackBar(SnackBar(
                content: Text('Meal has already been added to basket'),
                duration: Duration(seconds: 3),
              ));
        
          print('Exists already');
      }else{
         basket.add({'id': id, 'name': name, 'price': price});
           Scaffold.of(context).showSnackBar(SnackBar(
                content: Text('Successfully added to basket'),
                duration: Duration(seconds: 3),
              ));
      }
      
    });
  
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFF0F0F0),
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
        actions: <Widget>[
          Row(
            children: <Widget>[
              IconButton(
                icon: Icon(FontAwesomeIcons.shoppingBasket),
                color: Colors.green,
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) =>
                          ReservePage(orders: basket)));
                },
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Text(
                  basket.length.toString(),
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                width: 6.0,
              )
            ],
          )
        ],
      ),
      backgroundColor: Color(0xFFF0F0F0),
      body: _buildList(context),
    );
  }

  ListView _buildList(context) {
    return ListView.builder(
      // Must have an item count equal to the number of items!
      itemCount: widget.meal.length,
      // A callback that will return a widget.
      itemBuilder: (context, int) {
        // In our case, a DogCard for each doggo.
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 15.0),
          child: Material(
            elevation: 0.0,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Image.asset("assets/images/breakfast.png", scale: 4.0),
                    SizedBox(
                      width: 10.0,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          widget.meal[int].name.toUpperCase(),
                          style: TextStyle(
                              fontFamily: "Oxygen",
                              fontWeight: FontWeight.bold),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "Category: ${widget.meal[int].category}",
                              style: TextStyle(),
                            ),
                            SizedBox(
                              width: 30.0,
                            ),
                            Text("₦ ${widget.meal[int].price}",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green)),
                          ],
                        ),
                        FlatButton.icon(
                          padding: EdgeInsets.symmetric(horizontal: 50.0),
                          color: Colors.red,

                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          icon: Icon(
                            FontAwesomeIcons.plus,
                            color: Colors.white,
                          ), //`Icon` t
                          //`Icon` to display
                          label: Text(
                            'Add To Basket',
                            style: TextStyle(color: Colors.white),
                          ),
                          //`Text` to display
                          onPressed: () {
                            _addtoBasket(widget.meal[int].id,
                                widget.meal[int].name, widget.meal[int].price);
                             
                          },
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class ReservePage extends StatefulWidget {
  final List orders;
  ReservePage({Key key, this.orders}) : super(key: key);
  @override
  _ReservePageState createState() => _ReservePageState();
}

class _ReservePageState extends State<ReservePage> {
  List prices = [];

  var total;

  _totalSum() {
    setState(() {
      widget.orders.forEach((order) => {prices.add(order['price'])});
      total = prices.reduce((curr, next) => curr + next);
    });
  }

  _deleteItem(id, price) {
    setState(() {
      widget.orders.removeWhere((item) => item['id'] == id);
      total = total - price;
    });
  }

  reserveBasket(){
       
  }

  @override
  void initState() {
    _totalSum();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        elevation: 0,
        title: Text("Total : ₦ ${total.toString()}  "),
      ),
      body: ListView.builder(
        itemCount: widget.orders.length,
        itemBuilder: (context, int) {
          return Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 18.0, vertical: 15.0),
            child: Material(
              elevation: 0.0,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Image.asset("assets/images/breakfast.png", scale: 4.0),
                      SizedBox(
                        width: 10.0,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            widget.orders[int]['name'].toUpperCase(),
                            style: TextStyle(
                                fontFamily: "Oxygen",
                                fontWeight: FontWeight.bold),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text("₦ ${widget.orders[int]['price']}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green)),
                              IconButton(
                                icon: Icon(
                                  FontAwesomeIcons.trash,
                                  color: Colors.red,
                                ),
                                onPressed: () {
                                  _deleteItem(widget.orders[int]['id'],
                                      widget.orders[int]['price']);
                                },
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed:(){
Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) =>
                          CustomTableForm(orders: widget.orders,total:total)));
        },
        backgroundColor: Colors.red,
        icon: Icon(FontAwesomeIcons.table),
        label: Text("Book"),
      ),
    );
  }

}
