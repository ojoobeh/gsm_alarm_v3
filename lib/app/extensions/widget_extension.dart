part of 'extension.dart';

extension WidgetsExtension on Widget {
  Widget withTooltip(
    final String message, {
    final Decoration? decoration,
    final double? height,
    final bool? preferBelow,
    final EdgeInsetsGeometry? padding,
    final TextStyle? textStyle,
    final Duration? waitDuration,
    final EdgeInsetsGeometry? margin,
  }) =>
      Tooltip(
        message: message,
        decoration: decoration,
        height: height,
        padding: padding,
        preferBelow: preferBelow,
        textStyle: textStyle,
        waitDuration: waitDuration,
        margin: margin,
        child: this,
      );

  Widget fit() => FittedBox(key: key, fit: BoxFit.scaleDown, child: this);

  Widget expanded({final int flex = 1}) => Expanded(flex: flex, child: this);


  Widget onTap(final GestureTapCallback? onTap) => GestureDetector(

      onTap: onTap, child: this);

  Widget onPressed(final GestureTapCallback? onPressed) => InkWell(
      hoverColor: Colors.transparent,
      borderRadius: BorderRadius.circular(16.0),
      onTap: onPressed, child: this);

  Widget onLongPress(final GestureTapCallback? onPressed) => GestureDetector(onLongPress: onPressed, child: this);

  Widget onDoubleTap(final GestureTapCallback? onPressed) => GestureDetector(onDoubleTap: onPressed, child: this);

  Widget ltr() => Directionality(textDirection: TextDirection.ltr, child: this);

  Widget rtl() => Directionality(textDirection: TextDirection.rtl, child: this);

  Widget scale(final double scale) => Transform.scale(scale: scale, child: this);

  Widget translate(final Offset offset) => Transform.translate(offset: offset, child: this);

  Widget rotate(final double scale) => Transform.rotate(angle: scale, child: this);

  Widget safeArea() => SafeArea(child: this);

}
