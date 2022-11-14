// import 'dart:async';
// import 'dart:convert';

// import 'package:flutter/services.dart';
// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart' as pw;
// import 'package:pdf/widgets.dart';
// import 'package:printing/printing.dart';
// import 'package:creatu_exam/core/extensions/strings_extensions.dart';

// import 'package:creatu_exam/features/exams/data/models/exam_model.dart';

// const PdfColor green = PdfColor.fromInt(0xff9ce5d0);
// const PdfColor lightGreen = PdfColor.fromInt(0xffcdf1e7);
// const PdfColor golden = PdfColor.fromInt(0xffFFD700);
// const sep = 120.0;

// Future<Uint8List> generateResult({
//   required PdfPageFormat format,
//   required ExamModel data,
//   required Map<int, String?> questionAnswer,
//   required String marksObtained,
//   required int totalMarks,
// }) async {
//   final doc = pw.Document(title: 'Smart GK', author: 'creatu_exam.com');

//   final profileImage = pw.MemoryImage(
//     (await rootBundle.load('assets/icons/apple_logo.png')).buffer.asUint8List(),
//   );
//   final fontData =
//       (await rootBundle.load('assets/fonts/bishal.ttf')).buffer.asUint8List();
//   final font = pw.Font.ttf(fontData.buffer.asByteData());
// //assets/fonts/kantipur.TTF
//   final pageTheme = await _myPageTheme(format);

