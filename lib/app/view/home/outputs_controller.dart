import 'package:bestdroid/app/core/core.dart';
import 'package:bestdroid/app/extensions/extension.dart';
import 'package:bestdroid/app/manager/output_manager.dart';
import 'package:bestdroid/app/models/data_manager.dart';
import 'package:bestdroid/app/models/location_setting/location_settings.dart';
import 'package:bestdroid/app/models/model_device/device.dart';
import 'package:bestdroid/app/models/output/output.dart';
import 'package:bestdroid/app/view/utils/local_storage.dart';
import 'package:bestdroid/app/widgets/widgets.dart';

mixin OutputsController {



  Rx<DeviceModel> selectDeviceMode = DeviceModel().obs;
  final formKey = GlobalKey<FormState>();
  RxBool isLoading = true.obs;
  RxString selectCountOfOutput='4'.obs;
  Rx<LocationSettingModel> selectLocationSettingModel = LocationSettingModel().obs;

  Future<void> init({required final VoidCallback action}) async {
    List<LocationSettingModel> list = await DataManager.getLocationSettingModelList();
    if (list.isNotEmpty) {
      selectLocationSettingModel(list.where((element) => element.selected == 1).toList().first);
      Core.selectLocationSettingModel(list.where((element) => element.selected == 1).toList().first);
    }
    selectCountOfOutput(getString(AppConstants.countOfOutput));
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

  sendCode(String message) {
    String code = getCode2(message);
    if (Core.selectLocationSettingModel.value.id != null) {
      if (getBool('isWifi')??false ) {
        sendMessage("${code}W");
      } else {
        sendMessage(code);
      }
    } else {
      snackbarRed(title: s.error, subtitle: s.pleaseSelectDeviceModel);
    }
  }

  final outputList = <OutputModel>[].obs;

  RxBool isLoaded = true.obs;

  onGetPresseds() async {}

  saveNewLocation(BuildContext context) async {}

  updateLocation(BuildContext context) async {}

  void get({required final VoidCallback action}) async {
    outputList.clear();
    outputList( Core.selectedModel.outputModels??<OutputModel>[]);
    action();
  }

  void changeOutput(OutputModel outputModel, int status) async {
    String pass = '1111';
    String code = await getCode(Core.output);
    sendMessage(code.replaceAll("PASS", pass).replaceAll("STATUS", status.toString()).replaceAll('ID', outputModel.id.toString()));
  }

  void changeOutputTitle(OutputModel outputModel) {
    String title = '';
    Get.defaultDialog(
      title: outputModel.title,
      titleStyle: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      // middleText: "Is True or false ?",
      content: Container(
        child: Column(
          children: [
            Text(s.outputName).bodyLarge(),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: appTextFormField(
                  inputType: TextInputType.text,
                  onChanged: (value) => title = value,
                  textAlign: TextAlign.center,
                  maxLength: 8,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return s.pleaseEnterOutputName;
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: s.outputName,
                    border: InputBorder.none,
                    counterText: "",
                    isCollapsed: true,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      confirm: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            hoverColor: Colors.transparent,
            onTap: () {
              if (title.length > 3) {
                OutputModel output = outputModel;
                output.title = title;
                OutputManager.update(output);
                // DataManager.updateOutputs(output);
                isLoaded(true);
                get(
                  action: () {},
                );
                back();
                back();
              } else {
                snackbarRed(title: s.warning, subtitle: s.enterTheTitle);
              }
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.green,
              ),
              child: Text(
                s.send,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ),
          ),
          InkWell(
            hoverColor: Colors.transparent,
            onTap: () {
              back();
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.orange.shade800,
              ),
              child: Text(s.cancel, style: const TextStyle(color: Colors.white, fontSize: 14)),
            ),
          ),
        ],
      ),
    );
  }
}
