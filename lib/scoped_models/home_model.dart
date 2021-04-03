import 'package:scoped_model/scoped_model.dart';
import 'package:scoped_model_app/enums/view_states.dart';
import 'package:scoped_model_app/scoped_models/base_model.dart';
import 'package:scoped_model_app/service_locator.dart';
import 'package:scoped_model_app/services/storage_service.dart';

class HomeModel extends BaseModel {
  StorageService storageService = locator<StorageService>();

  String title = 'Home model';

  ViewState _state;

  ViewState get state => _state;

  Future<bool> saveData() async {
    setState(ViewState.Busy);
    title = 'Saving data';
    await storageService.saveData();
    title = 'data saved';
    setState(ViewState.Retrieved);
    return true;
  }

  /* void setTitle(String value) {
    title = value;
    notifyListeners();
  } */

}
