import 'package:collection/collection.dart';
import 'package:creatu_exam/core/di/dependency_injections.dart';
import 'package:creatu_exam/core/extensions/strings_extensions.dart';
import 'package:creatu_exam/core/helper/helper.dart';
import 'package:creatu_exam/core/loader/loading_screen.dart';
import 'package:creatu_exam/features/exams/data/models/save_result_drift_model.dart';
import 'package:creatu_exam/features/exams/presentation/bloc/exams_bloc.dart';
import 'package:creatu_exam/features/exams/presentation/pages/take_exam_page.dart';
import 'package:creatu_exam/features/exams/presentation/pages/take_exam_pageview.dart';
import 'package:creatu_exam/features/exams/presentation/widgets/custom_title_value.dart';
import 'package:creatu_exam/features/exams/presentation/widgets/email_field_dialog.dart';
import 'package:creatu_exam/res/app_colors.dart';
import 'package:creatu_exam/res/app_styles.dart';
import 'package:creatu_exam/widgets/custom_appbar.dart';
import 'package:creatu_exam/widgets/custom_decoratedbox.dart';
import 'package:creatu_exam/widgets/custom_error_widget.dart';
import 'package:creatu_exam/widgets/title_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExamPage extends StatelessWidget {
  const ExamPage({super.key, this.courseId});

  final int? courseId;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<ExamsBloc>()
            ..add(
              FetchFirebaseExamEvent(
                courseId: courseId,
              ),
            ),
        ),
        BlocProvider<RegisterExamBloc>(
          create: (context) => getIt<RegisterExamBloc>(),
        ),
      ],
      child: const _ExamListView(),
    );
  }
}

class _ExamListView extends StatefulWidget {
  const _ExamListView();

  @override
  State<_ExamListView> createState() => _ExamListViewState();
}

class _ExamListViewState extends State<_ExamListView> {
  @override
  void initState() {
    super.initState();
  }

