import 'package:flutter/material.dart';
import 'part_details_screen.dart';

class SearchResultsScreen extends StatelessWidget {
  final List<Map<String, String>> results = List.generate(
    5,
    (index) => {
      "partName": "Flywheel Housing",
      "partNo": "4H.682.01/04",
      "machineType": "SRF Unit No. 01",
      "operation": "Tapping",
      "feedAvailable": "Yes",
      "speedAvailable": "No",
    },
  );

  SearchResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // ✅ Back navigation added
          },
        ),
        centerTitle: true,
        title: const Text(
          "Search Results",
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
          itemCount: results.length,
          itemBuilder: (context, index) {
            final item = results[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Container(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Colors.blue, Colors.deepPurple],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Part Name : ${item["partName"]}",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "Part No. : ${item["partNo"]}",
                      style: const TextStyle(color: Colors.white),
                    ),
                    Text(
                      "Machine Type : ${item["machineType"]}",
                      style: const TextStyle(color: Colors.white),
                    ),
                    Text(
                      "Choose Operation: ${item["operation"]}",
                      style: const TextStyle(color: Colors.white),
                    ),
                    Text(
                      "Feed Is Available : ${item["feedAvailable"]}",
                      style: const TextStyle(color: Colors.white),
                    ),
                    Text(
                      "Speed is Available : ${item["speedAvailable"]}",
                      style: const TextStyle(color: Colors.white),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/partDetails'); // ✅ Navigation updated
                      },
                      child: const Text("Read More ⫸"),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
