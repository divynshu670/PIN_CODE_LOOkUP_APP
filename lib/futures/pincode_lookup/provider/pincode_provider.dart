import 'package:flutter/material.dart';
import '../data/pincode_service.dart';
import '../model/pincode_model.dart';

enum PinCodeStatus { idle, loading, success, error }

class PinCodeProvider extends ChangeNotifier {
  final PinCodeService _service = PinCodeService();

  PinCodeStatus _status = PinCodeStatus.idle;
  PinCodeStatus get status => _status;

  List<PostOffice> _postOffices = [];
  List<PostOffice> get postOffices => _postOffices;

  String _error = '';
  String get error => _error;

  Future<void> searchPinCode(String pinCode) async {
    if (pinCode.length != 6 || int.tryParse(pinCode) == null) {
      _error = "Please enter a valid 6-digit PIN";
      _status = PinCodeStatus.error;
      notifyListeners();
      return;
    }

    _status = PinCodeStatus.loading;
    _error = '';
    notifyListeners();

    try {
      _postOffices = await _service.fetchPostOffices(pinCode);
      _status = PinCodeStatus.success;
    } catch (e) {
      _error = e.toString();
      _status = PinCodeStatus.error;
    }
    notifyListeners();
  }
}
