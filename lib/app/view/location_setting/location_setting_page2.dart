import 'package:bestdroid/app/view/home/home_page.dart';
import 'package:bestdroid/app/view/utils/local_storage.dart';
import 'package:get/get.dart';
import 'package:bestdroid/app/core/core.dart';
import 'package:bestdroid/app/models/data_manager.dart';
import 'package:bestdroid/app/models/location_setting/location_settings.dart';
import 'package:bestdroid/app/view/location_setting/location_setting_controller.dart';
import 'package:bestdroid/app/widgets/custom_dropdown.dart';
import 'package:bestdroid/app/widgets/widgets.dart';

class LocationSettingPage2 extends StatefulWidget {
  const LocationSettingPage2({super.key});

  @override
  State<LocationSettingPage2> createState() => _LocationSettingPage2State();
}

class _LocationSettingPage2State extends State<LocationSettingPage2> with LocationSettingController {
  @override
  void initState() {
    init(action: () {
      setState(() {});
    },);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 500),
        child: Scaffold(
          backgroundColor: context.theme.scaffoldBackgroundColor,
          appBar: AppBar(
            backgroundColor: context.theme.scaffoldBackgroundColor,
            iconTheme: IconThemeData(
              color: context.theme.dividerColor,
            ),
            title: Text(s.locationSetting),
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios, color: context.theme.dividerColor),
              onPressed: () => {Navigator.of(context).pop(false)},
            ),
            centerTitle: true,
          ),
          body: Padding(
              padding: const EdgeInsets.all(18.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Text(
                    //   s.installationLocation,
                    //   style: TextStyle(
                    //     fontSize: 12,
                    //     color: context.theme.dividerColor,
                    //   ),
                    // ).marginOnly(bottom: 4, top: 8),
                    Obx(
                      () => DropDownWidget(
                        lable: s.installationLocation,
                        showSearch: false,
                        showRadioButton: false,
                        multiSelect: false,
                        title: selectLocationSettingModel.value.name ?? s.installationLocation,
                        items: locationSettingList.map((e) => e.name ?? '').toList(),
                        itemSelected: (List<String> items) async {
                          if (items.first == s.news) {
                            selectLocationSettingModel(LocationSettingModel(name: s.news));
                            passwordController.clear();
                            nameController.clear();
                            simNumberController.clear();
                          } else {
                            List<LocationSettingModel> list = locationSettingList.where((element) => element.name == items.first).toList();
                            selectLocationSettingModel(list.first);
                            await DataManager.resetLocationSettingSelected(selectLocationSettingModel.value.id ?? 0);
                            init(
                              action: () {
                                setState(() {});
                              },
                            );
                          }
                        },
                      ),
                    ),
                    const SizedBox(height: 8),
                    appTextFormField(
                      title: s.nameOfInstallationLocation,
                      controller: nameController,
                    ),
                    const SizedBox(height: 8),
                    Obx(() => DropDownWidget(
                          lable: s.deviceModel,
                          showSearch: false,
                          showRadioButton: false,
                          multiSelect: false,
                          title: selectDeviceModel.value.model ?? s.installationLocation,
                          items: deviceModelList.map((e) => e.model ?? '').toList(),
                          itemSelected: (List<String> items) {
                            isWifi(false);
                            if (items.first == s.news) {
                              passwordController.clear();
                              nameController.clear();
                            } else {
                              selectDeviceModel(deviceModelList.where((element) => element.model == items.first).toList().first);
                            }
                          },
                        )),
                    const SizedBox(height: 8),
                    Obx(() {
                      return selectDeviceModel.value.hasWifi == 1
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  s.typeOfCommunication,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Get.theme.dividerColor,
                                  ),
                                ).marginOnly(bottom: 4, top: 20),
                                Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Get.theme.dividerColor.withOpacity(0.8), width: 1),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        child: Row(
                                          children: [
                                            Radio(
                                              value: false,
                                              groupValue: isWifi.value,
                                              onChanged: (value) {
                                                isWifi(value);
                                              },
                                            ),
                                            const Text('SMS'),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        child: Row(
                                          children: [
                                            Radio(
                                              value: true,
                                              groupValue: isWifi.value,
                                              onChanged: (value) {
                                                isWifi(value);
                                              },
                                            ),
                                            const Text('WIFI'),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          : Container();
                    }),
                    const SizedBox(height: 8),
                    appTextFormField(
                      title: s.simCardNumber,
                      inputType: TextInputType.number,
                      maxLength: 11,
                      controller: simNumberController,
                    ),

                    const SizedBox(height: 8),
                    appTextFormField(
                      title: s.devicePassword,
                      inputType: TextInputType.number,
                      controller: passwordController,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Obx(
                          () => (selectLocationSettingModel.value.id ?? '') != ''
                              ? button(
                                  width: (screenWidth / 2) - 30,
                                  title: s.save,
                                  backgroundColor: (selectLocationSettingModel.value.id ?? '') != '' ? context.theme.primaryColor : context.theme.primaryColor.withOpacity(0.2),
                                  onTap: () {
                                    if ((selectLocationSettingModel.value.id ?? '') != '') {
                                      if (nameController.text != '' && nameController.text != s.news) {
                                        updateLocation(
                                          action: () {
                                            setData('part1IsOn', part1IsOn.value);
                                            setData('part2IsOn', part2IsOn.value);
                                            setData('setLocation', true);

                                            Get.offAll(const HomePage());
                                          },
                                        );
                                      } else {
                                        snackbarRed(title: s.warning, subtitle: s.nameIsNotTrue);
                                      }
                                    }
                                  },
                                )
                              : const SizedBox(),
                        ),
                        Obx(
                          () => (selectLocationSettingModel.value.id ?? '') == ''
                              ? button(
                                  width: (screenWidth / 2) - 30,
                                  title: s.newLocation,
                                  backgroundColor: (selectLocationSettingModel.value.id ?? '') == '' ? context.theme.primaryColor : context.theme.primaryColor.withOpacity(0.2),
                                  onTap: () {
                                    if ((selectLocationSettingModel.value.id ?? '') == '') {
                                      if (nameController.text != '' && nameController.text != s.news) {
                                        insertNewLocation(
                                          action: () {
                                            setData(AppConstants.part1IsOn, part1IsOn.value);
                                            setData(AppConstants.part2IsOn, part2IsOn.value);
                                            setData(AppConstants.setLocation, true);

                                            Get.offAll(const HomePage());
                                            // Navigator.of(context).pop(true);
                                            // back(result: true);
                                          },
                                        );
                                      } else {
                                        snackbarRed(title: s.warning, subtitle: s.nameIsNotTrue);
                                      }
                                    }
                                  },
                                )
                              : const SizedBox(),
                        ),
                        Obx(
                          () => button(
                            width: (screenWidth / 2) - 30,
                            title: s.deleteLocation,
                            backgroundColor: (selectLocationSettingModel.value.id ?? '') != '' ? context.theme.primaryColor : context.theme.primaryColor.withOpacity(0.2),
                            onTap: () {
                              if ((selectLocationSettingModel.value.id ?? '') != '') {
                                // deleteSelected();
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
