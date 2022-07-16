import 'package:http/http.dart' as http;

import 'package:get/get.dart';

class HomepageProvider extends GetConnect {
  Future<String> upload(String pathImage) async {
    var request = http.MultipartRequest(
        "POST", Uri.parse('http://10.130.175.154:5000/recognize'));
    var picture = await http.MultipartFile.fromPath("image", pathImage);
    request.files.add(picture);

    // http.StreamedResponse res = await request.send();
    http.Response response =
        await http.Response.fromStream(await request.send());
    print(response.body);
    return response.statusCode == 200 ? response.body : '';
  }
}
