import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quitanda_virtual/src/pages/auth/controller/auth_controller.dart';
import 'package:quitanda_virtual/src/pages/commom_widgets/custom_text_field.dart';
import 'package:quitanda_virtual/src/services/validators.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  final authController = Get.find<AuthController>();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil do Usuário'),
        actions: [
          IconButton(
            onPressed: () {
              authController.signOut();
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
        children: [
          CustomTextField(
            readOnly: true,
            initialValue: authController.user.email,
            icon: Icons.email,
            label: 'Email',
          ),
          CustomTextField(
            readOnly: true,
            initialValue: authController.user.name,
            icon: Icons.person,
            label: 'Nome',
          ),
          CustomTextField(
            readOnly: true,
            initialValue: authController.user.phone,
            icon: Icons.phone,
            label: 'Celular',
          ),
          CustomTextField(
            readOnly: true,
            initialValue: authController.user.cpf,
            icon: Icons.file_copy,
            label: 'CPF',
            isSecret: true,
          ),
          SizedBox(
            height: 50,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.green),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () async {
                await updatePassword();
              },
              child: const Text('Atualizar senha'),
            ),
          ),
        ],
      ),
    );
  }

  Future<bool?> updatePassword() {
    final newPasswordController = TextEditingController();
    return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Stack(
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        child: Text(
                          'Atualização de senha',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Positioned(
                        right: 5,
                        child: IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: const Icon(Icons.close),
                        ),
                      ),
                    ],
                  ),
                  const CustomTextField(
                    isSecret: true,
                    icon: Icons.lock,
                    label: 'Senha atual',
                    validator: passwordValidator,
                  ),
                  CustomTextField(
                    controller: newPasswordController,
                    isSecret: true,
                    icon: Icons.lock_outlined,
                    label: 'Nova Senha',
                    validator: passwordValidator,
                  ),
                  CustomTextField(
                    isSecret: true,
                    icon: Icons.lock_outline,
                    label: 'Confirmar nova senha',
                    validator: (password) {
                      final result = passwordValidator(password);
                      if (result != null) {
                        return result;
                      }
                      if (password != newPasswordController.text) {
                        return 'As senhas não são equivalentes';
                      }

                      return null;
                    },
                  ),
                  SizedBox(
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () {
                        _formKey.currentState!.validate();
                      },
                      child: const Text(
                        'Atualizar',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
