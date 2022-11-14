import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HtmlWidget extends StatelessWidget {
  const HtmlWidget({
    super.key,
    required this.postContent,
    this.color = Colors.red,
  });

  final String postContent;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Html(
      data: postContent,
      onLinkTap: (s, _, __, ___) {},
      onImageTap: (s, _, __, ___) {},
      style: {
        'embed': Style(
          fontSize: FontSize(13.sp),
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.bold,
        ),
        'strong': Style(fontSize: FontSize(14.sp)),
        'a': Style(width: 0, height: 0, fontSize: const FontSize(0)),
        'p': Style(
          fontSize: FontSize(15.sp),
          textAlign: TextAlign.justify,
        ),
        'div': Style(
          fontSize: FontSize(12.sp),
          textAlign: TextAlign.justify,
        ),
        'figure': Style(
          fontSize: FontSize(12.sp),
          padding: EdgeInsets.zero,
          margin: EdgeInsets.zero,
          textAlign: TextAlign.justify,
        ),
        'h1': Style(
          fontSize: FontSize(
            12.sp,
          ),
          textAlign: TextAlign.justify,
        ),
        'h2': Style(
          fontSize: FontSize(14.sp),
          textAlign: TextAlign.justify,
        ),
        'h3': Style(
          fontSize: FontSize(13.sp),
          textAlign: TextAlign.justify,
        ),
        'h4': Style(
          fontSize: FontSize(12.sp),
          textAlign: TextAlign.justify,
        ),
        'h5': Style(
          fontSize: FontSize(11.sp),
        ),
        'h6': Style(
          fontSize: FontSize(10.sp),
        ),
        'ol': Style(
          fontSize: FontSize(12.sp),
          textAlign: TextAlign.justify,
        ),
        'ul': Style(
          fontSize: FontSize(12.sp),
          textAlign: TextAlign.justify,
        ),
        'strike': Style(
          fontSize: FontSize(12.sp),
        ),
        'u': Style(
          fontSize: FontSize(12.sp),
        ),
        'b': Style(
          fontSize: FontSize(12.sp),
          textAlign: TextAlign.justify,
        ),
        'i': Style(
          fontSize: FontSize(12.sp),
        ),
        'hr': Style(
          fontSize: FontSize(12.sp),
        ),
        'header': Style(
          fontSize: FontSize(12.sp),
        ),
        'code': Style(
          fontSize: FontSize(12.sp),
        ),
        'data': Style(
          fontSize: FontSize(12.sp),
        ),
        'body': Style(
          fontSize: FontSize(12.sp),
        ),
        'big': Style(
          fontSize: FontSize(12.sp),
        ),
        'blockquote': Style(
          fontSize: FontSize(12.sp),
        ),
        'audio': Style(
          fontSize: FontSize(12.sp),
        ),
        'img': Style(
          padding: const EdgeInsets.only(bottom: 8),
        ),
      },
    );
  }
}
