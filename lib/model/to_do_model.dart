class ToDoModel {
  final int id;
  final String text;
  final bool isDone;

  ToDoModel(this.id, this.text, this.isDone);

  ToDoModel.update(this.id, this.text, this.isDone) {
    print('Id: $id \nText: $text \nIsDone: $isDone');
    // TODO
  }
}
