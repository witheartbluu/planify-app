import "package:flutter/material.dart";
// import "package:planify/components/text.dart";

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text("Category", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),)
    );   
  }
}