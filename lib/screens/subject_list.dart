import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studentgradetracker/providers/subject_provider.dart';
import 'package:studentgradetracker/providers/thema.dart';

class SubjectList extends StatelessWidget {
  const SubjectList({super.key});

  @override
  Widget build(BuildContext context) {
    final themeprovider = context.watch<Thema>();
    final subjectProvider = context.watch<SubjectProvider>();
    final subjects = subjectProvider.subjects;
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Subject List"),
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

      body: subjects.isEmpty
          ? Center(
              child: Text(
                "No subjects added yet",
                style: theme.textTheme.titleMedium?.copyWith(
                  color: theme.colorScheme.onSurface,
                ),
              ),
            )
          : ListView.builder(
              itemCount: subjects.length,
              padding: const EdgeInsets.symmetric(vertical: 8),
              itemBuilder: (context, index) {
                final subject = subjects[index];

                return Dismissible(
                  key: ValueKey('${subject.name}-$index'),
                  direction: DismissDirection.endToStart,
                  background: Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    alignment: Alignment.centerRight,
                    decoration: BoxDecoration(
                      color: theme.colorScheme.error,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      Icons.delete,
                      color: theme.colorScheme.onError,
                    ),
                  ),
                  onDismissed: (direction) {
                    final deletedName = subject.name;
                    subjectProvider.deleteSubject(index);

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('$deletedName deleted'),
                      ),
                    );
                  },
                  child: Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: theme.colorScheme.primary,
                        foregroundColor: theme.colorScheme.onPrimary,
                        child: Text(subject.grade),
                      ),
                      title: Text(
                        subject.name,
                        style: theme.textTheme.titleMedium?.copyWith(
                          color: theme.colorScheme.onSurface,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      subtitle: Text(
                        'Mark: ${subject.mark}',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.colorScheme.onSurface,
                        ),
                      ),
                      trailing: Text(
                        subject.grade,
                        style: theme.textTheme.titleMedium?.copyWith(
                          color: theme.colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}