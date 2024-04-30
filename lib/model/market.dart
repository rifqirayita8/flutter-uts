final String tableNotes= 'notes';

class NoteFields{
  static final List<String> values=[
    id, number, title, description, time
  ];

  static final String id= '_id';
  static final String number= 'number';
  static final String title= 'title';
  static final String description= 'description';
  static final String time= 'time';
}

class Note{
  final int? id;
  final int number;
  final String title;
  final String description;
  final DateTime postedTime;

  const Note({
    this.id,
    required this.number,
    required this.title,
    required this.description,
    required this.postedTime, 
  });
  Note copy({
    int? id,
    int? number,
    String? title,
    String? description,
    DateTime? postedTime,
  }) =>    
    Note(
      id: id ?? this.id,
      number: number ?? this.number, 
      title: title ?? this.title, 
      description: description ?? this.description, 
      postedTime: postedTime ?? this.postedTime,
      );

    static Note fromJson(Map<String, Object?> json) => Note(
      id: json[NoteFields.id] as int?,
      number: json[NoteFields.number] as int, 
      title: json[NoteFields.title] as String, 
      description: json[NoteFields.description] as String, 
      postedTime: DateTime.parse(json[NoteFields.time] as String),
      );

    Map<String, Object?> toJson() => {
      NoteFields.id: id,
      NoteFields.number: number,
      NoteFields.title: title,
      NoteFields.description: description,  
      NoteFields.time: postedTime.toIso8601String(), 
  };
  
}