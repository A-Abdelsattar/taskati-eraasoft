import 'dart:convert';

// Task model
class Task {
  int? taskId;
  String? title;
  String? description;
  String? status;
  String? deliveryDate;
  String? priority;
  String? createdAt;

  Task({
    required this.taskId,
    required this.title,
    required this.description,
    required this.status,
    required this.deliveryDate,
    required this.priority,
    required this.createdAt,
  });

  // Factory method to create Task from JSON
  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      taskId: json['taskId'],
      title: json['title'],
      description: json['description'],
      status: json['status'],
      deliveryDate: json['deliveryDate'],
      priority: json['priority'],
      createdAt: json['createdAt'],
    );
  }

  // Method to convert Task to JSON
  Map<String, dynamic> toJson() {
    return {
      'taskId': taskId,
      'title': title,
      'description': description,
      'status': status,
      'deliveryDate': deliveryDate,
      'priority': priority,
      'createdAt': createdAt,
    };
  }
}



// Main response model
class TaskResponse {
  List<Task>? data;

  String? error;

  TaskResponse({
    required this.data,
    this.error,
  });

  // Factory method to create TaskResponse from JSON
  factory TaskResponse.fromJson(Map<String, dynamic> json) {
    var list = json['data'] as List;
    List<Task> taskList = list.map((i) => Task.fromJson(i)).toList();

    return TaskResponse(
      data: taskList,
      error: json['error'],
    );
  }

  // Method to convert TaskResponse to JSON
  Map<String, dynamic> toJson() {
    return {
      'data': data?.map((task) => task.toJson()).toList(),
      'error': error,
    };
  }
}


