import 'package:dio/dio.dart';
import '../model/pincode_model.dart';

class PinCodeService {
  final Dio _dio = Dio();

  Future<List<PostOffice>> fetchPostOffices(String pinCode) async {
    try {
      final response = await _dio.get(
        "https://api.postalpincode.in/pincode/$pinCode",
        options: Options(receiveTimeout: const Duration(seconds: 5)),
      );

      if (response.data is! List || response.data.isEmpty) {
        throw "Invalid response format";
      }

      final data = response.data[0];

      if (data['Status'] == 'Error') {
        throw data['Message'] ?? "No records found";
      }

      if (data['Status'] == 'Success') {
        final offices = data['PostOffice'] as List?;
        if (offices == null || offices.isEmpty) {
          throw "No post offices found for this PIN code";
        }
        return offices.map((e) => PostOffice.fromJson(e)).toList();
      }

      throw "Unknown response status";
    } on DioException catch (e) {
      throw "Connection failed: ${e.message ?? 'Please check your internet'}";
    } catch (e) {
      throw "Failed to load data: ${e.toString()}";
    }
  }
}
