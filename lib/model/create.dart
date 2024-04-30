import 'package:flutter/material.dart';
import 'package:spareparts_platform/db/market_database.dart';
import 'package:spareparts_platform/model/market.dart';
import 'package:spareparts_platform/db/market_database.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({Key? key}) : super(key: key);

  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _descriptionController = TextEditingController();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Note'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: 'Title',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(
                labelText: 'Description',
              ),
              maxLines: 5,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () async {
                await _createNote();
                Navigator.pop(context);
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _createNote() async {
    final String title = _titleController.text;
    final String description = _descriptionController.text;
    final int number = 1; // Misalnya, Anda tentukan nomor di sini

    if (title.isNotEmpty && description.isNotEmpty) {
      final Note newNote = Note(
        number: number,
        title: title,
        description: description,
        postedTime: DateTime.now(),
      );

      final MarketDatabase db = MarketDatabase.instance;
      await db.create(newNote);
    }
  }
}
