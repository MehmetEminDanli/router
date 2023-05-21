class Todo {
  int Id;
  String title;
  bool? isCompleted;
  bool? isStar;
  Todo(
      {required this.Id,
      required this.title,
      this.isCompleted = false,
      this.isStar = false});
}
