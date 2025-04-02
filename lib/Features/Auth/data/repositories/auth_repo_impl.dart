import '../../domain/repositories/auth_repo.dart';
import '../data_sources/auth_data.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthLocalDataSource localDataSource;

  AuthRepositoryImpl(this.localDataSource);

  @override
  Future<bool> login(String email, String password) {
    return localDataSource.login(email, password);
  }
}