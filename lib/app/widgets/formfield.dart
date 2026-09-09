part of 'widgets.dart';





Widget appTextFormField({
  final TextEditingController? controller,
  final String? paramCheck,
  final String? hint,
  final Widget? suffix,
  final Widget? prefix,
  final Function(String value)? onChanged,
  final Function(String value)? onFieldSubmitted,
  final Function(String? value)? onSaved,
  final TextAlign? textAlign,
  final TextInputType? inputType,
  final int? maxLength,
  final int? maxLines,
  final int? minLines,
  final int? customLaxLength,
  final EdgeInsets? contentPadding,
  final TextInputAction? textInputAction,
  final FormFieldValidator<String>? validator,
  final List<TextInputFormatter>? inputFormatters,
  final VoidCallback? onTap,
  final Color? fillColor,
  final Color? borderColor,
  final Color? hintTextColor,
  final TextDirection? hintTextDirection,
  final TextDirection? textDirection,
  final FocusNode? focusNode,
  final bool? enable,
  final String? title,
  final TextStyle? hintStyle,
  final TextStyle? textStyle,
  final InputDecoration? decoration,
  final bool autoFocus = false,
  final double borderRadius = 8,
  final double? height ,
  final double enabledBorderRadius = 8,
}) =>
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        if (title != null) Text(title).bodyMedium().marginOnly(bottom: 8),
        SizedBox(
          height:height??50,
          child: TextFormField(
            validator: validator,
            enabled: enable,
            controller: controller,
            onChanged: onChanged,
            onTap: () {
              onTap?.call();
              if (controller!.selection == TextSelection.fromPosition(TextPosition(offset: controller.text.length - 1))) {
                controller.selection = TextSelection.fromPosition(TextPosition(offset: controller.text.length));
              }
            },
            textAlign: textAlign ?? TextAlign.start,
            keyboardType: inputType,
            maxLength: maxLength,
            maxLines: maxLines,
            minLines: minLines,
            autofocus: autoFocus,
            onSaved: onSaved,
            textDirection: textDirection ,
            onFieldSubmitted: onFieldSubmitted,
            focusNode: focusNode,
            textAlignVertical: TextAlignVertical.center,
            inputFormatters: inputFormatters,
            textInputAction: textInputAction,
            style: textStyle,
            decoration: decoration ??
                InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(borderRadius),
                    borderSide: BorderSide(color: borderColor ?? context.theme.primaryColorDark),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(borderRadius),
                    borderSide: BorderSide(color: borderColor ?? context.theme.primaryColorDark),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(borderRadius),
                    borderSide: BorderSide(color: borderColor ?? context.theme.primaryColorDark),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(borderRadius),
                    borderSide: BorderSide(color: borderColor ?? context.theme.primaryColorDark),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(borderRadius),
                    borderSide: BorderSide(color: borderColor ?? context.theme.primaryColorDark),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(borderRadius),
                    borderSide: BorderSide(color: borderColor ?? context.theme.primaryColorDark),
                  ),
                  filled: true,
                  fillColor: fillColor ?? context.theme.scaffoldBackgroundColor,
                  focusColor: Colors.green,
                  hoverColor: context.theme.shadowColor.withOpacity(0.5),
                  counterText: "",
                  hintText: hint,
                  hintStyle: hintStyle ?? textTheme.bodyLarge!.copyWith(color: hintTextColor ?? context.theme.hintColor),
                  contentPadding: contentPadding ?? const EdgeInsets.fromLTRB(20, 8, 8, 16),
                  suffixIcon: suffix,
                  prefix: prefix,
                  hintTextDirection: hintTextDirection,
                ),
          ),
        ),
      ],
    );

Widget appTextFormField2({
  final TextEditingController? controller,
  final String? hint,
  final String? counterText,
  final Widget? suffix,
  final Widget? prefix,
  final Function(String)? onChanged,
  final Function(String)? onFieldSubmitted,
  final Function(String?)? onSaved,
  final TextAlign? textAlign,
  final TextInputType? inputType,
  final int? maxLength,
  final int? maxLines,
  final int? minLines,
  final EdgeInsets? contentPadding,
  final TextInputAction? textInputAction,
  final FormFieldValidator<String>? validator,
  final List<TextInputFormatter>? inputFormatters,
  final VoidCallback? onTap,
  final Color? fillColor,
  final Color? hintTextColor,
  final TextDirection? hintTextDirection,
  final TextDirection? textDirection,
  final FocusNode? focusNode,
  final InputDecoration? decoration,
  final bool autoFocus = false,
  final double borderRadius = 16,
  final Color? borderColor,
  final double enabledBorderRadius = 16,
}) =>
    TextFormField(
      validator: validator,
      controller: controller,
      onChanged: onChanged,
      onTap: () {
        if (controller!.selection == TextSelection.fromPosition(TextPosition(offset: controller.text.length - 1))) {
          controller.selection = TextSelection.fromPosition(TextPosition(offset: controller.text.length));
        }
      },
      keyboardType: inputType,
      maxLength: maxLength,
      maxLines: maxLines,
      minLines: minLines,
      autofocus: autoFocus,
      onSaved: onSaved,
      textDirection: textDirection,
      onFieldSubmitted: onFieldSubmitted,
      focusNode: focusNode,
      textAlignVertical: TextAlignVertical.center,
      inputFormatters: inputFormatters,
      textInputAction: textInputAction,
      decoration: decoration ??
          InputDecoration(
            filled: true,
            fillColor: fillColor ?? context.theme.scaffoldBackgroundColor,
            counterText: counterText ?? "",
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(borderRadius)),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(enabledBorderRadius),
              borderSide: BorderSide(color: borderColor ?? context.theme.dividerColor),
            ),
            hintText: hint,
            hintStyle: textTheme.bodyLarge!.copyWith(color: hintTextColor ?? context.theme.hintColor),
            contentPadding: contentPadding ?? const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            suffixIcon: suffix,
            prefixIcon: prefix,
            hintTextDirection: hintTextDirection,
          ),
    );



