class AuthLocalDataSource {
  Future<bool> login(String email, String password) async {
    return email == "test@example.com" && password == "password123";
  }
}