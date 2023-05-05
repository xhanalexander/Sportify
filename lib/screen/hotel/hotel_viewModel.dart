import 'dart:developer';
import 'package:flutter/material.dart';
import '../../model/api/hotel_api.dart';
import '../../model/hotel_model.dart';

enum HotelState { initial, loading, loaded, error }

class HotelViewModel extends ChangeNotifier {
  List<HotelModel> _hotels = [];
  HotelState _state = HotelState.initial;

  List<HotelModel> get hotels => _hotels;
  
  HotelState get state => _state;

  getHotels() async {
    _state = HotelState.loading;

    try {
      final hotels = await HotelAPI.getAllHotel();
      _hotels = hotels;
      _state = HotelState.loaded;
    } catch (e) {
      _state = HotelState.error;
    }
    notifyListeners();
    // log(">> results =" + hotels[0].name);
  }
}

class InnViewModel extends ChangeNotifier  {
  List<InnModel> _inns = [];
  HotelState _state = HotelState.initial;

  List<InnModel> get inns => _inns;
  
  HotelState get state => _state;

  // getInns({required String checkin, required String checkout,}) async {
  getInns() async {
    _state = HotelState.loading;

    try {
      /* final inns = await innAPi.getSearchinn(
        checkin: checkin,
        checkout: checkout,
      ); */
      final inns = await innAPi.getSearchinn();
      _inns = inns;
      _state = HotelState.loaded;
    } catch (e) {
      _state = HotelState.error;
    }
    notifyListeners();
    // log(">> results =" + hotels[0].name);
  }
  
}