import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studentgradetracker/providers/subject_provider.dart';
import 'package:studentgradetracker/providers/thema.dart';

class AddSubject extends StatefulWidget {
  const AddSubject({super.key});

  @override
  State<AddSubject> createState() => _AddSubjectState();
}

class _AddSubjectState extends State<AddSubject> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _markController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _markController.dispose();
    super.dispose();
  }

  void _saveSubject() {
    if (_formKey.currentState!.validate()) {
      final String name = _nameController.text.trim();
      final int mark = int.parse(_markController.text.trim());

      context.read<SubjectProvider>().addSubject(name, mark);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Subject added successfully'),
        ),
      );

      _nameController.clear();
      _markController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeprovider = context.watch<Thema>();
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Grade Tracker"),
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Text(
                    'Add a new subject',
                    style: theme.textTheme.titleLarge?.copyWith(
                      color: theme.colorScheme.onSurface,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),

                  TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      labelText: 'Subject Name',
                      hintText: 'Enter subject name',
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Subject name cannot be empty';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 16),

                  TextFormField(
                    controller: _markController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Mark',
                      hintText: 'Enter mark (0-100)',
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Mark cannot be empty';
                      }

                      final double? mark = double.tryParse(value.trim());

                      if (mark == null) {
                        return 'Enter a valid number';
                      }

                      if (mark < 0 || mark > 100) {
                        return 'Mark must be between 0 and 100';
                      }

                      return null;
                    },
                  ),

                  const SizedBox(height: 24),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _saveSubject,
                      child: const Text('Add Subject'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}