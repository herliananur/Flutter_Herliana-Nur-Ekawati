import 'package:flutter/material.dart';
import 'package:flutter_openai_demo/screen/result.dart';
import 'package:flutter_openai_demo/services/recommendation.dart';

const List<String> carRegions = <String>[
  'Asia',
  'Europe',
  'US',
];

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _controller = TextEditingController();
  String carRegionValue = carRegions.first;
  bool isLoading = false;

  void _getRecommendation() async {
    setState(() {
      isLoading = true;
    });
    try {
      final result = await RecommendationService.getRecommendation(
        carRegion: carRegionValue,
        budget: _controller.value.text,
      );
      if (mounted) {
        setState(() {
          isLoading = false;
        });

        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return ResultScreen(gptResponseData: result);
            },
          ),
        );
      }
    } catch (e) {
      const snackBar = SnackBar(
        content: Text('Failed to send a request. PLease try again.'),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Car Recommendation'),
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
                    'Car Recommendation by AI',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: Text('Choose Car Region'),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: DropdownButton<String>(
                    value: carRegionValue,
                    icon: const Icon(Icons.arrow_drop_down),
                    elevation: 16,
                    style: const TextStyle(color: Colors.teal),
                    underline: Container(
                      height: 2,
                      color: Colors.tealAccent,
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        carRegionValue = value!;
                      });
                    },
                    items: carRegions
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    // items: carRegions.map<DropdownMenuItem<String>>((String value) => {return DropdownMenuItem<String>(value: value,child: Text(value),);}).toList(),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: _controller,
                    decoration: const InputDecoration(
                        hintText: 'Enter a budget (in IDR)'),
                    validator: (String? value) {
                      bool isInvalid = value == null ||
                          value.isEmpty ||
                          int.tryParse(value) == null;
                      if (isInvalid) {
                        return 'Please enter valid numbers';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: isLoading && _formKey.currentState!.validate() != false
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : ElevatedButton(
                          onPressed: _getRecommendation,
                          child: const Center(
                            child: Text('Get Recommendations'),
                          )),
                )
              ],
            )),
      ),
    );
  }
}
