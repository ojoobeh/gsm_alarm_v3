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




  Future<void> insertNewLocation({required final VoidCallback action}) async {
    if (nameController.text != s.news) {
      List<LocationSettingModel> locationList=await DataManager.getLocationSettingModelList();
      if(!locationList.map((e) => e.name).toList().contains(nameController.text)){
        List list = await DataManager.getLocationSettingModelList();
        int id = list.length;
        LocationSettingModel locationSettingModel = LocationSettingModel(
          name: nameController.text,
          modelType: selectDeviceModel.value.id,
          partType: selectPartModel.value.id,
          modelName: selectDeviceModel.value.model,
          password: passwordController.text,
          selected: 1,
          simNumber: simNumberController.text,
        );
        await DataManager.insertLocationSetting(locationSettingModel);
        setData(AppConstants.deviceModelId, selectDeviceModel.value.id);
        setData(AppConstants.deviceModelId, selectDeviceModel.value.id);
        setData(AppConstants.partModelId, selectPartModel.value.id);
        setData(AppConstants.isWifi, isWifi.value);
        setData(AppConstants.locationSettingModelId, id + 1);

        await DataManager.resetLocationSettingSelected(id);
        updateSelectDeviceModel(action: () => action());


        for (int i = 0; i < 24; i++) {
          await DataManager.insertOutputModel(Output2Model(
            deviceId: id + 1,
            id: i + 1,
            title: "${s.output} ${i + 1}",
            code: i + 1,
            status: 0,
            isMomentary: 0,
          ));
        }

      }else{
        snackbarRed(title: s.warning, subtitle: s.theNameIsRepeated);
      }


    } else {
      snackbarRed(title: s.warning, subtitle: s.nameIsNotValid);
    }
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

  Future<void> updateLocation({required VoidCallback action}) async {
    if (nameController.text != s.news) {
      if (selectLocationSettingModel.value.id != null) {
        List<LocationSettingModel> locationList=await DataManager.getLocationSettingModelList();
        if(!locationList.map((e) => e.name).toList().contains(nameController.text)||nameController.text==selectLocationSettingModel.value.name){
          LocationSettingModel locationSettingModel = LocationSettingModel(
            id: selectLocationSettingModel.value.id,
            name: nameController.text,
            modelType: selectDeviceModel.value.id,
            partType: selectPartModel.value.id,
            modelName: selectDeviceModel.value.model,
            password: passwordController.text,
            simNumber: simNumberController.text,
            isMultiPart: selectLocationSettingModel.value.isMultiPart,
            isWifi: selectLocationSettingModel.value.isWifi,
            selected: selectLocationSettingModel.value.selected,
            simType: selectLocationSettingModel.value.simType,
          );
          await DataManager.updateLocationSetting(locationSettingModel);
          setData(AppConstants.deviceModelId, selectDeviceModel.value.id);
          setData(AppConstants.partModelId, selectPartModel.value.id);
          setData(AppConstants.isWifi, isWifi.value);
          setData(AppConstants.locationSettingModelId, selectLocationSettingModel.value.id);

          await DataManager.resetLocationSettingSelected(selectLocationSettingModel.value.id ?? 0);
          updateSelectDeviceModel(action: () =>  action());
        }else{
          snackbarRed(title: s.warning, subtitle: s.theNameIsRepeated);
        }


      }
    } else {
      snackbarRed(title: s.warning, subtitle: s.nameIsNotValid);
    }

    debugPrint('DDDDD');
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