//   doc.addPage(
//     pw.MultiPage(
//       pageTheme: pageTheme,
//       build: (pw.Context context) => [
//         pw.Partitions(
//           children: [
//             pw.Partition(
//               child: pw.Column(
//                 crossAxisAlignment: pw.CrossAxisAlignment.start,
//                 children: <pw.Widget>[
//                   pw.Row(
//                     children: [
//                       pw.Expanded(
//                         child: pw.Column(
//                           crossAxisAlignment: pw.CrossAxisAlignment.start,
//                           children: [
//                             pw.Align(
//                               alignment: pw.Alignment.centerLeft,
//                               child: pw.Row(
//                                 children: [
//                                   _Category(
//                                     title: 'Exam ID: ${data.id ?? ''}',
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             pw.Align(
//                               alignment: pw.Alignment.centerLeft,
//                               child: _Category(
//                                 title: data.title ?? '',
//                               ),
//                             ),
//                             pw.Table(
//                               children: <pw.TableRow>[
//                                 pw.TableRow(
//                                   children: [
//                                     pw.Text('Total Marks:'),
//                                     pw.Text('$totalMarks'),
//                                   ],
//                                 ),
//                                 pw.TableRow(
//                                   children: [
//                                     pw.Text('Marks Obtainded:'),
//                                     pw.Text(marksObtained),
//                                   ],
//                                 ),
//                               ],
//                             )
//                           ],
//                         ),
//                       ),
//                       pw.Container(
//                         width: 100,
//                         color: lightGreen,
//                         child: pw.Image(profileImage),
//                       ),
//                     ],
//                   ),
//                   pw.SizedBox(height: 20),
//                   for (Question question in data.questions ?? [])
//                     pw.Column(
//                       crossAxisAlignment: pw.CrossAxisAlignment.start,
//                       children: <pw.Widget>[
//                         _Block(
//                           title:
//                               (question.question?.question ?? '').htmlToText(),
//                           index: data.questions?.indexOf(question) ?? 0,
//                           font: font,
//                         ),
//                         pw.SizedBox(height: 10),
//                         _RadioTileBlock(
//                           font: font,
//                           title: 'Answer',
//                           questionData: question,
//                           selectedAnswer: questionAnswer[question.question?.id],
//                         ),
//                         pw.SizedBox(height: 15),
//                       ],
//                     ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ],
//     ),
//   );
//   return doc.save();
// }

// Future<pw.PageTheme> _myPageTheme(PdfPageFormat format) async {
//   final bgShape = pw.MemoryImage(
//     (await rootBundle.load('assets/icons/apple_logo.png')).buffer.asUint8List(),
//   );

//   format = format.applyMargin(
//     left: 2.0 * PdfPageFormat.cm,
//     top: 4.0 * PdfPageFormat.cm,
//     right: 2.0 * PdfPageFormat.cm,
//     bottom: 2.0 * PdfPageFormat.cm,
//   );
//   return pw.PageTheme(
//     pageFormat: format,
//     theme: pw.ThemeData.withFont(
//       base: await PdfGoogleFonts.openSansRegular(),
//       bold: await PdfGoogleFonts.openSansBold(),
//       icons: await PdfGoogleFonts.materialIcons(),
//     ),
//     buildBackground: (pw.Context context) {
//       return pw.FullPage(
//         ignoreMargins: true,
//         child: pw.Stack(
//           children: [
//             pw.Align(
//               child: pw.Image(bgShape, height: 40),
//             ),
//             // pw.Positioned(
//             //   child: pw.Transform.rotate(angle: pi, child: pw.Image(bgShape)),
//             //   right: 0,
//             //   bottom: 0,
//             // ),
//           ],
//         ),
//       );
//     },
//   );
// }

// class _Block extends pw.StatelessWidget {
//   _Block({
//     required this.title,
//     required this.index,
//     required this.font,
//   });

//   final String title;
//   final int index;
//   final Font font;

//   // final pw.IconData? icon;

//   @override
//   pw.Widget build(pw.Context context) {
//     return pw.Column(
//       crossAxisAlignment: pw.CrossAxisAlignment.start,
//       children: <pw.Widget>[
//         pw.Row(
//           children: <pw.Widget>[
//             pw.Container(
//               child: pw.Text('$index . '),
//             ),
//             pw.Expanded(
//               child: pw.Text(
//                 title,
//                 style: pw.TextStyle(
//                   font: font,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }

// class _RadioTileBlock extends pw.StatelessWidget {
//   _RadioTileBlock({
//     required this.title,
//     required this.questionData,
//     required this.selectedAnswer,
//     required this.font,
//   });

//   final String title;
//   final Question questionData;
//   final Font font;
//   final String? selectedAnswer;

//   String? decodeCorrectOption(String? key, Question answer) {
//     final decode = utf8.decode(base64.decode(key ?? ''));
//     if (decode.split('-')[1] == 'al') {
//       return answer.question?.answer1;
//     } else if (decode.split('-')[1] == 'bi') {
//       return answer.question?.answer2;
//     } else if (decode.split('-')[1] == 'ga') {
//       return answer.question?.answer3;
//     } else if (decode.split('-')[1] == 'th') {
//       return answer.question?.answer4;
//     }
//     return null;
//   }

//   @override
//   pw.Widget build(pw.Context context) {
//     return pw.Column(
//       children: [
//         pw.Container(
//           decoration: pw.BoxDecoration(
//             borderRadius: pw.BorderRadius.circular(10),
//             color: questionData.question!.answer1 ==
//                     decodeCorrectOption(
//                       questionData.question!.key,
//                       questionData,
//                     )
//                 ? const PdfColor.fromInt(0xff9ED263)
//                 : selectedAnswer == questionData.question!.answer1
//                     ? PdfColors.red
//                     : null,
//             border: pw.Border.all(
//               color: PdfColors.grey400,
//             ),
//           ),
//           child: pw.Padding(
//             padding: const pw.EdgeInsets.symmetric(
//               horizontal: 20,
//               vertical: 10,
//             ),
//             child: pw.Row(
//               crossAxisAlignment: pw.CrossAxisAlignment.start,
//               children: <pw.Widget>[
//                 pw.Expanded(
//                   child: pw.Text(
//                     questionData.question!.answer1 ?? '',
//                     style: pw.Theme.of(context).defaultTextStyle.copyWith(
//                           fontWeight: pw.FontWeight.normal,
//                           font: font,
//                         ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         pw.SizedBox(height: 5),
//         pw.Container(
//           decoration: pw.BoxDecoration(
//             borderRadius: pw.BorderRadius.circular(10),
//             color: questionData.question!.answer2 ==
//                     decodeCorrectOption(
//                       questionData.question!.key,
//                       questionData,
//                     )
//                 ? const PdfColor.fromInt(0xff9ED263)
//                 : selectedAnswer == questionData.question!.answer2
//                     ? PdfColors.red
//                     : null,
//             border: pw.Border.all(
//               color: PdfColors.grey400,
//             ),
//           ),
//           child: pw.Padding(
//             padding: const pw.EdgeInsets.symmetric(
//               horizontal: 20,
//               vertical: 10,
//             ),
//             child: pw.Row(
//               crossAxisAlignment: pw.CrossAxisAlignment.start,
//               children: <pw.Widget>[
//                 pw.Expanded(
//                   child: pw.Text(
//                     questionData.question!.answer2 ?? '',
//                     style: pw.Theme.of(context).defaultTextStyle.copyWith(
//                           fontWeight: pw.FontWeight.normal,
//                         ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         pw.SizedBox(height: 5),
//         pw.Container(
//           decoration: pw.BoxDecoration(
//             borderRadius: pw.BorderRadius.circular(10),
//             color: questionData.question!.answer3 ==
//                     decodeCorrectOption(
//                       questionData.question!.key,
//                       questionData,
//                     )
//                 ? const PdfColor.fromInt(0xff9ED263)
//                 : selectedAnswer == questionData.question!.answer3
//                     ? PdfColors.red
//                     : null,
//             border: pw.Border.all(
//               color: PdfColors.grey400,
//             ),
//           ),
//           child: pw.Padding(
//             padding: const pw.EdgeInsets.symmetric(
//               horizontal: 20,
//               vertical: 10,
//             ),
//             child: pw.Row(
//               crossAxisAlignment: pw.CrossAxisAlignment.start,
//               children: <pw.Widget>[
//                 pw.Expanded(
//                   child: pw.Text(
//                     questionData.question!.answer3 ?? '',
//                     style: pw.Theme.of(context).defaultTextStyle.copyWith(
//                           fontWeight: pw.FontWeight.normal,
//                         ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         pw.SizedBox(height: 5),
//         pw.Container(
//           decoration: pw.BoxDecoration(
//             borderRadius: pw.BorderRadius.circular(10),
//             color: questionData.question!.answer4 ==
//                     decodeCorrectOption(
//                       questionData.question!.key,
//                       questionData,
//                     )
//                 ? const PdfColor.fromInt(0xff9ED263)
//                 : selectedAnswer == questionData.question!.answer4
//                     ? PdfColors.red
//                     : null,
//             border: pw.Border.all(
//               color: PdfColors.grey400,
//             ),
//           ),
//           child: pw.Padding(
//             padding: const pw.EdgeInsets.symmetric(
//               horizontal: 20,
//               vertical: 10,
//             ),
//             child: pw.Row(
//               crossAxisAlignment: pw.CrossAxisAlignment.start,
//               children: <pw.Widget>[
//                 pw.Expanded(
//                   child: pw.Text(
//                     questionData.question!.answer4 ?? '',
//                     style: pw.Theme.of(context).defaultTextStyle.copyWith(
//                           fontWeight: pw.FontWeight.normal,
//                         ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

// class _Category extends pw.StatelessWidget {
//   _Category({required this.title});

//   final String title;

//   @override
//   pw.Widget build(pw.Context context) {
//     return pw.Container(
//       decoration: const pw.BoxDecoration(
//         // color: lightGreen,
//         borderRadius: pw.BorderRadius.all(pw.Radius.circular(6)),
//       ),
//       margin: const pw.EdgeInsets.only(bottom: 10, top: 20),
//       padding: const pw.EdgeInsets.fromLTRB(10, 4, 10, 4),
//       child: pw.Text(
//         title,
//         style: pw.TextStyle(
//           fontWeight: pw.FontWeight.bold,
//         ),
//         // textScaleFactor: 1.5,
//       ),
//     );
//   }
// }

// class _Percent extends pw.StatelessWidget {
//   _Percent(
//     this.fontSize,
//     this.color,
//     this.backgroundColor,
//     this.strokeWidth, {
//     required this.size,
//     required this.value,
//     required this.title,
//   });

//   final double size;

//   final double value;

//   final pw.Widget title;

//   final double fontSize;

//   final PdfColor color;

//   final PdfColor backgroundColor;

//   final double strokeWidth;

//   @override
//   pw.Widget build(pw.Context context) {
//     final widgets = <pw.Widget>[
//       pw.Container(
//         width: size,
//         height: size,
//         child: pw.Stack(
//           alignment: pw.Alignment.center,
//           fit: pw.StackFit.expand,
//           children: <pw.Widget>[
//             pw.Center(
//               child: pw.Text(
//                 '${(value * 100).round().toInt()}%',
//                 textScaleFactor: fontSize,
//               ),
//             ),
//             pw.CircularProgressIndicator(
//               value: value,
//               backgroundColor: backgroundColor,
//               color: color,
//               strokeWidth: strokeWidth,
//             ),
//           ],
//         ),
//       )
//     ];

//     widgets.add(title);

//     return pw.Column(children: widgets);
//   }
// }

// class _UrlText extends pw.StatelessWidget {
//   _UrlText(this.text, this.url);

//   final String text;
//   final String url;

//   @override
//   pw.Widget build(pw.Context context) {
//     return pw.UrlLink(
//       destination: url,
//       child: pw.Text(
//         text,
//         style: const pw.TextStyle(
//           decoration: pw.TextDecoration.underline,
//           color: PdfColors.blue,
//         ),
//       ),
//     );
//   }
// }
