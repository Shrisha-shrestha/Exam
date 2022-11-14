import 'package:flutter/material.dart';
import 'package:creatu_exam/core/network/dio_service.dart';
import 'package:creatu_exam/features/exams/data/models/exam_model.dart';
import 'package:creatu_exam/features/exams/data/repositories/exam_repository_impl.dart';
import 'package:creatu_exam/widgets/custom_appbar.dart';

class TestWidget extends StatelessWidget {
  const TestWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: ''),
      body: StreamBuilder<List<ExamModel>>(
          stream: ExamRepositoryImpl(dioService: DioService()).getExamList(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text('${snapshot.data![index].examSchedule}'),
                    );
                  });
            }
            return SizedBox();
          }),
    );
  }
}
