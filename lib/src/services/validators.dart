import 'package:get/get.dart';

String? emailValidator(String? email) {
  if (email == null || email.isEmpty) {
    return 'Digite seu email!';
  }
  if (!email.isEmail) return 'Digite um email válido!';

  return null;
}

String? passwordValidator(password) {
  if (password == null || password.isEmpty) {
    return 'Digite sua senha!';
  }
  if (password.length < 6) {
    return 'Digite uma senha com pelo menos 6 caracteres.';
  }

  return null;
}

String? nameValidator(String? name) {
  if (name == null || name.isEmpty) {
    return 'Digite um nome válido!';
  }

  final names = name.split(' ');

  if (names.length == 1) return 'Digite seu nome completo!';

  return null;
}

String? phoneValifator(String? phone) {
  if (phone == null || phone.isEmpty) {
    return 'Digite um número de celular';
  }

  if (!phone.isPhoneNumber) return 'Digite um número válido';

  return null;
}

String? cpfValidator(String? cpf) {
  if (cpf == null || cpf.isEmpty) {
    return 'Digite um CPF!';
  }

  if (!cpf.isCpf) return 'Digite um CPF válido';

  return null;
}
