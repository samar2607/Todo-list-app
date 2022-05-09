class Task {
  final String name;
  bool isDone;
  int? id;

  Task({required this.name, this.isDone = false});
  Task.withId({required this.id, required this.name, required this.isDone});

  void doneChange() {
    isDone = !isDone;
  }

  Map<String, dynamic> toMap(){
    final map = Map<String, dynamic>();
    if(id != null){
      map['id'] = id;
    }
    map['name'] = name;
    map['isDone'] = isDone;
    return map;
  }

  factory Task.fromMap(Map<String, dynamic> map){
    return Task.withId(id: map['id'],
        name: map['name'],
        isDone: map['isDone']);
  }

}
