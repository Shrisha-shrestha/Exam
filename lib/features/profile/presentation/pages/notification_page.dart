import 'package:creatu_exam/res/app_colors.dart';
import 'package:creatu_exam/res/app_styles.dart';
import 'package:creatu_exam/widgets/custom_appbar.dart';
import 'package:creatu_exam/widgets/title_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Notifications',
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return DecoratedBox(
                  decoration: const BoxDecoration(
                    color: AppColors.kWhiteColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                    ),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          children: [
                            const Expanded(
                              child: Text(
                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Urna proin donec quam lectus.',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: AppStyles.kFontOpenSans,
                                ),
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.more_vert),
                              onPressed: () {
                                showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: true,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                    ),
                                  ),
                                  builder: (context) {
                                    return const NotificationBottomSheet();
                                  },
                                );
                              },
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const SizedBox(
                          height: 1,
                          width: double.infinity,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: AppColors.kPrimaryColor,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class NotificationBottomSheet extends StatefulWidget {
  const NotificationBottomSheet({super.key});

  @override
  State<NotificationBottomSheet> createState() =>
      _NotificationBottomSheetState();
}

class _NotificationBottomSheetState extends State<NotificationBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 5,
        ),
        Align(
          child: SizedBox(
            height: 8,
            width: 0.3.sw,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: AppColors.kPrimaryColor,
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 15,
          ),
          child: CourseTitleWidget(title: 'Options'),
        ),
        const SizedBox(
          height: 8,
        ),
        SizedBox(
          height: 1.5,
          width: double.infinity,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: AppColors.kPrimaryColor,
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Icon(
                  Icons.mark_email_read_outlined,
                  color: AppColors.kPrimaryColor,
                ),
                title: Text(
                  'Mark as Read',
                  style: TextStyle(
                    color: AppColors.kPrimaryColor,
                  ),
                ),
                subtitle: Text(
                  'Mark the notification as read.',
                ),
              ),
              SizedBox(
                height: 1,
                width: double.infinity,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: AppColors.kPrimaryColor,
                  ),
                ),
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Icon(
                  Icons.delete,
                  color: AppColors.kPrimaryColor,
                ),
                title: Text(
                  'Delete',
                  style: TextStyle(
                    color: AppColors.kPrimaryColor,
                  ),
                ),
                subtitle: Text(
                  'Delete the notification permanently',
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
