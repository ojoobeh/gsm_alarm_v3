import 'package:bestdroid/app/manager/output_manager.dart';
import 'package:bestdroid/app/models/output/output.dart';
import 'package:bestdroid/app/models/output/output2.dart';
import 'package:bestdroid/app/view/home/outputs_controller.dart';
import 'package:bestdroid/app/core/assets.dart';
import 'package:bestdroid/app/core/core.dart';
import 'package:bestdroid/app/extensions/extension.dart';
import 'package:bestdroid/app/models/data_manager.dart';
import 'package:bestdroid/app/view/location_setting/location_setting_page.dart';
import 'package:bestdroid/app/widgets/widgets.dart';

class HomeUpdateOutputPage extends StatefulWidget {
  const HomeUpdateOutputPage({super.key});

  @override
  State<HomeUpdateOutputPage> createState() => _HomeUpdateOutputPageState();
}

class _HomeUpdateOutputPageState extends State<HomeUpdateOutputPage> with OutputsController {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    init(
      action: () {
        get(action: () => isLoading(false));
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        leading: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          alignment: Alignment.centerRight,
          child: Icon(Icons.menu_outlined, color: context.theme.primaryColorDark, size: 32).onTap(() {
            scaffoldKey.currentState!.openDrawer();
          }),
        ),
        actions: [Center(child: const Text('').bodyLarge()).marginSymmetric(horizontal: 8)],
        title: Text(Core.selectedModel.title ?? '').displayLarge().onTap(() async {
          bool isChange = await Get.to(const LocationSettingPage());
          if (isChange) {
            init(
              action: () {
                isLoading(false);
              },
            );
          }
        }),
        centerTitle: true,
      ), //
      // drawer: _drawer(),
      body: Stack(
        children: [
          SizedBox(
            width: screenWidth,
            child: image(Assets.backgroundImage, fit: BoxFit.cover),
          ),
          Container(color: Colors.brown.withOpacity(0.6), width: screenWidth, height: screenHeight),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListView.builder(
                itemCount: Core.selectedModel.outputModels?.length ?? 0,
                itemBuilder: (context, index) => _itemOutput(outputModel: Core.selectedModel.outputModels![index], index: index),
              ).marginSymmetric(horizontal: 32).expanded(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _itemOutput({required final OutputModel outputModel, required final int index}) {
    TextEditingController controller = TextEditingController();
    controller.text = outputModel.title != '' ? outputModel.title : '${s.output} ${index + 1}';
    RxBool isMomentary = (outputModel.isMomentary == 1).obs;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(6), color: Colors.white.withOpacity(0.8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('${s.output} ${index + 1}').bodyMedium(),
              Row(
                children: [
                  Text(s.surface),
                  Obx(
                    () => Switch(
                      value: isMomentary.value,
                      onChanged: (value) {
                        isMomentary(value);
                        OutputModel output = outputModel;
                        output.isMomentary = value ? 1 : 0;
                        outputList[index].isMomentary = value ? 1 : 0;
                        OutputManager.update(output);
                        // DataManager.updateOutputs(output);
                        snackbarGreen(title: s.success, subtitle: s.renameIsSuccess);
                      },
                    ),
                  ),
                  Text(s.momentary),
                ],
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [appTextFormField(controller: controller).marginSymmetric(horizontal: 8).expanded()],
          ).marginOnly(bottom: 8),
          button(
            width: screenWidth,
            backgroundColor: Colors.blueGrey,
            titleWidget: Text(s.rename).labelLarge(color: Colors.white),
            onTap: () {
              if (controller.text.length > 1) {
                OutputModel output = outputModel;
                output.title = controller.text;
                outputList[index].title = controller.text;
                OutputManager.update(output);
                // DataManager.updateOutputs(output);
                isLoaded(true);
                FocusManager.instance.primaryFocus!.unfocus();
                snackbarGreen(title: s.success, subtitle: s.renameIsSuccess);
              }
            },
          ).marginSymmetric(horizontal: 4),
        ],
      ),
    );
  }
}
