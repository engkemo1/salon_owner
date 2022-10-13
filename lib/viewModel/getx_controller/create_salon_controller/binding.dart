import 'package:get/get.dart';

import 'create_salon_controller.dart';


class CreateSalonBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateSalonController>(
          () => CreateSalonController(),
    );


  }
}