import 'package:flutter/material.dart';

class IconModel {
  String? name;
  IconData? icon;

  IconModel(
      {
        this.name,
       this.icon,
     });
  IconModel.fromJeson(Map<String, dynamic?>? json) {
    name = json!['name'];
    icon = json['icon'];
  }
  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['icon'] = this.icon;
    
    return data;
  }
}
