import 'package:flutter/material.dart';

class MenuEntity {
  final String name;
  final String description;
  final String image;
  final IconData icon;
  final String url;

  MenuEntity({
    required this.name,
    required this.description,
    required this.image,
    required this.icon,
    required this.url,
  });
}