  bool Function(dynamic e1, dynamic e2) unOrdDeepEq =
      const DeepCollectionEquality.unordered().equals;

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterExamBloc, ExamsState>(
      listener: (context, registerState) {
        if (registerState is ExamsLoading) {
          LoadingScreen.instance().show(
            context: context,
            text: 'Loading',
          );
        } else if (registerState is RegisterSuccessState) {
          LoadingScreen.instance().hide();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return TakeExamPageView(
                  examData: registerState.sucessData,
                  email: registerState.email,
                );
              },
            ),
          );
        } else if (registerState is ExamsErrorState) {
          LoadingScreen.instance().hide();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('${registerState.errors.message}')),
          );
        }
      },
      child: Scaffold(
        appBar: const CustomAppBar(title: 'Exams'),
        body: BlocBuilder<ExamsBloc, ExamsState>(
          buildWhen: (pre, state) {
            // if (state is ExamsDataState && pre is ExamsDataState) {
            //   return unOrdDeepEq(state.data, state.data);
            // }
            return true;
          },
          builder: (context, state) {
            if (state is ExamsLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is ExamsDataState) {
              return RefreshIndicator(
                onRefresh: () async {
                  context.read<ExamsBloc>().add(const FetchFirebaseExamEvent());
                },
                child: CustomScrollView(
                  slivers: [
                    SliverPadding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      sliver: SliverToBoxAdapter(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            SizedBox(
                              height: 15,
                            ),
                            CourseTitleWidget(title: 'Upcoming Exams'),
                            SizedBox(
                              height: 5,
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (state.data.isEmpty)
                      const SliverToBoxAdapter(
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 8,
                            ),
                            child: Text('No Exams Found'),
                          ),
                        ),
                      ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 5,
                            ),
                            child: SizedBox(
                              width: double.infinity,
                              child: CustomDecoratedBox(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 15,
                                    vertical: 10,
                                  ),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            flex: 3,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                CourseTitleWidget(
                                                  title:
                                                      state.data[index].title ??
                                                          '',
                                                ),
                                                TitleValueWidget(
                                                  title: 'Date',
                                                  value:
                                                      '${state.data[index].examSchedule.getDateFromString()}',
                                                ),
                                                TitleValueWidget(
                                                  title: 'Time',
                                                  value:
                                                      '${state.data[index].examSchedule.getTimeFromString()}',
                                                ),
                                                const Text(
                                                  'Description :- ',
                                                  style: TextStyle(
                                                    fontFamily:
                                                        AppStyles.kFontOpenSans,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 16,
                                                  ),
                                                ),
                                                Text(
                                                  (state.data[index]
                                                              .description ??
                                                          '')
                                                      .htmlToShortText(),
                                                )
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child: Image.network(
                                              state.data[index].thumbnail ??
                                                  'https://tinyurl.com/2nyyk86z',
                                              height: 100,
                                            ),
                                          ),
                                        ],
                                      ),
                                      if (Helper.isExamRunning(
                                        datetime:
                                            state.data[index].examSchedule,
                                        duration:
                                            state.data[index].examDuration,
                                      ))
                                        BlocBuilder<RegisterExamBloc,
                                            ExamsState>(
                                          builder: (context, registerState) {
                                            return ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    AppColors.kPrimaryColor,
                                                minimumSize: Size.zero,
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                  vertical: 8,
                                                  horizontal: 20,
                                                ),
                                              ),
                                              onPressed: registerState
                                                      is ExamsLoading
                                                  ? null
                                                  : () {
                                                      getIt<MyExamDatabase>()
                                                          .getQuestionIdList(1);
                                                      showDialog(
                                                        context: context,
                                                        builder: (c) {
                                                          return BlocProvider
                                                              .value(
                                                            value: BlocProvider.of<
                                                                RegisterExamBloc>(
                                                              context,
                                                            ),
                                                            child:
                                                                CheckEmailDialog(
                                                              examId: state
                                                                  .data[index]
                                                                  .id!,
                                                            ),
                                                          );
                                                        },
                                                      );
                                                    },
                                              child: const Text(
                                                'Join Exam',
                                              ),
                                            );
                                          },
                                        )
                                      else
                                        const SizedBox()
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                        childCount: state.data.length,
                      ),
                    ),
                    // const SliverPadding(
                    //   padding: EdgeInsets.symmetric(
                    //     horizontal: 20,
                    //     vertical: 5,
                    //   ),
                    //   sliver: SliverToBoxAdapter(
                    //     child: CourseTitleWidget(title: 'Exams for this Course'),
                    //   ),
                    // ),
                    // SliverPadding(
                    //   padding: const EdgeInsets.symmetric(
                    //     horizontal: 20,
                    //   ),
                    //   sliver: SliverList(
                    //     delegate: SliverChildBuilderDelegate(
                    //       (context, index) {
                    //         return Padding(
                    //           padding: const EdgeInsets.symmetric(
                    //             vertical: 5,
                    //           ),
                    //           child: CustomDecoratedBox(
                    //             color: index < 3
                    //                 ? AppColors.kPrimaryColor.withOpacity(0.1)
                    //                 : AppColors.kWhiteColor,
                    //             child: InkWell(
                    //               onTap: () {
                    //                 Navigator.push(
                    //                   context,
                    //                   MaterialPageRoute(
                    //                     builder: (context) {
                    //                       return const ExamDetailPage();
                    //                     },
                    //                   ),
                    //                 );
                    //               },
                    //               child: Padding(
                    //                 padding: const EdgeInsets.symmetric(
                    //                   horizontal: 20,
                    //                   vertical: 15,
                    //                 ),
                    //                 child: Column(
                    //                   crossAxisAlignment:
                    //                       CrossAxisAlignment.start,
                    //                   children: [
                    //                     const CourseNameTile(
                    //                       title:
                    //                           'Bibendum sit rutrum felis ac uta massa.',
                    //                     ),
                    //                     const TitleValueWidget(
                    //                       title: 'Date',
                    //                       value: '12/5/2022',
                    //                     ),
                    //                     const TitleValueWidget(
                    //                       title: 'Time',
                    //                       value: '01:20',
                    //                     ),
                    //                     const TitleValueWidget(
                    //                       title: 'Topic Covered',
                    //                       value: '1 Lorem, Ipsum, Bibendum',
                    //                     ),
                    //                     const SizedBox(
                    //                       height: 10,
                    //                     ),
                    //                     if (index < 3)
                    //                       Align(
                    //                         alignment: Alignment.bottomCenter,
                    //                         child: Row(
                    //                           mainAxisAlignment:
                    //                               MainAxisAlignment.center,
                    //                           children: const [
                    //                             Text(
                    //                               'View Results',
                    //                               style: TextStyle(
                    //                                 color:
                    //                                     AppColors.kPrimaryColor,
                    //                                 fontFamily:
                    //                                     AppStyles.kFontOpenSans,
                    //                                 fontWeight: FontWeight.bold,
                    //                                 fontSize: 14,
                    //                               ),
                    //                             ),
                    //                           ],
                    //                         ),
                    //                       ),
                    //                   ],
                    //                 ),
                    //               ),
                    //             ),
                    //           ),
                    //         );
                    //       },
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              );
            } else if (state is ExamsErrorState) {
              return CustomErrorWidget(
                message: state.errors.message ?? '',
                onPressed: () {
                  context.read<ExamsBloc>().add(const FetchFirebaseExamEvent());
                },
              );
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }
}
