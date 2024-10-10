import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../app_colors.dart';
import '../app_textstyles.dart';

class TextFieldWidget extends StatefulWidget {
  final TextEditingController controller;
  final TextInputType textInputType;
  final List<TextInputFormatter>? inputFormatters;
  final Function? validator;
  final String? label;
  final int? minLines;
  final double? borderRadius;
  final int? maxLines;
  final bool? obscureText;
  final TextInputAction? textInputAction;
  final String? hintText;
  final TextCapitalization textCapitalization;
  final Function? onTap;
  final Function? onEditingComplete;
  final Function? onChanged;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final int? maxLength;
  final double? height;
  final bool? readOnly;
  final FocusNode? focusNode;
  final Color? borderSideColor;
  final bool? isPasswordField;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final bool isFloatingLabel;
  final TextStyle? hintStyle;
  final InputBorder? border;
  final Color? fillColor;
  final InputBorder? errorBorder, disabledBorder, enabledBorder;
  final String? counterText;
  final String obscuringCharacter;
  final List<BoxShadow>? boxShadow;
  final bool autocorrect;
  final TextStyle? counterTextStyle;
  final bool isTopCounter;
  final TextStyle? textStyle;
  final double? horizontalPadding;
  final double? verticalPadding;
  const TextFieldWidget({
    super.key,
    required this.controller,
    required this.textInputType,
    this.obscureText,
    this.validator,
    this.minLines,
    this.maxLines,
    this.suffixIcon,
    this.textInputAction,
    this.inputFormatters,
    this.hintText,
    this.onTap,
    this.onChanged,
    this.textCapitalization = TextCapitalization.sentences,
    this.label,
    this.onEditingComplete,
    this.prefixIcon,
    this.borderRadius,
    this.maxLength,
    this.readOnly,
    this.focusNode,
    this.borderSideColor,
    this.isPasswordField = false,
    this.height,
    this.floatingLabelBehavior,
    this.isFloatingLabel = true,
    this.hintStyle,
    this.border,
    this.fillColor,
    this.errorBorder,
    this.disabledBorder,
    this.enabledBorder,
    this.counterText = '',
    this.counterTextStyle,
    this.isTopCounter = true,
    this.obscuringCharacter = '*',
    this.boxShadow,
    this.autocorrect = false,
    this.textStyle,
    this.horizontalPadding,
    this.verticalPadding,
  });

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: widget.boxShadow,
      ),
      height: widget.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //added this to create a label that sits above the  text field
          //allows the widget to be reused in cases of the flutter default TextField label behaviour
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              if (widget.isFloatingLabel && widget.label != null)
                Text(
                  widget.label!,
                  style: AppTextstyles.bodyRegular,
                ),
              const Spacer(),
              if (widget.counterText!.isNotEmpty &&
                  widget.counterText != '' &&
                  widget.isTopCounter == true)
                Text(
                  widget.counterText!,
                  style: widget.counterTextStyle,
                ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          TextFormField(
            // inputFormatters: widget.inputFormatter,
            focusNode: widget.focusNode,
            onTap: widget.onTap as void Function()?,
            onChanged: widget.onChanged as void Function(String)? ??
                (_) {
                  setState(() {});
                },
            obscureText: widget.obscureText ?? false,
            obscuringCharacter: widget.obscuringCharacter,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            //style: TextStyle(fontSize: 12),
            minLines: widget.minLines ?? 1,
            maxLines: widget.maxLines ?? 1,
            controller: widget.controller,
            autocorrect: widget.autocorrect,
            onEditingComplete: widget.onEditingComplete as void Function()?,
            inputFormatters: widget.inputFormatters,
            // == null ? [] : [widget.inputFormatter!],
            textCapitalization: widget.textCapitalization,
            validator: widget.validator as String? Function(String?)?,
            cursorColor: appGreyText,
            keyboardType: widget.textInputType,
            textInputAction: widget.textInputAction,
            style: widget.textStyle ??
                AppTextstyles.bodyRegular.copyWith(
                  fontWeight: FontWeight.w500,
                ),

            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                  horizontal: widget.horizontalPadding ?? 16,
                  vertical: widget.verticalPadding ?? 14),
              errorMaxLines: 4,
              suffixIcon: widget.suffixIcon,
              filled: true,
              fillColor: widget.fillColor ?? appTextFieldGrey,
              hintText: widget.hintText,
              hintStyle: widget.hintStyle ?? AppTextstyles.hintText,
              prefixIcon: widget.prefixIcon,
              labelText: widget.isFloatingLabel ? null : widget.label,
              floatingLabelBehavior: widget.floatingLabelBehavior,
              // floatingLabelAlignment: ,
              labelStyle: AppTextstyles.bodyRegular,
              border: widget.border ??
                  OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(widget.borderRadius ?? 8),
                    borderSide: BorderSide(
                      color: widget.borderSideColor ?? appTextFieldGrey,
                      width: 1,
                    ),
                  ),
              focusedBorder: widget.border ??
                  OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(widget.borderRadius ?? 8),
                    borderSide: BorderSide(
                      color: widget.borderSideColor ?? appWhite,
                      width: 1,
                    ),
                  ),
              enabledBorder: widget.enabledBorder ??
                  widget.border ??
                  OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(widget.borderRadius ?? 8),
                    borderSide: BorderSide(
                      color: widget.borderSideColor ?? appTextFieldGrey,
                      width: 1,
                    ),
                  ),
              disabledBorder: widget.disabledBorder ??
                  OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(widget.borderRadius ?? 8),
                    ),
                    borderSide:
                        const BorderSide(width: 1, color: appTransparent),
                  ),
              errorBorder: widget.errorBorder ??
                  widget.border ??
                  OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(widget.borderRadius ?? 8),
                    ),
                    borderSide: const BorderSide(width: 1, color: appRed),
                  ),
              // focusedErrorBorder: OutlineInputBorder(
              //     borderRadius: BorderRadius.all(
              //         Radius.circular(widget.borderRadius ?? 30.0)),
              //     borderSide:
              //     const BorderSide(width: 1.5, color: Colors.redAccent)),
              counterText: widget.isTopCounter ? '' : widget.counterText,
              counterStyle: widget.counterTextStyle ??
                  const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: appWhite,
                  ),

              /// Except counter text is added to any field in design
            ),
            maxLength: widget.maxLength,
            readOnly: widget.readOnly ?? false,
          ),
        ],
      ),
    );
  }
}
