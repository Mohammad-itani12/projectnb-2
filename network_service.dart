import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';


class Resource {
  final String title;
  final String description;

  Resource({required this.title, required this.description});

  factory Resource.fromJson(Map<String, dynamic> json) {
    return Resource(
      title: json['title'],
      description: json['description'],
    );
  }
}

// Network Service: Fetch resources from the backend (PHP)
class NetworkService {
  static const String baseUrl = 'https:learning-resources.com';

  // Fetch resources from the backend
  Future<List<Resource>> fetchResources() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/get_resources.php'));

      if (response.statusCode == 200) {
        // Parse JSON response into a list of resources
        List data = jsonDecode(response.body);
        return data.map((item) => Resource.fromJson(item)).toList();
      } else {
        throw Exception('Failed to load resources');
      }
    } catch (e) {
      throw Exception('Error fetching data: $e');
    }
  }
}