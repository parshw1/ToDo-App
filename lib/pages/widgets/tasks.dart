class Tasks {
  String id;
  String title;
  String description;
  bool isCompleted;

Tasks({required this.id,required this.title,required this.description,this.isCompleted = false,});

Map<String, dynamic> toJson() 
  { 
  return { 'id': id, 'title': title, 'description': description, 'isCompleted': isCompleted, }; 
  }
}
