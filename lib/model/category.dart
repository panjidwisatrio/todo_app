// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class Category {
  int id;
  String icon;
  String name;

  Category({
    required this.id,
    required this.icon,
    required this.name,
  });
}

var categoriesList = <Category>[
  Category(
    id: 1, 
    icon: 'images/illustration/jogging.png', 
    name: 'Jogging'
  ),
  Category(
    id: 2, 
    icon: 'images/illustration/electric-guitar.png',
    name: 'Play Guitar'
  ),
  Category(
    id: 3, 
    icon: 'images/illustration/paint-palette.png',
    name: 'Painting'
  ),
  Category(
    id: 4, 
    icon: 'images/fireworks.png',
    name: 'Party'
  ),
  Category(
    id: 5, 
    icon: 'images/illustration/reading-book.png',
    name: 'Reading'
  ),
  Category(
    id: 6, 
    icon: 'images/illustration/copy-writing.png',
    name: 'Writing'
  ),
  Category(
    id: 7, 
    icon: 'images/illustration/trade.png',
    name: 'Trading'
  ),
  Category(
    id: 8, 
    icon: 'images/illustration/love.png',
    name: 'Loving'
  ),
  Category(
    id: 9, 
    icon: 'images/illustration/console.png', 
    name: 'Gaming'
  ),
  Category(
    id: 10, 
    icon: 'images/illustration/online-shopping.png',
    name: 'Shopping'
  )
];
