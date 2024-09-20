import 'package:get/get.dart';
import 'package:glambooker/models/booking_model.dart';

class BookingsController extends GetxController{
  var bookings = <BookingModel>[].obs;
  void remove(BookingModel booking){
    bookings.value.remove(booking);
    this.update();
  }
}