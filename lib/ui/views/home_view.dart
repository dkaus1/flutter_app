import 'package:flutter/material.dart';
import 'package:scoped_model_app/enums/view_states.dart';
import 'package:scoped_model_app/scoped_models/home_model.dart';
import 'package:scoped_model_app/ui/views/base_view.dart';
import 'package:scoped_model_app/ui/views/error_view.dart';
import 'package:scoped_model_app/ui/views/success_view.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<HomeModel>(
      builder: (context, child, model) => Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            var result = await model.saveData();
            if (result) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SuccessView()));
            } else {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ErrorView()));
            }
          },
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _getBodyUi(model.state),
              Text(model.title),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _getBodyUi(ViewState state) {
  switch (state) {
    case ViewState.Busy:
      return CircularProgressIndicator();
    case ViewState.Retrieved:
    default:
      return Text('Done');
  }
}
