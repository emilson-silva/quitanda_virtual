import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:quitanda_virtual/src/pages/commom_widgets/custom_text_field.dart';
import 'package:quitanda_virtual/src/config/custom_colors.dart';
import 'package:quitanda_virtual/src/services/validators.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final cpfFormatter = MaskTextInputFormatter(
    mask: '###.###.###-##',
    filter: {'#': RegExp(r'[0-9]')},
  );
  final phoneFormatter = MaskTextInputFormatter(
    mask: '## # ####-####',
  );

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: CustomColors.customSwatchColor,
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Stack(
            children: [
              Column(
                children: [
                  const Expanded(
                    child: Center(
                      child: Text(
                        'Cadastro',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 40,
                    ),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(45),
                      ),
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const CustomTextField(
                            textInputType: TextInputType.emailAddress,
                            validator: emailValidator,
                            icon: Icons.email,
                            label: 'Email',
                          ),
                          const CustomTextField(
                            validator: passwordValidator,
                            textInputType: TextInputType.number,
                            icon: Icons.lock,
                            label: 'Senha',
                            isSecret: true,
                          ),
                          const CustomTextField(
                            validator: nameValidator,
                            icon: Icons.person,
                            label: 'Nome',
                          ),
                          CustomTextField(
                            textInputType: TextInputType.phone,
                            validator: phoneValifator,
                            icon: Icons.phone,
                            label: 'Celular',
                            inputFormaters: [phoneFormatter],
                          ),
                          CustomTextField(
                            textInputType: TextInputType.number,
                            validator: cpfValidator,
                            icon: Icons.file_copy,
                            label: 'CPF',
                            inputFormaters: [cpfFormatter],
                          ),
                          SizedBox(
                            height: 50,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18),
                                ),
                              ),
                              onPressed: () {
                                _formKey.currentState!.validate();
                              },
                              child: const Text(
                                'Cadastrar usuário',
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                left: 10,
                top: 10,
                child: SafeArea(
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
