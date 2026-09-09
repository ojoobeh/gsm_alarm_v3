import 'package:bestdroid/app/core/assets.dart';
import 'package:bestdroid/app/core/core.dart';
import 'package:bestdroid/app/view/splash/splash_controller.dart';
import 'package:bestdroid/app/widgets/widgets.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with SplashController {
  // double _value = 0;

  @override
  void initState() {
    getVersion(
      action: () {
        insertDeviceModel(
          action: () {
            updateSelectDeviceModel(action: () {});
          },
        );
      },
    );

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
                  top: 0,
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
                  height: 200,
                  child: Card(
                    color: AppColors.grey,
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Text(s.enterPassword).marginOnly(bottom: 4, top: 20),
                          TextField(
                            decoration: InputDecoration(hintText: s.password),
                            // hint: s.password,
                            controller: passwordController,
                            keyboardType: TextInputType.number,
                            maxLength: 4,
                            maxLines: 1,
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          button(
                            title: s.login,
                            onTap: () {
                              login();
                            },
                          ),
                        ],
                      ).paddingSymmetric(horizontal: 32),
                    ),
                  ),
                ).marginSymmetric(horizontal: 32),
              )
            ],
          ),
        ),
      ),
    );
  }

  String getDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "$twoDigitMinutes:$twoDigitSeconds";
  }
}
