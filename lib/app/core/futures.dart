part of 'core.dart';


String getCode( CodeModel codeModel) {
  String res = '';
  //1
  int modelType=Core.selectedModel.modelId??0;
  debugPrint('ddd');
  if (modelType == 1) {
    res = codeModel.model1 ?? '';
  } else if (modelType == 2) {
    res = codeModel.model2 ?? '';
  } else {
    res = codeModel.model3 ?? '';
  }
  return res;
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