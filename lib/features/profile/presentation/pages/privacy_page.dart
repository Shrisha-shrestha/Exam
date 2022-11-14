import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:creatu_exam/core/di/dependency_injections.dart';
import 'package:creatu_exam/core/network/api_endpoints.dart';
import 'package:creatu_exam/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:creatu_exam/widgets/custom_appbar.dart';
import 'package:creatu_exam/widgets/html_widget.dart';

class PrivacyPage extends StatelessWidget {
  const PrivacyPage({
    super.key,
    required this.endpoints,
    required this.mapKey,
    required this.title,
  });

  final String endpoints;
  final String mapKey;
  final String title;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PrivacyBloc>(
      create: (context) => getIt<PrivacyBloc>()
        ..add(
          PrivacyEvent(
            endPoints: endpoints,
            key: mapKey,
          ),
        ),
      child: _DisclaimerView(
        title: title,
      ),
    );
  }
}

class _DisclaimerView extends StatelessWidget {
  const _DisclaimerView({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: title),
      body: BlocBuilder<PrivacyBloc, ProfileState>(
        builder: (context, state) {
          if (state is PrivacySuccessState) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: Column(
                  children: [
                    HtmlWidget(
                      postContent: state.data.description ?? '',
                    ),
                  ],
                ),
              ),
            );
          } else if (state is ProfileErrorState) {
            return Text('error : ${state.error}');
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
