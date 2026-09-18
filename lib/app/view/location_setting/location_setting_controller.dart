import 'package:bestdroid/app/manager/model_manager.dart';
import 'package:bestdroid/app/models/model/model.dart';
import 'package:bestdroid/app/models/output/output2.dart';
import 'package:bestdroid/app/models/part/part.dart';
import 'package:bestdroid/app/view/utils/local_storage.dart';
import 'package:bestdroid/app/core/core.dart';
import 'package:bestdroid/app/models/data_manager.dart';
import 'package:bestdroid/app/models/location_setting/location_settings.dart';
import 'package:bestdroid/app/models/model_device/device.dart';

mixin LocationSettingController {
  RxInt simCardTypeIndex = 1.obs;
  RxInt selectSimCardType = 1.obs;
  RxBool isWifi = false.obs;

  RxBool part1IsOn = false.obs;
  RxBool part2IsOn = false.obs;
  RxList<PartModel> partSelected=<PartModel>[].obs;
  RxList<PartModel> partList=<PartModel>[].obs;

  TextEditingController passwordController = TextEditingController();
  TextEditingController simNumberController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  List<Model> models = <Model>[];
  List<LocationSettingModel> locationSettingList = <LocationSettingModel>[];
  Rx<LocationSettingModel> selectLocationSettingModel = LocationSettingModel().obs;
  List<DeviceModel> deviceModelList = <DeviceModel>[];
  Rx<DeviceModel> selectDeviceModel = DeviceModel().obs;
  Rx<PartModel> partModels = PartModel().obs;
  Rx<PartModel> selectPartModel = PartModel(title: s.generalPart,id: 0).obs;


  void setPartList(int length){
    partList.clear();
    for (int i = 0; i < length; i++) {
      partList.add(
        PartModel(
          id: (i + 1),
          title: 'Part ${i + 1}',
          isActive: 0,
          deviceId: ModelManager.getList().length + 1,
        ),
      );

    }
    partList.refresh();

  }




  bool isValidParam() {
    if (nameController.text.isNotEmpty) {
      if (passwordController.text.length == 4) {
        return true;
      } else {
        snackbarRed(title: s.warning, subtitle: s.thePasswordMustBe4Characters);
        return false;
      }
    } else {
      snackbarRed(title: s.warning, subtitle: s.nameIsNotTrue);
      return false;
    }
  }


  void updateSimCardTypeIndex(int id) {}

  Future<void> init({required VoidCallback action}) async {
    locationSettingList.clear();
    List<LocationSettingModel> list = await DataManager.getLocationSettingModelList();
    locationSettingList.addAll(list);
    action();
  }

  Future<void> deleteSelected({required LocationSettingModel model,required VoidCallback action,}) async {
    DataManager.deleteLocationSetting(model.id ?? 0);
    List<LocationSettingModel> list = await DataManager.getLocationSettingModelList();
    if (list.isNotEmpty) {
      DataManager.resetLocationSettingSelected(list.first.id ?? 0);
    } else {}
    action();
  }
}
