// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:e_commerce_ui_project/commons/widgets/custom_shapes/search_container.dart';
import 'package:e_commerce_ui_project/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:e_commerce_ui_project/features/shop/screens/home/widgets/home_categories.dart';
import 'package:e_commerce_ui_project/features/shop/screens/home/widgets/primary_header_container.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TPrimaryHeaderContainer(
            child: Column(
              children: [
                // AppBar
                const HomeAppBar(),

                // SearchBar
                const TSearchContainer(text: 'Search in Store'),

                // Categories
                THomeCategories(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
