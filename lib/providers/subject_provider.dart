import 'package:flutter/material.dart';
import 'package:studentgradetracker/models/subjectmodel.dart';

class SubjectProvider extends ChangeNotifier {
  final List<Subject> _subjects = [];

  List<Subject> get subjects => _subjects;

  void addSubject(String name, int mark) {
    _subjects.add(Subject(name: name, mark: mark));
    notifyListeners();
  }

  void deleteSubject(int index) {
    _subjects.removeAt(index);
    notifyListeners();
  }

  int get totalSubjects => _subjects.length;

  double get averageMark {
    if (_subjects.isEmpty) return 0;

    double total = 0;
    for (final subject in _subjects) {
      total += subject.mark;
    }
    return total / _subjects.length;
  }

  String get overallGrade {
    final avg = averageMark;

    if (avg >= 80) return 'A';
    if (avg >= 65) return 'B';
    if (avg >= 50) return 'C';
    return 'F';
  }

// assignment er condition e chilo dekhe add korechi 
//khuje pacchilam na eta koi add korbo tai
//sorry hehe :D

  int get passedSubjectsCount {
    return _subjects.where((subject) => subject.mark >= 50).length;
  }
}