import 'dart:async' show Future;
import 'dart:convert' show json;
import 'package:http/http.dart' as http;

class Meals{
  final int id;
  final String name;
  final String description;
  final int price;
  final bool available;
  final String category;
bool operator ==(o) => o is Meals && o.name == name;
int get hashCode => name.hashCode;
  Meals({this.id,this.name,this.description,this.price,this.available,this.category});
  factory Meals.fromJson(Map<String, dynamic> json){
    return Meals(
      id:json['id'] as int,
      name:json['name'] as String,
      description: json['description'] as String,
      price: json['price'] as int,
      available: json['available'] as bool,
      category: json['category'] as String,
    );
  }

  
}
 String url = 'https://restmeal.herokuapp.com/api/meals/';
Future<List<Meals>> loadMeals() async{
 final jsonString = await http.get(url);
 final meals = json.decode(jsonString.body).cast<Map<String,dynamic>>();
 return meals.map<Meals>((json)=>Meals.fromJson(json)).toList();
}