import 'package:flutter/material.dart';
import 'package:soal_prioritas2/model/api/dice_bear_api.dart';

class DiceBearViewModel extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  final TextEditingController _diceBearController = TextEditingController();
  TextEditingController get diceBearController => _diceBearController;

  String _imageData = '';
  String get imageData => _imageData;
  void getImageDiceBear() async {
    _isLoading = true;
    notifyListeners();
    _imageData = await DiceBearApi()
        .getImageDiceBear(avatarImage: _diceBearController.text);
    _isLoading = false;
    notifyListeners();
  }
}
