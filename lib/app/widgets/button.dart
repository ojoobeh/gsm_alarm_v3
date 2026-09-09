part of 'widgets.dart';

Widget button({
  required final VoidCallback onTap,
  final String title = "",
  final EdgeInsets margin = EdgeInsets.zero,
  final EdgeInsets padding = const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
  final Widget trailing = const SizedBox(),
  final Widget leading = const SizedBox(),
  final double? width,
  final double height = 50,
  final Widget? titleWidget,
  final Color? backgroundColor,
  final double? borderRadius = 10,
  final TextStyle? textStyle,
  final bool maxWidth = false,
  final Color? borderColor,
  final Color? titleColor,
}) =>
    Container(
      width: width ?? 110 ,
      height: height,
      padding: margin,
      child: ElevatedButton(
        onPressed: onTap,
        style: ButtonStyle(
          padding: MaterialStateProperty.all(padding),
          backgroundColor: MaterialStateProperty.all(backgroundColor??context.theme.scaffoldBackgroundColor),
          shape: borderRadius == null
              ? null
              : MaterialStateProperty.all(
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius), side: BorderSide(color: borderColor ?? Colors.transparent)),
                ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            leading,
            titleWidget ?? Text(title, style: textStyle?.copyWith(color: titleColor ?? context.theme.primaryColorDark) ?? textTheme.bodyLarge!.copyWith(color: titleColor ?? context.theme.primaryColorDark)),
            trailing,
          ],
        ),
      ),
    );

Widget customButton({required Widget child, String? title, Color? backgroundColor, double? borderRadius, EdgeInsetsGeometry? widgetPadding}) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null) Text(title).bodyMedium().paddingSymmetric(vertical: 8),
        Container(
          decoration: AppConstants.customDecoration(
              color: backgroundColor,
              borderRadius: borderRadius),
          padding: widgetPadding ?? const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
          child: child,
        ),
      ],
    );

Widget borderButton({
  final Function()? onTap,
  final String title = "",
  final double? borderWidth,
  final Color? borderColor,
  final TextStyle? textStyle,
}) =>
    OutlinedButton(
      onPressed: onTap,
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        splashFactory: NoSplash.splashFactory,
        backgroundColor: context.theme.scaffoldBackgroundColor,
        side: BorderSide(
          width: borderWidth ?? 1,
          color: borderColor ?? context.theme.dividerColor,
        ),
      ),
      child: Text(title, style: textStyle ?? context.textTheme.bodyLarge),
    );

Widget radios({required List<KeyStringModel> buttons, required Function(KeyStringModel selected) onClick}) {
  RxInt value = 0.obs;
  const double runSpacing = 4;
  const double spacing = 4;
  const columns = 4;
  final w = (MediaQuery.of(context).size.width - runSpacing * (columns - 1)) / columns;

  return SingleChildScrollView(
    child: Wrap(
      runSpacing: runSpacing,
      spacing: spacing,
      alignment: WrapAlignment.center,
      children: List.generate(buttons.length, (index) {
        return SizedBox(
          width: w,
          height: w / 2,
          child: InkWell(
            hoverColor: Colors.transparent,
            onTap: () {
              value(index);
              onClick(buttons[index]);
              debugPrint(value.value.toString());
            },
            child: Obx(
              () => Row(
                children: [
                  Text(buttons[index].title ?? ''),
                  Radio(
                    value: index,
                    groupValue: value.value,
                    onChanged: (val) {
                      value(index);
                      onClick(buttons[index]);
                      debugPrint(value.value.toString());
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    ),
  );
}
