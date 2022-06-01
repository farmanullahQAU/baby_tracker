
import 'package:baby_tracker/binder.dart';
import 'package:get/get.dart';

import 'route_names.dart';
import 'view/home_view.dart';

List<GetPage> pages = [
  GetPage(name: RouteNames.HOME, page: () =>  HomeView(), binding: Binder(),
  

  transition: Transition.fadeIn),

  
  
  


 
];
