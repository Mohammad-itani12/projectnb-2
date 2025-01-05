import 'package:flutter/material.dart';
import 'network_service.dart';

class ResourcesScreen extends StatefulWidget {
  @override
  _ResourcesScreenState createState() => _ResourcesScreenState();
}

class _ResourcesScreenState extends State<ResourcesScreen> {
  late Future<List<Resource>> resources;
  final NetworkService _networkService = NetworkService();

  @override
  void initState() {
    super.initState();
    resources = _networkService.fetchResources();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Learning Resources"),
      ),
      body: FutureBuilder<List<Resource>>(
        future: resources, // Use the fetched resources
        builder: (context, snapshot) {
          // Handle different states (loading, error, success)
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator()); // Loading indicator
          }

          if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}")); // Error message
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text("No resources available")); // Empty state
          }

          // ListView to display fetched resources
          final resources = snapshot.data!;
          return ListView.builder(
            itemCount: resources.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(resources[index].title),
                subtitle: Text(resources[index].description),
                onTap: () {

                },
              );
            },
          );
        },
      ),
    );
  }
}