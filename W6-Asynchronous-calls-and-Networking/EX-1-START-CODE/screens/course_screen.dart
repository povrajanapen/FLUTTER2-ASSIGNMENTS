import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:week6/EX-1-START-CODE/provider/courses_provider.dart';
import '../models/course.dart';
import 'course_score_form.dart';

class CourseScreen extends StatelessWidget {
  const CourseScreen({super.key, required this.course});

  final Course course;

  Color scoreColor(double score) {
    return score > 50 ? Colors.green : Colors.orange;
  }

  Future<CourseScore?> _addScore(BuildContext context) async {
    final result = await Navigator.of(context).push<CourseScore>(
      MaterialPageRoute(builder: (ctx) => const CourseScoreForm()),
    );
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CoursesProvider>(
      builder: (context, courseModel, child){
        List<CourseScore> scores = courseModel.getCourse(course.id).scores;

    Widget content = const Center(child: Text('No Scores added yet.'));

    if (scores.isNotEmpty) {
      content = ListView.builder(
        itemCount: scores.length,
        itemBuilder:
            (ctx, index) => ListTile(
              title: Text(scores[index].studentName),
              trailing: Text(
                scores[index].studenScore.toString(),
                style: TextStyle(
                  color: scoreColor(scores[index].studenScore),
                  fontSize: 15,
                ),
              ),
            ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: mainColor,
        title: Text(
          courseModel.getCourse(course.id).name,
          style: const TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
          onPressed: (){
            _addScore(context).then((newScore){
              if(newScore != null){
                courseModel.addScore(course.id, newScore);
              }
            });
          }, 
          icon: const Icon(Icons.add)),
        ],
      ),
      body: content,
    );
    });
  }
}
