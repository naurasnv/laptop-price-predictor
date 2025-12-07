import 'package:flutter/material.dart';

class PredictionPage extends StatefulWidget {
  const PredictionPage({super.key});

  @override
  State<PredictionPage> createState() => _PredictionPageState();
}

class _PredictionPageState extends State<PredictionPage> {
  String? processor, ram, storage, screen;
  double? result;

  final processors = ["Intel i3", "Intel i5", "Intel i7", "Ryzen 5", "Ryzen 7"];
  final ramOptions = ["4 GB", "8 GB", "16 GB"];
  final storageOptions = ["HDD", "SSD", "NVME"];
  final screenOptions = ["13 inch", "14 inch", "15.6 inch"];

  double predictPrice() {
    double basePrice = 3000000;

    // Processor weight
    Map<String, double> processorWeight = {
      "Intel i3": 1.0,
      "Intel i5": 1.4,
      "Intel i7": 2.0,
      "Ryzen 5": 1.3,
      "Ryzen 7": 1.8
    };

    // Storage bonus
    Map<String, double> storageBonus = {
      "HDD": 500000,
      "SSD": 1500000,
      "NVME": 2500000,
    };

    // RAM add values
    Map<String, double> ramAdd = {
      "4 GB": 500000,
      "8 GB": 1000000,
      "16 GB": 2000000,
    };

    double screenMultiplier = (screen == "13 inch") ? 1.0 : 1.3;

    return (basePrice *
            processorWeight[processor]! *
            screenMultiplier) +
        storageBonus[storage]! +
        ramAdd[ram]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Laptop Price Predictor"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            DropdownButtonFormField(
              dropdownColor: Colors.black87,
              hint: const Text("Select Processor"),
              value: processor,
              items: processors.map((item) => DropdownMenuItem(
                value: item,
                child: Text(item),
              )).toList(),
              onChanged: (val) => setState(() => processor = val),
            ),

            const SizedBox(height: 12),
            DropdownButtonFormField(
              dropdownColor: Colors.black87,
              hint: const Text("Select RAM"),
              value: ram,
              items: ramOptions.map((item) => DropdownMenuItem(
                value: item,
                child: Text(item),
              )).toList(),
              onChanged: (val) => setState(() => ram = val),
            ),

            const SizedBox(height: 12),
            DropdownButtonFormField(
              dropdownColor: Colors.black87,
              hint: const Text("Select Storage"),
              value: storage,
              items: storageOptions.map((item) => DropdownMenuItem(
                value: item,
                child: Text(item),
              )).toList(),
              onChanged: (val) => setState(() => storage = val),
            ),

            const SizedBox(height: 12),
            DropdownButtonFormField(
              dropdownColor: Colors.black87,
              hint: const Text("Select Screen Size"),
              value: screen,
              items: screenOptions.map((item) => DropdownMenuItem(
                value: item,
                child: Text(item),
              )).toList(),
              onChanged: (val) => setState(() => screen = val),
            ),

            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: () {
                if (processor != null && ram != null && storage != null && screen != null) {
                  setState(() => result = predictPrice());
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              ),
              child: const Text("Predict Price"),
            ),

            const SizedBox(height: 30),

            if (result != null)
              Text(
                "Estimated Price:\nRp ${result!.toStringAsFixed(0)}",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.greenAccent,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
