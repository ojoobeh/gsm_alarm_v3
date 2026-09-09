import 'package:bestdroid/app/core/assets.dart';
import 'package:bestdroid/app/view/location_setting/location_setting_page.dart';
import 'package:bestdroid/app/core/core.dart';
import 'package:bestdroid/app/models/location_setting/location_settings.dart';
import 'package:bestdroid/app/view/location_setting/location_setting_controller.dart';
import 'package:bestdroid/app/widgets/custom_dropdown.dart';
import 'package:bestdroid/app/widgets/widgets.dart';

class CreateLocationSettingPage extends StatefulWidget {
  const CreateLocationSettingPage({this.locationSettingModel, super.key});

  final LocationSettingModel? locationSettingModel;

  @override
  State<CreateLocationSettingPage> createState() => _CreateLocationSettingPageState();
}

class _CreateLocationSettingPageState extends State<CreateLocationSettingPage> with LocationSettingController {
  @override
  void initState() {
    if (widget.locationSettingModel != null) {
      selectLocationSettingModel(widget.locationSettingModel);

      selectPartModel(Core.partModelList.where((element) => element.id == selectLocationSettingModel.value.modelType).toList().first);
      selectDeviceModel(Core.deviceModelList.where((element) => element.model == selectLocationSettingModel.value.modelName).toList().first);
    } else {
      selectDeviceModel(Core.deviceModelList.first);
    }
    nameController.text = selectLocationSettingModel.value.name ?? '';
    passwordController.text = selectLocationSettingModel.value.password;
    simNumberController.text = selectLocationSettingModel.value.simNumber ?? '';


    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Core.baseColor,
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 500),
          child: Stack(
            children: [
              Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: SizedBox(
                      height: Get.height,
                      child: Image.asset(
                        Assets.backgroundImage,
                        fit: BoxFit.cover,
                      ))),
              // Positioned(
              //   top: 50,
              //   right: 10,
              //   child: image(
              //     Assets.logo,
              //     width: 80,
              //     height: 80,
              //   ),
              // ),
              Center(
                child: SizedBox(
                  height: 510,
                  child: Card(
                    color: AppColors.grey,
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Text(s.enterPassword).marginOnly(bottom: 4, top: 20),
                          TextField(
                            decoration: InputDecoration(hintText: s.nameOfInstallationLocation),
                            // hint: s.password,
                            controller: nameController,
                            maxLength: 12,
                            maxLines: 1,
                          ),
                          TextField(
                            decoration: InputDecoration(hintText: s.phoneNumber),
                            // hint: s.password,
                            controller: simNumberController,
                            keyboardType: TextInputType.number,
                            maxLength: 11,
                            maxLines: 1,
                          ),
                          TextField(
                            decoration: InputDecoration(hintText: s.password),
                            // hint: s.password,
                            controller: passwordController,
                            keyboardType: TextInputType.number,
                            maxLength: 4,
                            maxLines: 1,
                          ),
                          if (Core.deviceModelList.length > 1)
                            Obx(() => DropDownWidget(
                                  lable: s.deviceModel,
                                  showSearch: false,
                                  showRadioButton: false,
                                  multiSelect: false,
                                  title: selectDeviceModel.value.model ?? s.installationLocation,
                                  items: Core.deviceModelList.map((e) => e.model ?? '').toList(),
                                  itemSelected: (List<String> items) {
                                    isWifi(false);
                                    if (items.first == s.news) {
                                      passwordController.clear();
                                      nameController.clear();
                                    } else {
                                      selectDeviceModel(Core.deviceModelList.where((element) => element.model == items.first).toList().first);
                                    }
                                  },
                                )),
                          const SizedBox(height: 16),
                          if (Core.partModelList.length > 1)
                            Obx(() => selectDeviceModel.value.hasMultiPart == 1
                                ? DropDownWidget(
                                    lable: s.part,
                                    showSearch: false,
                                    showRadioButton: false,
                                    multiSelect: false,
                                    title: selectPartModel.value.title ?? s.part,
                                    items: Core.partModelList.map((e) => e.title ?? '').toList(),
                                    itemSelected: (List<String> items) {
                                      selectPartModel(Core.partModelList.where((element) => element.title == items.first).toList().first);
                                    },
                                  )
                                : const SizedBox()),
                          const SizedBox(height: 16),
                          widget.locationSettingModel == null
                              ? button(
                                  title: s.save,
                                  onTap: () {
                                    if (isValidParam()) {
                                      insertNewLocation(
                                        action: () => offAll(const LocationSettingPage()),
                                      );
                                    }
                                  },
                                )
                              : button(
                                  title: s.update,
                                  onTap: () {
                                    if (isValidParam()) {
                                      updateLocation(
                                        action: () => offAll(const LocationSettingPage()),
                                      );
                                    }
                                  },
                                ),
                        ],
                      ).paddingSymmetric(horizontal: 32),
                    ),
                  ).marginSymmetric(horizontal: 32),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
