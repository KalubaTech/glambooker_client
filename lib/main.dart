import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glambooker/controllers/bookings_controller.dart';
import 'package:glambooker/controllers/favourites_controller.dart';
import 'package:glambooker/controllers/salon_controller.dart';
import 'package:glambooker/controllers/services_controller.dart';
import 'package:glambooker/utils/colors.dart';
import 'package:glambooker/views/auth/sign_in.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:glambooker/views/pages_anchor.dart';
import 'package:glambooker/helpers/data_prefetch.dart';

import 'controllers/client_controller.dart';

void main() async{
  await WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();



  Get.put(ClientController());
  Get.put(BookingsController());
  Get.put(ServicesController());
  Get.put(FavouritesController());
  Get.put(SalonController());
  DataPrefetch().fetchAllServices();
  DataPrefetch().fetchSalon();
  DataPrefetch();

  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GlamBooker',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.cyan
      ),
      home: SignIn(),
    );
  }
}
