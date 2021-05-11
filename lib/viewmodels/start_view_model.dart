import 'package:sqin/constant/routes.dart';
import 'package:sqin/locator.dart';
import 'package:sqin/services/navigation_service.dart';
import 'package:sqin/viewmodels/base_model.dart';

class StartViewModel extends BaseModel {
  final NavigationService _navigationService = sl<NavigationService>();

  void handleStartUpLogic() async {
    Future.delayed(Duration(seconds: 1), () async {
      _navigationService.clearLastAndNavigateTo(Routes.homePageView);
    });
  }
}
