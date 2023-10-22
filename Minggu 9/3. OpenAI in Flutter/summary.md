# Resume Materi OpenAI in Flutter

Beberapa point penting pada Materi OpenAI in Flutter sebagai berikut

1. Open AI Introduction

   Pengertian OpenAI
   - Sebuah library yang dapat digunakan untuk memanfaatkan teknologi AI yang disediakan oleh OpenAI
   - Library ini dapat diintegrasikan dengan berbagai aplikasi seperti API, web, dan mobile
   
   Keuntungan OpenAI
   - Gratis
   - Mudah dipasang
   - Dapat digunakan di berbagai perangkat
   - Jumlah parameter: 175 Miliar (model davinci 03)

2. Project Overview
   - Mengembangkan sebuah aplikasi mobile untuk mendapatkan rekomendasi mobil berdasarkan asal merk dan dana yang dimiliki

3. Project Example
   - Mendapatkan API Key dari OpenAI: https://platform.openai.com/account/api-keys
   - Membuat Project Flutter
   - Melakukan Instalasi Berbagai Package
     ```sh
      flutter pub add http
      flutter pub add intl
     ```
     ```sh
     flutter pub add envied
     flutter pub add –dev envied_generator
     flutter pub add –dev build_runner
     ```
   - Membuat File Konfigurasi
     ```sh
     // .env
     OPENAI_API_KEY=’YOUR_OPENAI_API_KEY’
     ```
   - Membaca File Konfigurasi
     ```sh
     // lib/env/env.dart
     import 'package:envied/envied.dart';
     part 'env.g.dart';

     @Envied(path: '.env')
     abstract class Env {
       @EnviedField(varName: 'OPENAI_API_KEY')
       static const String apiKey = _Env.apiKey;
     }
     ```
   - Melakukan Generate Code untuk Membaca .env
     ```sh
     flutter pub run build_runner build
     ```
   - Membuat Variabel untuk Menyimpan API Key
     ```sh
     // lib/constants/open_ai.dart
     import 'package:flutter_openai_demo/env/env.dart';

     String apiKey = Env.apiKey;
     ```
   - Membuat Data Model
     ```sh
     // lib/models/open_ai.dart
     import 'dart:convert';

     GptData gptDataFromJson(String str) => GptData.fromJson(json.decode(str));
     String gptDataToJson(GptData data) => json.encode(data.toJson());

     class GptData {
       String id;
       String object;
       int created;
       String model;
       List<Choice> choices;
       Usage usage;

     GptData({
       required this.id,
       required this.object,
       required this.created,
       required this.model,
       required this.choices,
       required this.usage,
     });

     factory GptData.fromJson(Map<String, dynamic> json) => GptData(
       id: json["id"],
       object: json["object"],
       created: json["created"],
       model: json["model"],
       choices: List<Choice>.from(json["choices"].map((x) => Choice.fromJson(x))),
       usage: Usage.fromJson(json["usage"]),
      );

     Map<String, dynamic> toJson() => {
       "id": id,
       "object": object,
       "created": created,
       "model": model,
       "choices": List<dynamic>.from(choices.map((x) => x.toJson())),
       "usage": usage.toJson(),
     };
     }
      
     class Choice {
       String text;
       int index;
       dynamic logprobs;
       String finishReason;
      
     Choice({
       required this.text,
       required this.index,
       required this.logprobs,
       required this.finishReason,
     });
      
     factory Choice.fromJson(Map<String, dynamic> json) => Choice(
       text: json["text"],
       index: json["index"],
       logprobs: json["logprobs"],
       finishReason: json["finish_reason"],
     );
      
     Map<String, dynamic> toJson() => {
       "text": text,
       "index": index,
       "logprobs": logprobs,
       "finish_reason": finishReason,
     };
     }
      
     class Usage {
       int promptTokens;
       int completionTokens;
       int totalTokens;
      
     Usage({
       required this.promptTokens,
       required this.completionTokens,
       required this.totalTokens,
     });
      
     factory Usage.fromJson(Map<String, dynamic> json) => Usage(
       promptTokens: json["prompt_tokens"],
       completionTokens: json["completion_tokens"],
       totalTokens: json["total_tokens"],
     );
      
     Map<String, dynamic> toJson() => {
       "prompt_tokens": promptTokens,
       "completion_tokens": completionTokens,
       "total_tokens": totalTokens,
     };
     }
     ```
   - Membuat Komponen Service
     ```sh
      // lib/services/recommendation.dart
      import 'dart:convert';
      
      import 'package:flutter_openai_demo/constants/open_ai.dart';
      import 'package:flutter_openai_demo/models/open_ai.dart';
      import 'package:intl/intl.dart';
      import 'package:http/http.dart' as http;
      
      class RecommendationService {
        static Future<GptData> getRecommendation({
          required String carRegion,
          required String budget,
        }) async {
          late GptData gptData = GptData(
            id: "",
            object: "",
            created: 0,
            model: "",
            choices: [],
            usage: Usage(promptTokens: 0, completionTokens: 0, totalTokens: 0),
          );
    
          try {
            var url = Uri.parse('https://api.openai.com/v1/completions');
    
            Map<String, String> headers = {
              'Contet-Type': 'application/json;charset=UTF-8',
              'Charset': 'utf-8',
              'Authorization': 'Bearer $apiKey'
            };
    
            final formatCurrency = NumberFormat.currency(
              locale: 'id_ID',
              symbol: 'IDR',
              decimalDigits: 0,
            );
    
            String carBudget = formatCurrency.format(int.parse(budget));
    
            String promptData =
              "You are a car expert. Please give me a car recommendation from $carRegion manufacturers with budget equals to $carBudget";
    
            final data = jsonEncode({
              "model": "text-davinci-003",
              "prompt": promptData,
              "temperature": 0.4,
              "max_tokens": 64,
              "top_p": 1,
              "frequency_penalty": 0,
              "presence_penalty": 0
            });
    
            var response = await http.post(url, headers: headers, body: data);
            if (response.statusCode == 200) {
              gptData = gptDataFromJson(response.body);
            }
          } catch (e) {
            throw Exception('Error occured when sending request');
          }
    
          return gptData;
        }
      }
     ```
   - Membuat Halaman Beranda
     ```sh
     // lib/screens/home.dart

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
      ```
   - Membuat Halaman Daftar Rekomendasi
     ```sh
      // lib/screens/result.dart
      
      import 'package:flutter/material.dart';
      import 'package:flutter_openai_demo/models/open_ai.dart';
      
      class ResultScreen extends StatelessWidget {
        const ResultScreen({super.key, required this.gptResponseData});
      
        final GptData gptResponseData;
        @override
        Widget build(BuildContext context) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Recommendations'),
            ),
            body: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    'Recommendations',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    gptResponseData.choices.isNotEmpty
                        ? gptResponseData.choices[0].text
                        : 'No recommendations available',
                    textAlign: TextAlign.justify,
                  ),
                )
              ],
            ),
          );
        }
      }
      ```
   - Membuat Konfigurasi di main.dart
     ```sh
      // lib/main.dart
      import 'package:flutter/material.dart';
      import 'package:flutter_openai_demo/screen/home.dart';
      
      void main() {
        runApp(const MyApp());
      }
      
      class MyApp extends StatelessWidget {
        const MyApp({super.key});
      
        @override
        Widget build(BuildContext context) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter OpenAI Demo',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: const HomeScreen(),
          );
        }
      }
      ```
