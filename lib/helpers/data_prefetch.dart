import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:glambooker/controllers/bookings_controller.dart';
import 'package:glambooker/controllers/client_controller.dart';
import 'package:glambooker/controllers/salon_controller.dart';
import 'package:glambooker/controllers/services_controller.dart';
import 'package:glambooker/models/booking_model.dart';
import 'package:glambooker/statics/dummy_data.dart';

import '../models/service_model.dart';

class DataPrefetch {
  ServicesController _servicesController = Get.find();
  SalonController _salonController = Get.find();
  BookingsController _bookingsController = Get.find();

  FirebaseFirestore _fs = FirebaseFirestore.instance;

  void fetchAllServices()async{

    List<ServiceModel>_services=[];

    var data = await _fs.collection('services').get();

    for(var doc in data.docs){
      ServiceModel service = ServiceModel(
          id: doc.id,
          title: doc.get('title'),
          description: doc.get('description'),
          imageUrl: doc.get('image'),
          price: double.parse(doc.get('price'))
      );

      _services.add(service);
    }


    _servicesController.services.value = _services;
    _servicesController.update();
  }

  void fetchSalon()async{
    _salonController.salon.value = [DummyData.SALON_DATA];
  }

  ClientController _clientController = Get.find();

  fetchBookings()async{
    List<BookingModel>bookings=[];

    var bookingData = await _fs.collection('bookings').where('clientID', isEqualTo:_clientController.client.value.uid).get();

    for(var doc in bookingData.docs){

      ServiceModel service = _servicesController.services.where((s)=>s.id==doc.get('service')).first;

      BookingModel booking = BookingModel(
          bookingId: doc.id,
          service: [service],
          isPaid: doc.get('isPaid'),
          status: doc.get('status'),
          dateTime: doc.get('datetime'),
          dateBooked: doc.get('dateBooked').toString()
      );

      bookings.add(booking);
    }

    _bookingsController.bookings.value = bookings;

    _bookingsController.update();
  }

}