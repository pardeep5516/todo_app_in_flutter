import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool isDone;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;

  ToDoTile(
      {super.key,
      required this.taskName,
      required this.isDone,
      this.onChanged,
      this.deleteFunction});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: (context) => deleteFunction!(context),
              icon: Icons.delete,
              label: 'Delete',
              borderRadius: BorderRadius.circular(12),
            )
          ],
        ),
        child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Row(
              children: [
                Checkbox(
                  value: isDone,
                  onChanged: onChanged,
                  activeColor: Colors.black,
                  checkColor: Colors.yellow,
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  taskName,
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    decoration: isDone
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ),
                )
              ],
            )),
      ),
    );
  }
}
