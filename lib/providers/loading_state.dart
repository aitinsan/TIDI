import 'base_controller.dart';

class LoadingState {
  final BaseController _baseController;

  LoadingState(BaseController controller) : _baseController = controller;

  int _loadingCount = 0;

  bool get isLoading => _loadingCount > 0;

  void setLoading(bool loading) {
    if (loading) {
      _loadingCount++;
      _baseController?.notifyListeners();
    } else if (_loadingCount > 0) {
      _loadingCount--;
      _baseController?.notifyListeners();
    }
  }
}
