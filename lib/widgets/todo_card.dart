import 'package:flutter/material.dart';

class TodoCard extends StatelessWidget {
  final String title;
  final String description;
  final String category;
  final String? date;
  final bool isDone;
  final VoidCallback? onDone;
  final VoidCallback? onDelete;
  final VoidCallback? onEdit;

  const TodoCard({
    Key? key,
    required this.title,
    required this.description,
    required this.category,
    required this.isDone,
    this.date,
    this.onDone,
    this.onDelete,
    this.onEdit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      child: ListTile(
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(description),
            const SizedBox(height: 4),
            Text("Kategori: $category"),
            if (date != null) Text("Tanggal: $date"),
          ],
        ),
        trailing: Wrap(
          spacing: 4,
          children: [
            IconButton(
              icon: const Icon(Icons.edit, color: Colors.orange),
              onPressed: onEdit,
            ),
            IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: onDelete,
            ),
            IconButton(
              icon: const Icon(Icons.check, color: Colors.green),
              onPressed: onDone,
            ),
          ],
        ),
      ),
    );
  }
}
