import 'package:flutter/material.dart';

import 'data.dart';
import 'models/food.dart';

void main() {
  List<Food> foods = [];
  
  food.forEach(
    (key, value) {
      foods.add(Food(
          title: value['title'],
          time: value['time'],
          energy: value['energy'],
          rating: value['rating']));
    },
  );
  runApp(MaterialApp(
    home: Scaffold(
      body: ListView.builder(
        itemCount: foods.length,
        itemBuilder: ((context, index) {
          return ListTile(
            leading: Text('$index'),
            title: Text(foods[index].title),
            subtitle: Text(foods[index].time),
            trailing: Text(foods[index].energy),
          );
        }),
      ),
    ),
  ));
}
