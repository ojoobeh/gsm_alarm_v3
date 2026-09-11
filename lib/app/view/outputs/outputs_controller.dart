import 'package:bestdroid/app/core/core.dart';
import 'package:bestdroid/app/extensions/extension.dart';
import 'package:bestdroid/app/models/data_manager.dart';
import 'package:bestdroid/app/models/location_setting/location_settings.dart';
import 'package:bestdroid/app/models/output/output2.dart';
import 'package:bestdroid/app/widgets/widgets.dart';

mixin OutputsController {
  final formKey = GlobalKey<FormState>();
  LocationSettingModel selectLocationSettingModel=LocationSettingModel();

  final outputList = <Output2Model>[].obs;

  RxBool isLoaded = true.obs;

  // final locationSettingList = <LocationSettingModel>[].obs;

  onGetPresseds() async {}

  saveNewLocation(BuildContext context) async {}

  updateLocation(BuildContext context) async {}

  void get() async {
    // locationSettingList.value = Core.lo;
    debugPrint("dddd");
    debugPrint("dddd");
    outputList.clear();
    outputList(await DataManager.getOutputModelList());
    debugPrint("DDD");
  }

  void changeOutput(Output2Model outputModel, int status) async {
    String pass = selectLocationSettingModel.password;
    String code = await getCode(Core.output);
    sendMessage(code.replaceAll("PASS", pass).replaceAll("STATUS", status.toString()).replaceAll('ID', outputModel.id.toString()));

    // String param = DataManager.Output.replaceAll("ID", outputModel.code.toString());
    // param = param.replaceAll("PASS", selectLocationSettingModel.value.password);
    // param = param.replaceAll("STATUS", status.toString());
    // sendSms(param, outputModel, status);
  }

  void changeOutputTitle(Output2Model outputModel) {
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
                Output2Model output = outputModel;
                output.title = title;
                DataManager.updateOutputs(output);
                isLoaded(true);
                get();
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

// void sendSms(String body, OutputModel outputModel, int status) {
//   Get.defaultDialog(
//     title: s.sendMessage,
//     titleStyle: const TextStyle(
//       fontSize: 18,
//       fontWeight: FontWeight.bold,
//     ),
//     // middleText: "Is True or false ?",
//     content: Text(
//       body,
//       textDirection: TextDirection.ltr,
//       textAlign: TextAlign.center,
//     ),
//     confirm: Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         InkWell(
//           onTap: () async {
//             if (Core.selectLocationSettingModel.value.id != null) {
//
//               String pass = Core.selectLocationSettingModel.value.password;
//               String code = await getCode(DataManager.output);
//               sendMessage(code.replaceAll("PASS", pass).replaceAll("STATUS", status.toString()));
//
//               await telephony.sendSms(to: selectLocationSettingModel.value.simNumber, message: body);
//               OutputModel output = outputModel;
//               output.status = status;
//               DataManager.updateOutputs(output);
//
//               get();
//               back();
//             } else {
//               snackbarRed(title: s.warning, subtitle: s.selectedInstallationLocation);
//             }
//           },
//           child: Container(
//             padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(8),
//               color: Colors.green,
//             ),
//             child: Text(
//               s.send,
//               style: const TextStyle(
//                 color: Colors.white,
//                 fontSize: 14,
//               ),
//             ),
//           ),
//         ),
//         InkWell(
//           onTap: () {
//             back();
//           },
//           child: Container(
//             padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(8),
//               color: Colors.orange.shade800,
//             ),
//             child: Text(
//               s.cancel,
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 14,
//               ),
//             ),
//           ),
//         ),
//       ],
//     ),
//   );
// }
}
