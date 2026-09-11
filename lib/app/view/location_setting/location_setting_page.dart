import 'package:bestdroid/app/core/assets.dart';
import 'package:bestdroid/app/extensions/extension.dart';
import 'package:bestdroid/app/manager/model_manager.dart';
import 'package:bestdroid/app/manager/output_manager.dart';
import 'package:bestdroid/app/models/model/model.dart';
import 'package:bestdroid/app/models/output/output.dart';
import 'package:bestdroid/app/view/home/home_page.dart';
import 'package:bestdroid/app/view/location_setting/create_location_setting_page.dart';
import 'package:bestdroid/app/view/splash/splash_page.dart';
import 'package:bestdroid/app/view/utils/local_storage.dart';
import 'package:get/get.dart';
import 'package:bestdroid/app/core/core.dart';
import 'package:bestdroid/app/models/data_manager.dart';
import 'package:bestdroid/app/models/location_setting/location_settings.dart';
import 'package:bestdroid/app/view/location_setting/location_setting_controller.dart';
import 'package:bestdroid/app/widgets/widgets.dart';

class LocationSettingPage extends StatefulWidget {
  const LocationSettingPage({super.key});

  @override
  State<LocationSettingPage> createState() => _LocationSettingPageState();
}

class _LocationSettingPageState extends State<LocationSettingPage> with LocationSettingController {
  @override
  void initState() {
    models = ModelManager.getList();
    debugPrint('DDD');

    init(
      action: () {
        setState(() {});
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        exitDialog();
        return Future<bool>(() => false); // won't exit the ap
      },
      child: Scaffold(
        backgroundColor: Core.baseColor,
        appBar: AppBar(
          title: Text(s.locationSetting).bodyLarge(),
          actions: [
            const Icon(Icons.add_circle, size: 32, color: AppColors.grey).marginSymmetric(horizontal: 16).onTap(() {
              push(const CreateLocationSettingPage());
            }),
          ],
        ),
        body: Column(
          children: [
            Container(
              constraints: const BoxConstraints(maxWidth: 500),
              child: ListView.builder(
                itemCount: models.length,
                itemBuilder: (context, index) => _item2(model: models[index], index: index),
              ),
            ).expanded(),
          ],
        ),
      ),
    );
  }

  Widget _item({required LocationSettingModel model, required int index}) =>
      Container(
        color: Colors.transparent,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    image(Assets.homeSetting, width: 48, height: 48),
                    const SizedBox(width: 8),
                    Text(model.name ?? '').titleMedium().bold(),
                    if (isDebugMode) Text(model.partType.toString()).titleMedium().bold(),
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.edit, size: 24, color: Colors.green).onTap(() {
                      getParamDialog(
                        title: s.password,
                        inputType: TextInputType.number,
                        result: (param) {
                          if (param == (getString(DataManager.adminPassword) ?? AppConstants.defaultAdminPassword)) {
                            back();
                            push(CreateLocationSettingPage(locationSettingModel: model));
                          } else {
                            snackbarRed(title: s.warning, subtitle: s.wrongPassword);
                          }
                        },
                      );
                    }),
                    const SizedBox(width: 16), //
                    const Icon(Icons.delete_forever, size: 24, color: Colors.red).onTap(() {
                      getParamDialog(
                        title: s.password,
                        inputType: TextInputType.number,
                        result: (param) async {
                          if (param == (getString(DataManager.adminPassword) ?? AppConstants.defaultAdminPassword)) {
                            bool isTrue = await ModelManager.deleteById(model.id!);
                            if (isTrue) {
                              offAll(const SplashPage());
                            }
                            // // OLD
                            //   back();
                            //   deleteSelected(
                            //     model: model,
                            //     action: () => init(
                            //       action: () => setState(() {}),
                            //     ),
                            //   );
                          } else {
                            snackbarRed(title: s.warning, subtitle: s.wrongPassword);
                          }
                        },
                      );
                    }),
                  ],
                ),
              ],
            ).paddingSymmetric(vertical: 8, horizontal: 16),
            const Divider(),
          ],
        ),
      ).onTap(() async {
        List<LocationSettingModel> list = locationSettingList.where((element) => element.name == model.name).toList();
        selectLocationSettingModel(list.first);
        await DataManager.resetLocationSettingSelected(selectLocationSettingModel.value.id ?? 0);
        updateSelectDeviceModel(
          action: () {
            push(const HomePage());
          },
        );
      });

  Widget _item2({required Model model, required int index}) =>
      Container(
        color: Colors.transparent,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    image(Assets.homeSetting, width: 48, height: 48),
                    const SizedBox(width: 8),
                    Text(model.title ?? '').titleMedium().bold(),
                    // if (isDebugMode) Text(model.partType.toString()).titleMedium().bold(),
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.edit, size: 24, color: Colors.green).onTap(() {
                      getParamDialog(
                        title: s.password,
                        inputType: TextInputType.number,
                        result: (param) {
                          if (isDebugMode ||(param == (getString(DataManager.adminPassword) ?? AppConstants.defaultAdminPassword))) {
                            back();
                            push(CreateLocationSettingPage(model: model));
                          } else {
                            snackbarRed(title: s.warning, subtitle: s.wrongPassword);
                          }
                        },
                      );
                    }),
                    const SizedBox(width: 16), //
                    const Icon(Icons.delete_forever, size: 24, color: Colors.red).onTap(() {
                      getParamDialog(
                        title: s.password,
                        inputType: TextInputType.number,
                        result: (param) async {
                          if (isDebugMode ||(param == (getString(DataManager.adminPassword) ?? AppConstants.defaultAdminPassword))) {
                            bool isTrue = await ModelManager.deleteById(model.id!);
                            if (isTrue) {
                              offAll(const SplashPage());
                            }
                            // // OLD
                            //   back();
                            //   deleteSelected(
                            //     model: model,
                            //     action: () => init(
                            //       action: () => setState(() {}),
                            //     ),
                            //   );
                          } else {
                            snackbarRed(title: s.warning, subtitle: s.wrongPassword);
                          }
                        },
                      );
                    }),
                  ],
                ),
              ],
            ).paddingSymmetric(vertical: 8, horizontal: 16),
            const Divider(),
          ],
        ),
      ).onTap(() async {

        Model _model=model;
        List<OutputModel> listOutput = OutputManager.getList().where((element) => element.deviceId==model.id).toList();
        _model.outputModels=listOutput;
        debugPrint('dddd');
        Core.selectedModel=_model;
        push(HomePage(model: _model));

        // List<LocationSettingModel> list = locationSettingList.where((element) => element.name == model.title).toList();
        // selectLocationSettingModel(list.first);
        // await DataManager.resetLocationSettingSelected(selectLocationSettingModel.value.id ?? 0);
        // updateSelectDeviceModel(
        //   action: () {
        //     push(const HomePage());
        //   },
        // );
      });
}
