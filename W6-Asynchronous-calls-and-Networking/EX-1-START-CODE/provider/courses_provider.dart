import 'package:flutter/material.dart';
import 'package:week6/EX-1-START-CODE/models/course.dart';
import 'package:week6/EX-1-START-CODE/repository/courses_mock_repository.dart';

class CoursesProvider extends ChangeNotifier{

  final List<Course> _courses = CoursesMockRepository().getCourses();
  List<Course> get courses => _courses;

  Course getCourse(String id) => _courses.firstWhere((course) => course.id == id);

  void addScore(String id, CourseScore score){
    final course = _courses.firstWhere((course) => course.id == id);
    course.scores.add(score);
    notifyListeners();

  }
}