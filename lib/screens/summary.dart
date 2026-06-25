import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studentgradetracker/providers/subject_provider.dart';
import 'package:studentgradetracker/providers/thema.dart';

class SummaryScreen extends StatelessWidget {
  const SummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeprovider = context.watch<Thema>();
    final subjectProvider = context.watch<SubjectProvider>();
    final theme = Theme.of(context);

    final int totalSubjects = subjectProvider.totalSubjects;
    final double averageMark = subjectProvider.averageMark;
    final String overallGrade = subjectProvider.overallGrade;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Summary"),
        actions: [
          IconButton(
            onPressed: () {
              themeprovider.toggleThema(!themeprovider.isDark);
            },
            icon: Icon(
              themeprovider.isDark ? Icons.light_mode : Icons.dark_mode,
            ),
          ),
        ],
      ),
      body: totalSubjects == 0
          ? Center(
              child: Text(
                "No subjects added yet",
                style: theme.textTheme.titleMedium?.copyWith(
                  color: theme.colorScheme.onSurface,
                ),
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Card(
                    child: ListTile(
                      leading: Icon(
                        Icons.menu_book,
                        color: theme.colorScheme.primary,
                      ),
                      title: Text(
                        "Total Subjects",
                        style: theme.textTheme.titleMedium?.copyWith(
                          color: theme.colorScheme.onSurface,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      trailing: Text(
                        '$totalSubjects',
                        style: theme.textTheme.titleMedium?.copyWith(
                          color: theme.colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  Card(
                    child: ListTile(
                      leading: Icon(
                        Icons.calculate,
                        color: theme.colorScheme.primary,
                      ),
                      title: Text(
                        "Average Mark",
                        style: theme.textTheme.titleMedium?.copyWith(
                          color: theme.colorScheme.onSurface,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      trailing: Text(
                        averageMark.toStringAsFixed(2),
                        style: theme.textTheme.titleMedium?.copyWith(
                          color: theme.colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  Card(
                    child: ListTile(
                      leading: Icon(
                        Icons.grade,
                        color: theme.colorScheme.primary,
                      ),
                      title: Text(
                        "Overall Grade",
                        style: theme.textTheme.titleMedium?.copyWith(
                          color: theme.colorScheme.onSurface,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      trailing: Text(
                        overallGrade,
                        style: theme.textTheme.titleLarge?.copyWith(
                          color: theme.colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}