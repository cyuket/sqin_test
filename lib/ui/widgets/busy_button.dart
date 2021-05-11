import 'package:flutter/material.dart';
import 'package:sqin/touchables/touchable_opacity.dart';
import 'package:sqin/ui/shared/style/colors.dart';
import 'package:sqin/ui/shared/style/fonts.dart';

/// A button that shows a busy indicator in place of title
class BusyButton extends StatefulWidget {
  final bool busy;
  final String title;
  final Function onPressed;
  final bool enabled, outline;
  final bool isDisabled;
  final Color color;
  final bool isSmall;
  const BusyButton({
    @required this.title,
    @required this.onPressed,
    this.busy = false,
    this.isDisabled = true,
    this.isSmall = false,
    this.color = SqinColors.primaryColor,
    this.enabled = true,
    this.outline = false,
  });

  @override
  _BusyButtonState createState() => _BusyButtonState();
}

class _BusyButtonState extends State<BusyButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.busy == false && widget.isDisabled == false
          ? widget.onPressed
          : null,
      child: TouchableOpacity(
        onTap: widget.onPressed,
        child: AnimatedContainer(
            height: widget.isSmall ? 28 : 52,
            // width: widget.busy ? 48 : null,
            duration: const Duration(milliseconds: 300),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: widget.color,
              borderRadius: BorderRadius.circular(15),
            ),
            child: AgButtontext(
              widget.title,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w800),
            )),
      ),
    );
  }
}
