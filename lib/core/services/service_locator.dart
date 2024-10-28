import 'package:dalel_app/core/database/cache/cache_helper.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
void setupServiceLocator() // الميثود الهستعملها علشان يتعرف علي كل الاوبجكتس
{
  getIt.registerSingleton<CacheHelper>(CacheHelper());
//دا كدا الاوبجكت الواحد CacheHelper()
}
