import 'package:aplusphoto/provider/homepage_provider.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class HomePageController extends GetxController {
  late List<RxBool> isSelected;
  late final Rx<String> pathImage;
  late final Rx<String> name;
  late HomepageProvider _homepageProvider;
  @override
  void onInit() {
    pathImage = RxString('');
    name = RxString('');
    _homepageProvider = HomepageProvider();
    super.onInit();
  }

  Future<void> showImagePicker(ImageSource source) async {
    final ImagePicker _picker = ImagePicker();
    final images = await _picker.pickImage(source: source);
    if (images != null) {
      pathImage(images.path);
    }
  }

  Future<void> upload(String path) async {
    String res = await _homepageProvider.upload(path);
    res = res.replaceAll('"', '');
    if (res.isNotEmpty) {
      name(res);
    }
  }
}
