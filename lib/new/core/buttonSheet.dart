import 'dart:ui';

import 'package:bestdroid/app/core/core.dart';
import 'package:bestdroid/app/core/get.dart';
import 'package:bestdroid/app/extensions/extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

Future<bool> bottomSheet2({
  required final Widget child,
  final double height = 330,
  final Color? backgroundColor,
  final bool? isScrollControlled,
  final EdgeInsets? margin,
  final EdgeInsets? padding,
  final bool? isDismissible,
  final VoidCallback? whenComplete,
}) async {
  final result =
      await showModalBottomSheet<bool>(
        isScrollControlled: isScrollControlled ?? true,
        context: context,
        clipBehavior: Clip.hardEdge,
        isDismissible: isDismissible ?? true,
        backgroundColor: backgroundColor ?? Colors.transparent,
        builder: (final BuildContext context) => SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Wrap(
            children: <Widget>[
              Container(
                margin: margin ?? MediaQuery.of(context).viewInsets,
                decoration: BoxDecoration(
                  color: backgroundColor ?? context.theme.scaffoldBackgroundColor,
                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                ),
                padding: padding ?? const EdgeInsets.all(20),
                child: child,
              ),
            ],
          ),
        ).safeArea(),
      ).whenComplete(
        () {
          if (whenComplete != null) {
            whenComplete();
          }
        },
      );
  return result ?? false;
}

Future<bool> baseButtonSheet({
  required final BuildContext context,
  required final Widget child,
  final VoidCallback? onConfirmClickListener,
  final VoidCallback? onCancelClickListener,
  final bool? showConfirmButton,
  final bool? showCancelButton,
  final bool? isDismissible,
  final String? confirmTitle,
  final String? cancelTitle,

  bool isFilter = false,
}) async {
  Color buttonTextColor = Theme.of(context).primaryColor;
  final result = await bottomSheet2(
    isDismissible: isDismissible,
    backgroundColor: Theme.of(context).cardColor.withValues(alpha: isFilter ? 0.5 : 1), //
    padding: EdgeInsets.zero,
    child: !isFilter
        ? Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: Get.width / 4,
                height: 2,
                decoration: BoxDecoration(
                  color: Theme.of(context).canvasColor.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(32),
                ),
              ),
              SizedBox(height: 8), //
              child,
              Divider(endIndent: 0, indent: 0),
              SizedBox(
                height: 40,
                child: Row(
                  children: <Widget>[
                    (onConfirmClickListener != null)
                        ? Container(
                                height: 40,
                                color: Colors.transparent,
                                child: Center(child: Text(confirmTitle ?? s.ok).labelLarge(color: buttonTextColor)),
                              )
                              .onTap(
                                onConfirmClickListener,
                              )
                              .expanded()
                        : SizedBox(),
                    (onConfirmClickListener != null)
                        ? Container(
                            width: 0.5,
                            height: 40,
                            color: Theme.of(context).hintColor.withValues(alpha: 0.2),
                          )
                        : SizedBox(),
                    Container(
                      height: 40,
                      color: Colors.transparent,
                      child: Center(child: Text(cancelTitle ?? s.cancel).labelLarge(color: buttonTextColor)),
                    ).onTap(
                      () {
                        if (onCancelClickListener != null) {
                          onCancelClickListener();
                        } else {
                          back();
                        }
                      },
                    ).expanded(),
                  ],
                ),
              ),
            ],
          )
        : BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: Get.width / 4,
                  height: 2,
                  decoration: BoxDecoration(
                    color: Theme.of(context).canvasColor.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(32),
                  ),
                ),
                SizedBox(height: 8),

                child,
              ],
            ),
          ),
  );
  return result;
}

void alertButtonSheet({
  required final BuildContext context,
  final String? title,
  required final String description,
}) {
  baseButtonSheet(
    context: context,
    onConfirmClickListener: () {
      back();
    },
    showCancelButton: false,
    child: Column(
      spacing: 8,
      children: [
        //
        if (title != null) Text(title).labelLarge(color: Theme.of(context).primaryColor.withValues(alpha: 0.8)),
        Text(
          description,
          textAlign: TextAlign.justify,
        ).bodySmall(),
      ],
    ).marginAll(16),
  );
}

// void examAnswerButtonSheet({
//   required BuildContext context,
//   required final String question,
//   required final String answer,
//   required Function() onNextClickListener,
//   required Function() onReportClickListener,
//   bool? isDismissible,
// }) {
//   bottomSheet(
//     isDismissible: isDismissible,
//     backgroundColor: Theme.of(context).cardColor.withValues(alpha: 0.5), //
//     padding: EdgeInsets.zero,
//     child: BackdropFilter(
//       filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
//       child: Column(
//         children: <Widget>[
//           SizedBox(
//             height: 40,
//             child: Row(
//               children: <Widget>[
//                 Center(child: Text(s.confirm).labelLarge()).onTap(onNextClickListener).expanded(),
//                 Container(width: 0.5, height: 40, color: Theme.of(context).hintColor.withValues(alpha: 0.2)),
//                 Center(child: Text(s.report).labelLarge()).onTap(
//                   () {
//                     onReportClickListener();
//                   },
//                 ).expanded(),
//               ],
//             ),
//           ),
//         ],
//       ),
//     ),
//   );
// }

