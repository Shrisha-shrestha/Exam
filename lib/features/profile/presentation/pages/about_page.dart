import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:creatu_exam/features/profile/data/models/setting_model.dart';
import 'package:creatu_exam/res/app_colors.dart';
import 'package:creatu_exam/res/app_styles.dart';
import 'package:creatu_exam/widgets/custom_appbar.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        title: 'About Us',
      ),
      body: _AboutPageView(),
    );
  }
}

class _AboutPageView extends StatelessWidget {
  const _AboutPageView();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SettingModel>(
      future: getSetting(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasData) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                SettingTile(
                  value: snapshot.data?.companyName ?? '',
                  title: 'Company Name',
                ),
                SettingTile(
                  value: snapshot.data?.email1 ?? '',
                  title: 'Email',
                ),
                SettingTile(
                  value: snapshot.data?.contact1 ?? '',
                  title: 'Contact',
                ),
                SettingTile(
                  value: snapshot.data?.address ?? '',
                  title: 'Address',
                ),
              ],
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}

class SettingTile extends StatelessWidget {
  const SettingTile({
    super.key,
    required this.title,
    required this.value,
  });

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 5,
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              textAlign: TextAlign.end,
              style: const TextStyle(
                color: AppColors.kTextPrimaryColor,
                fontFamily: AppStyles.kFontOpenSans,
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          const Text(' : '),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                color: AppColors.kPrimaryColor,
                fontFamily: AppStyles.kFontOpenSans,
                fontSize: 16,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Future<SettingModel> getSetting() async {
  try {
    final response = await Dio().get(
        'https://creatu_examcms.creatudevelopers.com.np/api/v1/get-setting');
    return SettingModel.fromJson(
      response.data['data']['setting'] as Map<String, dynamic>,
    );
  } catch (e) {
    rethrow;
  }
}
