import 'package:flutter/material.dart';

/// Base text with black color and letter spacing set
class SqinTextBase extends StatelessWidget {
  SqinTextBase(
    this.text, {
    this.style,
    this.textAlign,
    this.overflow = TextOverflow.visible,
    this.maxLines,
  });
  final String text;
  final TextStyle style;
  final TextAlign textAlign;
  final TextOverflow overflow;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    assert(text != null);
    return Text(
      text ?? '',
      style: TextStyle(fontSize: 14, color: Colors.black).merge(style),
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
    );
  }
}

/// Main black bold text
class SqinTextBold extends SqinTextBase {
  SqinTextBold(
    String text, {
    TextStyle style,
    TextAlign textAlign,
    TextOverflow overflow,
    int maxLines,
  }) : super(
          text,
          style: TextStyle(
            fontFamily: 'Inter-Bold',
            fontSize: 18,
          ).merge(style),
          textAlign: textAlign,
          overflow: overflow,
          maxLines: maxLines,
        );
}

/// Semi-bold text
class SqinTextSemiBold extends SqinTextBase {
  SqinTextSemiBold(
    String text, {
    TextStyle style,
    TextAlign textAlign,
    TextOverflow overflow,
    int maxLines,
  }) : super(
          text,
          style: TextStyle(
            fontFamily: 'Inter-SemiBold',
          ).merge(style),
          textAlign: textAlign,
          overflow: overflow,
          maxLines: maxLines,
        );
}

/// Medium text
class SqinTextMedium extends SqinTextBase {
  SqinTextMedium(
    String text, {
    TextStyle style,
    TextAlign textAlign,
    TextOverflow overflow,
    int maxLines,
  }) : super(
          text,
          style: TextStyle(
            fontFamily: 'Inter-Medium',
          ).merge(style),
          textAlign: textAlign,
          overflow: overflow,
          maxLines: maxLines,
        );
}

/// Medium text
class SqinTextRegular extends SqinTextBase {
  SqinTextRegular(
    String text, {
    TextStyle style,
    TextAlign textAlign,
    TextOverflow overflow,
    int maxLines,
  }) : super(
          text,
          style: TextStyle(
            fontFamily: 'Inter-Regular',
          ).merge(style),
          textAlign: textAlign,
          overflow: overflow,
          maxLines: maxLines,
        );
}

// class TextBody extends TextRegular {
//   TextBody(
//     String text, {
//     TextStyle style,
//     TextAlign textAlign,
//     TextOverflow overflow,
//     int maxLines,
//     bool noHeight = true,
//   }) : super(
//           text,
//           overflow: overflow,
//           maxLines: maxLines,
//           style: TextStyle(
//             fontSize: 14,
//             color: Colors.black,
//           ).merge(style),
//           textAlign: textAlign,
//         );
// }

class H1 extends SqinTextBold {
  H1(
    String text, {
    TextStyle style,
    TextAlign textAlign,
    TextOverflow overflow,
    int maxLines,
    bool noHeight = true,
  }) : super(
          text,
          overflow: overflow,
          maxLines: maxLines,
          style: TextStyle(
            fontSize: 24,
            color: Colors.black,
          ).merge(style),
          textAlign: textAlign,
        );
}

class AgBodyText extends SqinTextRegular {
  AgBodyText(
    String text, {
    TextStyle style,
    TextAlign textAlign,
    TextOverflow overflow,
    int maxLines,
    Color color,
    bool noHeight = true,
  }) : super(
          text,
          overflow: overflow,
          maxLines: maxLines,
          style: TextStyle(
            fontSize: 12,
            color: color ?? Colors.black,
          ).merge(style),
          textAlign: textAlign,
        );
}

class AgHeader extends SqinTextBold {
  AgHeader(
    String text, {
    TextStyle style,
    TextAlign textAlign,
    TextOverflow overflow,
    Color color,
    int maxLines,
    bool noHeight = true,
  }) : super(
          text,
          overflow: overflow,
          maxLines: maxLines,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: color,
          ).merge(style),
          textAlign: textAlign,
        );
}

class AgSubHeader extends SqinTextSemiBold {
  AgSubHeader(
    String text, {
    TextStyle style,
    TextAlign textAlign,
    TextOverflow overflow,
    int maxLines,
    Color color,
    bool noHeight = true,
  }) : super(
          text,
          overflow: overflow,
          maxLines: maxLines,
          style: TextStyle(
            fontSize: 16,
            color: color ?? Colors.black,
            fontWeight: FontWeight.w500,
          ).merge(style),
          textAlign: textAlign,
        );
}

class AgButtontext extends SqinTextSemiBold {
  AgButtontext(
    String text, {
    TextStyle style,
    TextAlign textAlign,
    TextOverflow overflow,
    int maxLines,
    Color color,
    bool noHeight = true,
  }) : super(
          text,
          overflow: overflow,
          maxLines: maxLines,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: color ?? Colors.black,
          ).merge(style),
          textAlign: textAlign,
        );
}

class AgSmallText extends SqinTextRegular {
  AgSmallText(
    String text, {
    TextStyle style,
    TextAlign textAlign,
    TextOverflow overflow,
    Color color,
    int maxLines,
    bool noHeight = true,
  }) : super(
          text,
          overflow: overflow,
          maxLines: maxLines,
          style: TextStyle(
            fontSize: 10,
            color: color ?? Colors.black,
          ).merge(style),
          textAlign: textAlign,
        );
}
