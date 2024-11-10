abstract class AuthRepository {
  Future<dynamic> postLogin(
      {required String email,
        required String password,
      });
}

