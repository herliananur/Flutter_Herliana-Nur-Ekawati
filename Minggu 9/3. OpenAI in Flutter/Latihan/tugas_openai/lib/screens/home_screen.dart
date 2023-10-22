import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:tugas_openai/providers/smartphone_recomm_provider.dart';
import 'package:tugas_openai/screens/result_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _hargaController = TextEditingController();
  final TextEditingController _kameraController = TextEditingController();
  final TextEditingController _storageController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final recommendationProvider =
        Provider.of<SmartphoneRecommProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Phone Recommendation'),
      ),
      body: SingleChildScrollView(
        child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  heightFactor: 4,
                  child: Text(
                    'Smartphone Recommendation by AI',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: TextFormField(
                    controller: _hargaController,
                    decoration: const InputDecoration(
                        labelText: 'Budget',
                        hintText: 'Enter your Budget in IDR'),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                    ],
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'Enter your Budget in IDR';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: TextFormField(
                    controller: _kameraController,
                    decoration: const InputDecoration(
                        labelText: 'Camera (MP)',
                        hintText: 'Enter your Requirement for the Camera'),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                    ],
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'Enter your Requirement for the Camera';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: TextFormField(
                    controller: _storageController,
                    decoration: const InputDecoration(
                        labelText: 'Internal Storage',
                        hintText: 'Enter your Desired Internal Storage'),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                    ],
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'Enter your Desired Internal Storage';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: isLoading
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : Center(
                          child: ElevatedButton(
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  setState(() {
                                    isLoading = true;
                                  });
                                  await recommendationProvider
                                      .getRecommendations(
                                    harga: _hargaController.text,
                                    kamera: _kameraController.text,
                                    storage: _storageController.text,
                                  );
                                  if (recommendationProvider.recommendation !=
                                      null) {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(builder: (context) {
                                      return ResultScreen(
                                          responseData: recommendationProvider
                                              .recommendation!);
                                    }));
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(content: Text('Error')));
                                  }
                                  setState(() {
                                    isLoading = false;
                                  });
                                }
                              },
                              child: const Text('GET RECOMMENDATIONS')),
                        ),
                )
              ],
            )),
      ),
    );
  }
}
