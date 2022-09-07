import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MeWordTextWidget extends StatelessWidget {
  const MeWordTextWidget({
    Key? key,
    required this.hintText,
    this.label,
    this.obscureText,
    required this.textInputType,
    this.validator,
    required this.controller,
    required this.textInputAction,
    this.inputFormatters,
    this.textAlign,
    this.onChanged,
    this.initialValue,
    this.suffixIcon,
  }) : super(key: key);

  final String hintText;
  final String? label, initialValue;
  final bool? obscureText;
  final TextInputType textInputType;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? inputFormatters;
  final TextAlign? textAlign;
  final void Function(String)? onChanged;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(),
      inputFormatters: inputFormatters,
      textAlign: textAlign ?? TextAlign.start,
      validator: validator,
      initialValue: initialValue,
      keyboardType: textInputType,
      obscureText: obscureText ?? false,
      controller: controller,
      onChanged: onChanged,
      cursorColor: Colors.purple,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      textInputAction: textInputAction,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 16,
        ),
        hintText: hintText,
        hintStyle: const TextStyle(),
        filled: true,
        fillColor: Colors.grey.withOpacity(
          0.08,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.purple,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.purple,
          ),
        ),
        disabledBorder: InputBorder.none,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            10,
          ),
          borderSide: BorderSide.none,
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.red.withOpacity(0.4),
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.red.withOpacity(0.4),
          ),
        ),
        errorStyle: const TextStyle(),
        suffixIcon: suffixIcon ?? const SizedBox.shrink(),
      ),
    );
  }
}

class MeWordTextWidgetWeb extends StatelessWidget {
  const MeWordTextWidgetWeb({
    Key? key,
    required this.hintText,
    this.label,
    required this.obscureText,
    required this.textInputType,
    required this.validator,
    required this.controller,
    required this.textInputAction,
    this.inputFormatters,
    this.textAlign,
    this.onChanged,
    this.initialValue,
    this.suffixIcon,
  }) : super(key: key);

  final String hintText;
  final String? label, initialValue;
  final bool obscureText;
  final TextInputType textInputType;
  final String? Function(String?) validator;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? inputFormatters;
  final TextAlign? textAlign;
  final void Function(String)? onChanged;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(),
      inputFormatters: inputFormatters,
      textAlign: textAlign ?? TextAlign.start,
      validator: validator,
      initialValue: initialValue,
      keyboardType: textInputType,
      obscureText: obscureText,
      controller: controller,
      onChanged: onChanged,
      cursorColor: Colors.purple,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      textInputAction: textInputAction,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 16,
        ),
        hintText: hintText,
        hintStyle: const TextStyle(),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.purple,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.purple,
          ),
        ),
        disabledBorder: InputBorder.none,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.grey,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.red.withOpacity(0.4),
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.red.withOpacity(0.4),
          ),
        ),
        errorStyle: const TextStyle(),
        suffixIcon: suffixIcon ?? const SizedBox.shrink(),
      ),
    );
  }
}

class MeWordTextWidgetMultiline extends StatelessWidget {
  const MeWordTextWidgetMultiline({
    Key? key,
    required this.hintText,
    required this.textInputType,
    required this.controller,
    required this.textInputAction,
  }) : super(key: key);
  final String hintText;
  final TextInputType textInputType;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(),
      keyboardType: textInputType,
      controller: controller,
      textInputAction: textInputAction,
      maxLines: 5,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
          hintText: hintText,
          hintStyle: const TextStyle(),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.grey,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.purple,
            ),
          ),
          disabledBorder: InputBorder.none,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Colors.red.withOpacity(0.4),
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Colors.red.withOpacity(0.4),
            ),
          ),
          errorStyle: const TextStyle()),
    );
  }
}

class MeWordTextFormField extends StatelessWidget {
  const MeWordTextFormField(
      {Key? key, required this.label, required this.textfield})
      : super(key: key);
  final String label;
  final Widget textfield;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 14,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(),
          ),
          const SizedBox(height: 12),
          textfield,
        ],
      ),
    );
  }
}
