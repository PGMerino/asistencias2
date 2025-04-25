import 'package:flutter/material.dart';
import 'package:app_asistencias/data/preferences/shared_preferences_helper.dart';

class LoginViewModel extends ChangeNotifier {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool _isLoading = false;
  bool _isPasswordVisible = false;
  String _errorMessage = '';

  bool get isLoading => _isLoading;
  bool get isPasswordVisible => _isPasswordVisible;
  String get errorMessage => _errorMessage;

  void togglePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }

  void setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  void setErrorMessage(String message) {
    _errorMessage = message;
    notifyListeners();
  }

  Future<bool> login() async {
    setLoading(true);
    setErrorMessage('');

    // Simulate network request
    await Future.delayed(const Duration(seconds: 2));

    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      setErrorMessage('Por favor, complete todos los campos');
      setLoading(false);
      return false;
    }

    // Aquí iría la lógica de autenticación real
    // Por ahora simulamos un login exitoso con credenciales fijas
    if (email == 'admin@test.com' && password == 'admin123') {
      // Guardar estado de login
      await SharedPreferencesHelper.setIsLoggedIn(true);
      await SharedPreferencesHelper.setUserName('Administrador');
      await SharedPreferencesHelper.setUserType('admin');

      setLoading(false);
      return true;
    } else if (email == 'paula@test.com' && password == '1234') {
      // Guardar estado de login
      await SharedPreferencesHelper.setIsLoggedIn(true);
      await SharedPreferencesHelper.setUserName('Profesor');
      await SharedPreferencesHelper.setUserType('profesor');

      setLoading(false);
      return true;
    } else {
      setErrorMessage('Credenciales incorrectas');
      setLoading(false);
      return false;
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}