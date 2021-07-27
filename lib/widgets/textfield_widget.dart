import 'package:flutter/material.dart';
import 'package:my_boilerplate/constants/colors.dart';

class TextFormFieldWidget extends StatelessWidget {
  final IconData? icon;
  final String? hint;
  final String? errorText;
  final int? maxLines;
  final int? maxLength;
  final bool isObscure;
  final bool isIcon;
  final TextInputType? inputType;
  final TextEditingController textController;
  final EdgeInsets padding;
  final Color hintColor;
  final Color? focusColor;
  final Color? borderColor;
  final Color iconColor;
  final FocusNode? focusNode;
  final ValueChanged? onFieldSubmitted;
  final ValueChanged? onChanged;
  final bool autoFocus;
  final TextInputAction? inputAction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: TextFormField(
        controller: textController,
        focusNode: focusNode,
        onFieldSubmitted: onFieldSubmitted,
        onChanged: onChanged,
        autofocus: autoFocus,
        textInputAction: inputAction,
        obscureText: this.isObscure,
        maxLength: maxLength ?? 25,
        maxLines: maxLines ?? 1,
        keyboardType: this.inputType,
        style: Theme.of(context).textTheme.subtitle2,
        decoration: InputDecoration(
          focusColor: focusColor == null ? Colors.transparent : focusColor,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: borderColor ?? Colors.transparent, width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
                color: borderColor ?? Colors.transparent, width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: focusColor ?? Colors.transparent, width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
          ),
          // enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          hintText: this.hint,
          hintStyle:
              Theme.of(context).textTheme.bodyText1!.copyWith(color: hintColor),
          errorText: errorText,
          counterText: '',
          icon: this.isIcon ? Icon(this.icon, color: iconColor) : null,
        ),
      ),
    );
  }

  const TextFormFieldWidget({
    Key? key,
    this.icon,
    this.errorText,
    this.focusColor,
    this.maxLines,
    this.maxLength,
    this.borderColor,
    required this.textController,
    this.inputType,
    this.hint,
    this.isObscure = false,
    this.isIcon = true,
    this.padding = const EdgeInsets.all(0),
    this.hintColor = Colors.grey,
    this.iconColor = Colors.grey,
    this.focusNode,
    this.onFieldSubmitted,
    this.onChanged,
    this.autoFocus = false,
    this.inputAction,
  }) : super(key: key);
}
