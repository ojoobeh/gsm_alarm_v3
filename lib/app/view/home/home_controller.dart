import 'package:bestdroid/app/core/core.dart';
import 'package:bestdroid/app/models/code_list/code.dart';
import 'package:bestdroid/app/models/data_manager.dart';
import 'package:bestdroid/app/models/location_setting/location_settings.dart';
import 'package:bestdroid/app/models/model_device/device.dart';

mixin HomeController {


  Rx<DeviceModel> selectDeviceMode = DeviceModel().obs;
  final formKey = GlobalKey<FormState>();
  RxBool isLoading = true.obs;
  Rx<LocationSettingModel> selectLocationSettingModel = LocationSettingModel().obs;

  Future<void> init({required final VoidCallback action}) async {
    List<LocationSettingModel> list = await DataManager.getLocationSettingModelList();
    if (list.isNotEmpty) {
      selectLocationSettingModel(list.where((element) => element.selected == 1).toList().first);
      Core.selectLocationSettingModel(list.where((element) => element.selected == 1).toList().first);
    }
    action();
  }

  Future<void> initAppSetting({required final VoidCallback action}) async {
    List<LocationSettingModel> list = await DataManager.getLocationSettingModelList();
    if (list.isNotEmpty) {
      selectLocationSettingModel(list.where((element) => element.selected == 1).toList().first);
      Core.selectLocationSettingModel(list.where((element) => element.selected == 1).toList().first);
    }


    action();
  }

  sendCode(String message){
    String code=getCode2(message);
      if (Core.selectLocationSettingModel.value.id != null) {
        sendMessage(code);
      } else {
        snackbarRed(title: s.error, subtitle: s.pleaseSelectDeviceModel);
      }
  }

  sendCode2(CodeModel model)async{

    String pass = Core.selectedModel.password??'';
    String code =  getCode(model);
    String _code=code.replaceAll("PASS", pass);
    debugPrint(_code);
    sendMessage(_code);
  }
}
