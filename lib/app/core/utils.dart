part of 'core.dart';

S s = S.of(context);

bool isPersianLang() => Get.locale == const Locale("fa");

ThemeData getTheme() {
  if (getString(AppConstants.theme) == AppConstants.lightTheme) return AppThemes.lightTheme();
  if (getString(AppConstants.theme) == AppConstants.darkTheme) return AppThemes.darkTheme();
  return AppThemes.lightTheme();
}

void exitDialog() {
  Get.defaultDialog(
    title: s.exit,
    titleStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    // middleText: "Is True or false ?",
    content: Text(s.doYouExit, textDirection: TextDirection.ltr, textAlign: TextAlign.center),
    confirm: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          hoverColor: Colors.transparent,
          onTap: () async {
            SystemChannels.platform.invokeMethod('SystemNavigator.pop');
            Future<bool>(() => true);
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Colors.green),
            child: Text(s.exit).bodySmall(),
          ),
        ),
        InkWell(
          hoverColor: Colors.transparent,
          onTap: () {
            Get.back();
            // exit(0);//
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Colors.orange.shade800),
            child: Text(s.cancel).bodySmall(),
          ),
        ),
      ],
    ),
  );
}

void getParamDialog({required String title, TextInputType? inputType, required Function(String param) result}) {
  String param = '';
  Get.defaultDialog(
    title: title,
    titleStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    // middleText: "Is True or false ?",
    content: appTextFormField(
      inputType: inputType ?? TextInputType.number,
      onChanged: (value) {
        param = value;
      },
    ),
    confirm: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        button(title: s.confirm, onTap: () => result(param)),
        button(title: s.cancel, onTap: () => Get.back()),
      ],
    ),
  );
}

void getEmergencyButtonNameDialog({required Function(String param, String code) result}) {
  String param = '';
  String code = '';
  Get.defaultDialog(
    title: s.emergencyButton,
    titleStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    // middleText: "Is True or false ?",
    content: Column(
      children: [
        appTextFormField(
          hint: s.buttonName,
          textStyle: context.textTheme.bodyMedium,
          onChanged: (value) {
            param = value;
          },
        ),
        const SizedBox(height: 8),
        appTextFormField(
          hint: s.code,
          textStyle: context.textTheme.bodyMedium,
          onChanged: (value) {
            code = value;
          },
        ),
      ],
    ),
    confirm: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        button(title: s.confirm, onTap: () => result(param, code)),
        button(title: s.cancel, onTap: () => Get.back()),
      ],
    ),
  );
}

void showYesOrNoDialog({required String title, required final String description, required final VoidCallback action}) {
  Get.defaultDialog(
    title: title,
    titleStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    // middleText: "Is True or false ?",
    content: Text(description).bodyMedium(color: context.theme.primaryColorDark),
    confirm: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        button(title: s.confirm, onTap: () => action()),
        button(title: s.cancel, onTap: () => Get.back()),
      ],
    ),
  );
}

void simCardCharge(String key) {
  String message = getCode2(DataManager.chargeCode).replaceAll('SHARGE', key);

  sendMessage(message);
}

void sendMessage(String message) {
    String body = message;
    if (Core.selectDeviceModel.value.hasWifi == 1 && (getBool(AppConstants.isWifi) ?? false)) {
      body = ("${body}W");
    }

    Get.defaultDialog(
      title: s.sendMessage,
      titleStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      // middleText: "Is True or false ?",
      content: Text(
        // s.canSMSBeSent,
        body != '-' ? body : s.codIsDisable,
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.center,
      ).bodySmall(),
      confirm: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            hoverColor: Colors.transparent, //
            onTap: () async {
              if (Core.selectLocationSettingModel.value.id != null) {
                if (message != '-') {
                  updateSelectDeviceModel(
                    action: () async {
                      if (Core.selectDeviceModel.value.hasWifi == 1 && (getBool(AppConstants.isWifi) ?? false)) {
                        try {
                          Socket socket = await Socket.connect(Core.ip, Core.port);
                          socket.add(utf8.encode(body));
                          debugPrint("RRRR");
                        } catch (_) {}

                        back();
                      } else {
                        back();
                        sendSms(body: body, phone: Core.selectLocationSettingModel.value.simNumber ?? '');
                      }
                    },
                  );

                  // snackbarGreen(title: s.error, subtitle: result);
                }
              } else {
                snackbarRed(title: s.error, subtitle: s.selectedInstallationLocation);
              }
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: body != '-' ? Colors.green : Colors.grey),
              child: Text(s.send),
            ),
          ),
          InkWell(
            hoverColor: Colors.transparent,
            onTap: () {
              Get.back();
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Colors.orange.shade800),
              child: Text(s.cancel),
            ),
          ),
        ],
      ),
    );

}

void sendSms({required final String body, required final String phone}) async {
  final Uri uri = Uri(scheme: 'sms', path: phone, queryParameters: {'body': body});

  await launchUrl(uri);
}
