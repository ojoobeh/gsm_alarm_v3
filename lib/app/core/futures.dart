part of 'core.dart';

String getCode(String code) {
  String _code = code;
  String res = '';
  if (Core.selectLocationSettingModel.value.id != null) {
    //1
    List<CodeModel> list = Core.tbCodeModel.list!.where((element) => element.title == _code).toList(); //2
    int modelType = Core.selectLocationSettingModel.value.modelType ?? 0;
    if (modelType == 1) {
      res = list.first.model1 ?? '';
    } else  {
      res = list.first.model2 ?? '';
    }
  }
  return res;
}

Future<void> updateSelectDeviceModel({required VoidCallback action}) async {

  List<LocationSettingModel> list = await DataManager.getLocationSettingModelList();
  if (list.where((element) => element.selected == 1).toList().isNotEmpty) {
    Core.selectLocationSettingModel(list.where((element) => element.selected == 1).toList().first);
    Core.selectLocationSettingModel(list.where((element) => element.selected == 1).toList().first);
  } else {
    Core.selectLocationSettingModel(LocationSettingModel(name: s.news));
    Core.selectLocationSettingModel(LocationSettingModel(name: s.news));
  }

  List<DeviceModel> deviceModelList = Core.deviceModelList;
  if (Core.selectLocationSettingModel.value.modelType != null) {
    Core.selectDeviceModel(deviceModelList.where((element) => element.id == Core.selectLocationSettingModel.value.modelType).toList().first);
  } else {
    Core.selectDeviceModel(deviceModelList.first);
  }
  action();
}

Future<bool> requestPermission(final per.Permission permission) async {
  if(isAndroid){
    final AndroidDeviceInfo androidInfo = await DeviceInfoPlugin().androidInfo;
    final int sdkInt = androidInfo.version.sdkInt; // SDK, example: 31
    if (sdkInt < 30) {
      return true;
    } else {
      final per.PermissionStatus status = await permission.status;
      if (status.isGranted) {
        return true;
      } else {

        final per.PermissionStatus result = await permission.request();
        if (result == per.PermissionStatus.granted) {
          return true;
        }

        return false;
      }
    }

  }else{
    final per.PermissionStatus status = await permission.status;
    if (status.isGranted) {
      return true;
    } else {
      final per.PermissionStatus result = await permission.request();
      if (result == per.PermissionStatus.granted) {
        return true;
      }

      return false;
    }
  }

}