// void bazarWalletButtonSheet({
//   required BuildContext context,
//   required Function(int price, int discount, bool isFree) result,
// }) {
//   TextEditingController priceController = TextEditingController();
//   TextEditingController discountController = TextEditingController();
//   Rx<int> selectPrice = 0.obs;
//
//   Rx<bool> _isFree = false.obs;
//   baseButtonSheet(
//     context: context,
//     onConfirmClickListener: () {
//       int _price = priceController.text == '' ? 0 : int.parse(priceController.text);
//       int _discount = discountController.text == '' ? 0 : int.parse(discountController.text);
//       result(_price, _discount, _isFree.value);
//
//     },
//     child: BackdropFilter(
//       filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
//       child: Column(
//         children: <Widget>[
//           Column(
//             children: [
//               SizedBox(height: 16),
//               // Text(s.buy).labelLarge().marginSymmetric(vertical: 8),
//               // const Divider(endIndent: 0, indent: 0), //
//               Row(
//                 spacing: 16,
//                 children: [
//                   Obx(
//                         () => AppTextField(
//                       controller: priceController,
//                       label: s.price,
//                       textInputType: TextInputType.number,
//                       enabled: !_isFree.value,
//                     ),
//                   ).expanded(),
//                 ],
//               ), //
//               SizedBox(height: 16),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Obx(
//                         () => AppTextField(
//                       //
//                       controller: discountController,
//                       label: s.discount,
//                       textInputType: TextInputType.number,
//                       maxLength: 3,
//                       enabled: !_isFree.value,
//                     ),
//                   ).expanded(),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                       Text(s.free).bodySmall(),
//                       Obx(
//                             () => SizedBox(
//                           child: AppSwitch(
//                             value: _isFree.value,
//                             onChanged: (value) {
//                               _isFree(!_isFree.value);
//                               if (_isFree.value) {
//                                 priceController.clear();
//                                 priceController.clear();
//                               }
//                             },
//                           ).marginAll(8),
//                         ),
//                       ),
//                     ],
//                   ).expanded(),
//                 ],
//               ),
//             ], //
//           ).marginSymmetric(horizontal: 16),
//         ],
//       ),
//     ),
//   );
// Widget _itemPrice(BuildContext context, final int _price) =>
//     Container(
//       width: 110,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(8),
//         // color: Theme.of(context).primaryColor, //
//         border: Border.all(color: Theme.of(context).primaryColor), //
//       ),
//       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
//       child: Center(child: Text(getPrice(_price.toString())).titleMedium(color: Colors.white)),
//     ).onTap(
//           () => selectPrice(_price),
//     );
// }
// void showReportDialog({
//   required final BuildContext context,
//   required final List<String> params,
//   required final Function(String description, String param) action,
// }) {
//   final Rx<String> status = params.isNotEmpty ? params.first.obs : ''.obs;
//   final TextEditingController controller = TextEditingController();
//   showDialog(
//     // useSafeArea: true,
//     context: context,
//     builder: (final BuildContext context) => AlertDialog(
//       contentPadding: const EdgeInsets.symmetric(horizontal: 4),
//       title: Text(s.report).labelLarge(color: Theme.of(context).canvasColor),
//       scrollable: true,
//       content: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: <Widget>[
//           if (status.value != '')
//             Column(
//               //
//               children: params
//                   .map(
//                     (final String e) =>
//                     Row(
//                       children: <Widget>[
//                         Obx(() => Radio<String>(value: status.value, groupValue: e, onChanged: (final String? value) => status(e))),
//                         Text(e).bodySmall(color: Theme.of(context).canvasColor),
//                       ],
//                     ).onTap(() {
//                       status(e);
//                     }),
//               )
//                   .toList(),
//             ),
//           AppTextField(
//             controller: controller,
//             // textAlign: TextAlign.start,
//             maxLines: 5,
//             minLines: 5,
//             // enable: true,
//             // borderColor: Theme.of(context).cardColor,
//             label: s.description,
//           ).marginSymmetric(horizontal: 16, vertical: 16),
//           AppButton(
//             text: s.send,
//             textColor: Colors.white,
//             // isLoading: true,
//             onPressed: () {
//               action(controller.text, status.value);
//               Get.back();
//             },
//           ).marginSymmetric(horizontal: 16),
//           const SizedBox(height: 16),
//         ],
//       ),
//     ),
//   );
// }
