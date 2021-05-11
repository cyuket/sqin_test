import 'dart:math';

import 'package:sqin/constant/routes.dart';
import 'package:sqin/locator.dart';
import 'package:sqin/services/navigation_service.dart';
import 'package:sqin/viewmodels/base_model.dart';

class HomeViewModel extends BaseModel {
  final NavigationService _navigationService = sl<NavigationService>();
  List _list = [100, 4, 7, 10, 20, 20];
  List get list => _list;
  int _overAllPoint = 0;
  int get overAllPoint => _overAllPoint;
  int _recentPoint = 0;
  int get recentAllPoint => _recentPoint;
  int generateNumber() {
    Random rnd = new Random();

    var value = rnd.nextInt(5 - 0);
    print(value);
    return value;
  }

  void addPoint(value) {
    int newValue = value + _overAllPoint;
    if (value == 100) {
      _overAllPoint = 100;
    } else if (newValue < 100) {
      _overAllPoint = newValue;
    } else {
      _overAllPoint = 100;
    }
    _recentPoint = value;

    _navigationService.clearLastAndNavigateTo(Routes.detailsView);
  }
}
