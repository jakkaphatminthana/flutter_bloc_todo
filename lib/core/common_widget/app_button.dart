import 'package:flutter/material.dart';
import 'package:flutter_bloc_todo/core/theme/app_color.dart';
import 'package:flutter_bloc_todo/core/theme/text_styles.dart';

class AppButton extends StatelessWidget {
  final Function()? onClick;
  final Color color;
  final String? text;
  final Color textColor;
  final bool? isEnabled;
  final double? padding;
  final double? radius;
  final bool isOutlinedButton;
  final bool? loading;
  final Widget? icon;

  const AppButton({
    Key? key,
    required this.onClick,
    required this.color,
    required this.text,
    this.textColor = Colors.white,
    this.isEnabled = true,
    this.padding,
    this.isOutlinedButton = false,
    this.icon,
    this.loading = false,
    this.radius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isOutlinedButton) {
      return OutlinedButton(
        onPressed: isEnabled! ? onClick : null,
        style: OutlinedButton.styleFrom(
          elevation: 0,
          side: BorderSide(color: isEnabled! ? color : AppColor.gray3, width: 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius ?? 16),
          ),
          padding: EdgeInsets.all(padding ?? 16),
        ),
        child: Text(
          text ?? '',
          textAlign: TextAlign.center,
          style: AppCustomTextStyle.body1().merge(
            TextStyle(
              color: isEnabled! ? textColor : textColor.withOpacity(0.2),
            ),
          ),
        ),
      );
    } else {
      return ElevatedButton(
        onPressed: isEnabled! ? onClick : null,
        style: ElevatedButton.styleFrom(
            backgroundColor: color,
            elevation: 0,
            disabledBackgroundColor: color.withOpacity(0.5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius ?? 16),
            ),
            padding: EdgeInsets.all(padding ?? 16)),
        child: Stack(
          children: [
            Opacity(
              opacity: loading! ? 0 : 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (icon != null)
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: icon!,
                    ),
                  FittedBox(
                    child: Text(
                      text ?? '',
                      style: AppCustomTextStyle.body1().merge(
                        TextStyle(color: textColor),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            if (loading!)
              Positioned.fill(
                child: Container(
                  // color: color,
                  alignment: Alignment.center,
                  child: const AspectRatio(
                    aspectRatio: 1,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            // FittedBox(fit: BoxFit.scaleDown, child: CircularProgressIndicator())
          ],
        ),
      );
    }
  }
}
