import 'package:get_it/get_it.dart';
import 'package:sqin/services/navigation_service.dart';
import 'package:sqin/viewmodels/home_view_model.dart';
import 'package:sqin/viewmodels/start_view_model.dart';

GetIt sl = GetIt.instance;
Future<void> setupsl() async {
  //******************* Services *************************
  sl.registerLazySingleton(() => NavigationService());

  /******************* view models *************************/
  sl.registerLazySingleton(() => StartViewModel());
  sl.registerLazySingleton(() => HomeViewModel());
}
