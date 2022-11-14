import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:creatu_exam/res/app_colors.dart';

class CustomRadioListTile<T> extends StatelessWidget {
  const CustomRadioListTile({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    this.toggleable = false,
    this.activeColor,
    this.title,
    this.subtitle,
    this.isThreeLine = false,
    this.dense,
    this.secondary,
    this.selected = false,
    this.controlAffinity = ListTileControlAffinity.platform,
    this.autofocus = false,
    this.contentPadding,
    this.shape,
    this.tileColor,
    this.selectedTileColor,
    this.visualDensity,
    this.focusNode,
    this.enableFeedback,
  }) : assert(!isThreeLine || subtitle != null);

  final T value;

  final T? groupValue;

  final ValueChanged<T?>? onChanged;

  final bool toggleable;

  final Color? activeColor;

  final Widget? title;

  final Widget? subtitle;

  final Widget? secondary;

  final bool isThreeLine;

  final bool? dense;

  final bool selected;

  final ListTileControlAffinity controlAffinity;

  final bool autofocus;

  final EdgeInsetsGeometry? contentPadding;

  bool get checked => value == groupValue;

  final ShapeBorder? shape;

  final Color? tileColor;

  final Color? selectedTileColor;

  final VisualDensity? visualDensity;

  final FocusNode? focusNode;

  final bool? enableFeedback;

  @override
  Widget build(BuildContext context) {
    final Widget control = Radio<T>(
      value: value,
      groupValue: groupValue,
      onChanged: onChanged,
      toggleable: toggleable,
      activeColor: activeColor,
      fillColor: MaterialStateProperty.resolveWith((Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return AppColors.kWhiteColor;
        }
        if (states.contains(MaterialState.selected)) {
          return AppColors.kPrimaryColor;
        }
        return null;
      }),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      autofocus: autofocus,
    );
    Widget? leading, trailing;
    switch (controlAffinity) {
      case ListTileControlAffinity.leading:
      case ListTileControlAffinity.platform:
        leading = control;
        trailing = secondary;
        break;
      case ListTileControlAffinity.trailing:
        leading = secondary;
        trailing = control;
        break;
    }
    return MergeSemantics(
      child: ListTileTheme.merge(
        selectedColor: activeColor ?? Theme.of(context).toggleableActiveColor,
        child: ListTile(
          leading: leading,
          title: title,
          subtitle: subtitle,
          trailing: trailing,
          isThreeLine: isThreeLine,
          dense: dense,
          enabled: onChanged != null,
          shape: shape,
          tileColor: tileColor,
          selectedTileColor: selectedTileColor,
          onTap: onChanged != null
              ? () {
                  if (toggleable && checked) {
                    onChanged!(null);
                    return;
                  }
                  if (!checked) {
                    onChanged!(value);
                  }
                }
              : null,
          selected: selected,
          autofocus: autofocus,
          contentPadding: contentPadding,
          visualDensity: visualDensity,
          focusNode: focusNode,
          enableFeedback: enableFeedback,
        ),
      ),
    );
  }
}
