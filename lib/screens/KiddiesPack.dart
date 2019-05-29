import "package:flutter/material.dart";
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:http/http.dart' as http;

class KiddiesPackage extends StatefulWidget {
  @override
  _KiddiesPackageState createState() => _KiddiesPackageState();
}

class _KiddiesPackageState extends State<KiddiesPackage> {

  
  final formats = {
    InputType.both: DateFormat("EEEE, MMMM d, yyyy 'at' h:mma"),
    InputType.date: DateFormat('yyyy-MM-dd'),
    InputType.time: DateFormat("HH:mm"),
  };

  InputType inputType = InputType.both;
  bool editable = true;
  DateTime date;

final _pnameController = TextEditingController();
final _pphoneController = TextEditingController();
final _pemailController = TextEditingController();
final _knameController = TextEditingController();
final _kclassController = TextEditingController();
final _schoolnameController = TextEditingController();
final _teacherNameController = TextEditingController();
final _teacherContactController = TextEditingController();
final _commentsController = TextEditingController();

makeReservations() async{
  String pName = _pemailController.text;
  String pPhone = _pphoneController.text;
  String pEmail = _pemailController.text;
  String kName = _knameController.text;
  String kClass = _kclassController.text;
  String schoolName = _schoolnameController.text;
  String teacherName = _teacherNameController.text;
  String teacherContact = _teacherContactController.text;
  String comments = _commentsController.text;


  String url = "https://restmeal.herokuapp.com/api/kiddies/";
    final response = await http.post(url,body: {
      "parent_name": pName.toString(),
      "parent_phone": pPhone.toString(),
      "parent_email": pEmail.toString(),
      "kid_name": kName.toString(),
      "kid_date_of_birth": date.toString(),
      "kid_class": kClass.toString(),
      "school_name": schoolName.toString(),
      "teacher_name": teacherName.toString(),
      "teacher_phone": teacherContact.toString(),
      "comments": comments.toString()
      
    });
    print(response.body);
    if(response.statusCode == 201){
       Scaffold.of(context).showSnackBar(SnackBar(
                content: Text('Your Request has been sent'),
                duration: Duration(seconds: 3),
              ));

              

    }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Color(0xFFF0F0F0),
      appBar: AppBar(
        iconTheme: IconThemeData(),
        elevation: 0.0,
         backgroundColor: Color(0xFFF0F0F0),
      ),
      body: ListView(
        children: <Widget>[
          Center(
              child: Column(
            children: <Widget>[
              Image.asset(
                "assets/images/kiddies.png",
                scale: 6.0,
              ),
              SizedBox(
                height: 10,
              ),
              Text("Kiddies Package")
            ],
          )),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Material(
              color: Color(0xFFF0F0F0),
                elevation: 0,
                borderRadius: BorderRadius.circular(10),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 16, right: 16, bottom: 24),
                      child: TextFormField(
                        controller: _pnameController,
                        decoration: InputDecoration(
                          labelText: 'Parents Name :',
                          hintText: 'Enter your email',
                          icon: Icon(FontAwesomeIcons.user),
                          isDense: true,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 16, right: 16, bottom: 24),
                      child: TextFormField(
                      controller: _pphoneController,
                        decoration: InputDecoration(
                          labelText: 'Parents Phone No :',
                          hintText: 'Enter Parents Phone',
                          icon: Icon(FontAwesomeIcons.tablet),
                          isDense: true,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 16, right: 16, bottom: 24),
                      child: TextFormField(
                        controller: _pemailController,
                        decoration: InputDecoration(
                          labelText: 'Parents Email :',
                          hintText: 'Enter Parents email',
                          icon: Icon(FontAwesomeIcons.envelope),
                          isDense: true,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 16, right: 16, bottom: 24),
                      child: TextFormField(
                        controller: _knameController,
                        decoration: InputDecoration(
                          labelText: "Kid's Name :",
                          hintText: 'Kids Name',
                          icon: Icon(FontAwesomeIcons.child),
                          isDense: true,
                        ),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.only(left: 16, right: 16, bottom: 24),
                      child: DateTimePickerFormField(
                      inputType: inputType,
                      format: formats[inputType],
                      editable: editable,
                      
                      decoration: InputDecoration(
                        icon:Icon(FontAwesomeIcons.calendar) ,
                          labelText: 'Date of Birth',
                          hasFloatingPlaceholder: false),
                      onChanged: (dt) => setState(() => date = dt),
                    ),
                    ),

                    Padding(
                      padding: EdgeInsets.only(left: 16, right: 16, bottom: 24),
                      child: TextFormField(
                        controller: _kclassController,
                        decoration: InputDecoration(
                          labelText: "Kid's Class :",
                          hintText: 'Class',
                          icon: Icon(FontAwesomeIcons.deskpro),
                          isDense: true,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 16, right: 16, bottom: 24),
                      child: TextFormField(
                        controller: _schoolnameController,
                        decoration: InputDecoration(
                          labelText: "School Name :",
                          hintText: 'School Name',
                          icon: Icon(FontAwesomeIcons.school),
                          isDense: true,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 16, right: 16, bottom: 24),
                      child: TextFormField(
                        controller: _teacherNameController,
                        decoration: InputDecoration(
                          labelText: "Class Teachers Name :",
                          hintText: 'Teachers Name',
                          icon: Icon(FontAwesomeIcons.chalkboardTeacher),
                          isDense: true,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 16, right: 16, bottom: 24),
                      child: TextFormField(
                      controller: _teacherContactController,
                        decoration: InputDecoration(
                          labelText: "Class Teachers Contact :",
                          hintText: 'Teachers Contact',
                          icon: Icon(FontAwesomeIcons.phone),
                          isDense: true,
                        ),
                      ),
                    ),

                     Padding(
                      padding: EdgeInsets.only(left: 16, right: 16, bottom: 24),
                      child: TextFormField(
                        controller: _commentsController,
                        decoration: InputDecoration(
                          labelText: "Comments :",
                          hintText: 'Description',
                          icon: Icon(FontAwesomeIcons.pen),
                          isDense: true,
                        ),
                      ),
                    ),
                   
                  ],
                )),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: makeReservations,
        backgroundColor: Colors.red,
        icon: Icon(FontAwesomeIcons.table),
        label: Text("Send Request "),
      ),
    );
  }
}
