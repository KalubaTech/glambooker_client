

import 'package:get/get.dart';
import 'package:glambooker/controllers/bookings_controller.dart';
import 'package:glambooker/controllers/services_controller.dart';
import 'package:glambooker/models/booking_model.dart';
import 'package:glambooker/models/salon_model.dart';

import '../models/service_model.dart';

class DummyData{

  ServicesController _servicesController = Get.find();

  static var DUMMY_SERVICES = <ServiceModel>[
    ServiceModel(id: '1', title: 'Hair', description: 'Perfectly all type of hair', imageUrl: 'assets/hair.jpg', price: 500),
    ServiceModel(id: '2', title: 'Makeup', description: 'Perfectly all type of makeup', imageUrl: 'assets/make_up.jpg', price: 400),
    ServiceModel(id: '3', title: 'Lashes', description: 'Perfectly all type of lashes', imageUrl: 'assets/lashes.jpg', price: 300),
    ServiceModel(id: '4', title: 'Nails', description: 'Perfectly all type of nails', imageUrl: 'assets/nails.jpg', price: 800),
    ServiceModel(id: '5', title: 'Wax', description: 'Perfectly all type of wax', imageUrl: 'assets/wax.jpg', price: 800),
  ];

  static var SALON_DATA = SalonModel(
      salonName: 'Foxdale Salon',
      phone: '0972332244',
      email: 'foxdale@gmail.com',
      logo: '',
      address: '245 Foxdale, Lusaka, Zambia.',
      coverImage: ''
  );

  static List<Map<String, dynamic>> paymentOptions = [
    {
      "provider":"airtel",
      "contact":"0972332233",
      "names":"Lwanga Lwanga"
    },
    {
      "provider":"mtn",
      "contact":"0962332233",
      "names":"Lwanga Lwanga"
    },
    {
      "provider":"zamtel",
      "contact":"0952332233",
      "names":"Lwanga Lwanga"
    },
  ];



  List<ServiceModel>getServices(){
    return _servicesController.services.value.where((service)=>service.id=='2').toList();
  }
  static var myBookings =  [
    BookingModel(
        bookingId: '2',
        service: [],
        isPaid: false,
        status: 'pending',
        dateTime: DateTime.now().toString(),
        dateBooked: DateTime.now().toString(),
    )
  ];
}