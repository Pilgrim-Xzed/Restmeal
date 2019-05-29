import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:restmeal/screens/root.dart';
import 'tools/models.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

import 'package:http/http.dart' as http;


class CustomTableForm extends StatefulWidget {
  final List orders;
  final int total;

  CustomTableForm({Key key, this.orders,this.total}) : super(key: key);

  @override
  _CustomTableFormState createState() => _CustomTableFormState();
}

class _CustomTableFormState extends State<CustomTableForm> {
  
  final _formKey = GlobalKey<FormState>();
  final formats = {
    InputType.both: DateFormat("EEEE, MMMM d, yyyy 'at' h:mma"),
    InputType.date: DateFormat('yyyy-MM-dd'),
    InputType.time: DateFormat("HH:mm"),
  };

  InputType inputType = InputType.both;
  bool editable = true;
  DateTime date;
String checkoutList="";
  final _fullnameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _commentController = TextEditingController();

  makeReservations() async {
    String fullName = _fullnameController.text;
    String phone = _phoneController.text;
    String comment = _commentController.text;

    String url = "https://restmeal.herokuapp.com/api/reservations/";
    final response = await http.post(url, body: {
      "name": fullName.toString(),
      "phone": phone.toString(),
      "datetime": date.toString(),
      "comment":'${checkoutList.toString()} and ${comment.toString()}'
    });
    if (response.statusCode == 201) {
      openAlertBox();
     
    }
  }

  Color myColor = Color(0xff00bfa5);
@override
  void initState() {
   widget.orders.forEach((order)=>{
      checkoutList = checkoutList + '*'+ order['name']+'.'+'\n'
   });
   print(checkoutList);
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 50.0,
            ),
            Center(
                child: Column(
              children: <Widget>[
                Image.asset(
                  "assets/images/table.png",
                  scale: 4.0,
                ),
                SizedBox(
                  height: 10,
                ),
                Text("Table Reservation".toUpperCase())
              ],
            )),
            SizedBox(
              height: 15,
            ),

            
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Material(
                  color: Colors.white,
                  elevation: 0,
                  borderRadius: BorderRadius.circular(10),
                  child: Column(
                    children: <Widget>[
                       Padding(
                        padding: EdgeInsets.only(left: 16, right: 16, bottom: 24),
                        child: Text(checkoutList.toUpperCase(),style: TextStyle(fontWeight: FontWeight.bold),)
                      ),
                        Padding(
                        padding: EdgeInsets.only(left: 16, right: 16, bottom: 24),
                        child: Text("TOTAL = ₦ ${widget.total}",style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green))
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 16, right: 16, bottom: 24),
                        child: TextFormField(
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Full Name is Required";
                            }
                          },
                          decoration: InputDecoration(
                            labelText: "Full Name  :",
                            hintText: 'Full Name',
                            isDense: true,
                          ),
                          controller: _fullnameController,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 16, right: 16, bottom: 24),
                        child: TextFormField(
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Phone is Required";
                            }
                          },
                          decoration: InputDecoration(
                            labelText: "Phone :",
                            hintText: '080XXXXXXXX',
                            isDense: true,
                          ),
                          controller: _phoneController,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 16, right: 16, bottom: 24),
                        child: DateTimePickerFormField(
                          inputType: inputType,
                          format: formats[inputType],
                          editable: editable,
                          decoration: InputDecoration(
                              labelText: 'Date/Time',
                              hasFloatingPlaceholder: false),
                          onChanged: (dt) => setState(() => date = dt),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 16, right: 16, bottom: 24),
                        child: TextFormField(
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Comment is Required";
                            }
                          },
                          decoration: InputDecoration(
                            labelText: "Comment :",
                            
                            hintText: 'E.g 2-Plates or Other Descriptions',
                            isDense: true,
                          ),
                          controller: _commentController,
                        ),
                      ),
                      FlatButton.icon(
                        padding: EdgeInsets.symmetric(horizontal: 110.0),
                        color: Colors.red,

                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        icon: Icon(
                          FontAwesomeIcons.book,
                          color: Colors.white,
                        ), //`Icon` t
                        //`Icon` to display
                        label: Text(
                          'Reserve',
                          style: TextStyle(color: Colors.white),
                        ),
                        //`Text` to display
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            // If the form is valid, we want to show a Snackbar
                            makeReservations();
                          }
                        },
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }

  openAlertBox() {
    return showDialog(
      barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(32.0))),
            contentPadding: EdgeInsets.only(top: 10.0),
            content: Container(
              width: 300.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SizedBox(
                    height: 5.0,
                  ),
                  Center(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.green,
                        child: Icon(
                          FontAwesomeIcons.info,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Text(
                        "Order Submitted",
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                    ],
                  )),
                  InkWell(
                    onTap: (){
                         Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (BuildContext context) => RootScreen()));
                    },
                    child: Container(
                      padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20.0),
                            bottomRight: Radius.circular(20.0)),
                      ),
                      
                      child: Text(
                        "Go Back",
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
