part of 'todo.dart';

class _TodoStatus {
  final IconData icon;
  final Color color;

  const _TodoStatus(this.icon, this.color);
}

const Map<bool, _TodoStatus> _TODO_STATUS = {
  true: _TodoStatus(Icons.check, Colors.green),
  false: _TodoStatus(Icons.pending_actions, Colors.grey),
};
