import 'package:dio/dio.dart';
import 'package:get/get.dart';
import '../models/wall_model.dart';

class RemoteService extends GetxController {
  final Dio _dio = Dio();

  static const String url =
      "https://api.unsplash.com/photos?per_page=20&client_id=CxIbE8GyVA4qC0_X4UMbG2sdEASOCIe7cdOM8qZlPaA";

  Future<List<WallModels>> getAllPost() async {
    List<WallModels> data = [];
    final response = await _dio.get(url);
    if (response.statusCode == 200) {
      for (var i = 0; i < response.data.length; i++) {
        data.add(WallModels.fromJson(response.data[i]));
      
        update();
      }
    }
    return data;
  }

  @override
  void onInit() {
    getAllPost();
    super.onInit();
  }
}
