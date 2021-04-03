import 'package:flutter/material.dart';
import 'package:scoped_model_app/scoped_models/home_model.dart';
import 'package:scoped_model_app/ui/views/base_view.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<HomeModel>(
      builder: (context, child, model) => Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            model.saveData();
          },
        ),
        body: Center(
          child: Text(this.runtimeType.toString()),
        ),
      ),
    );
  }
}
