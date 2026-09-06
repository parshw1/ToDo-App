class Tasks {
  String id;
  String title;
  String description;
  bool isCompleted;

Tasks({required this.id,required this.title,required this.description,this.isCompleted = false,});

Map<String, dynamic> toJson() 
  { 
  return { 
    'id': id, 
    'title': title, 
    'description': description, 
    'isCompleted': isCompleted, }; 
  }
factory Tasks.fromJson(Map<String, dynamic> json) { 
    return Tasks( 
      id: json['id'], 
      title: json['title'], 
      description: json['description'], 
      isCompleted: json['isCompleted'] ?? false ); 
    } 
}
