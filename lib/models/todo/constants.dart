part of './todo.dart';

class _TodoStatus {
  final IconData icon;
  final Color color;

  const _TodoStatus(this.icon, this.color);
}

const _TODO_STATUS = <bool, _TodoStatus>{
  true: _TodoStatus(Icons.check, Colors.green),
  false: _TodoStatus(Icons.pending_actions, Colors.grey),
};
