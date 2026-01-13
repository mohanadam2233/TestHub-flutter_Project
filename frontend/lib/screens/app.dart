import 'package:flutter/material.dart';

class AppScreen extends StatelessWidget {
  static const String routeName = '/app';
  final String title;

  const AppScreen({Key? key, this.title = 'App'}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: Text(
            'Welcome to $title',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
      ),
    );
  }
}