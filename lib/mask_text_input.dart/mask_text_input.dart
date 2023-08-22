import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

abstract class IMaskTextInput<T> {
  T phoneNumber();
  T fixedPhoneNumber();
  T cep();
  T cnpj();
  T cpf();
  T data();
}

class MaskTextInput extends IMaskTextInput<TextInputFormatter> {
  @override
  TextInputFormatter phoneNumber() {
    return MaskTextInputFormatter(mask: "(##) # ####-####");
  }

  @override
  TextInputFormatter fixedPhoneNumber() {
    return MaskTextInputFormatter(mask: "(##) ####-####");
  }

  @override
  TextInputFormatter cep() {
    return MaskTextInputFormatter(mask: "#####-###");
  }

  @override
  TextInputFormatter cnpj() {
    return MaskTextInputFormatter(mask: "##.###.###/####-##");
  }

  @override
  TextInputFormatter cpf() {
    return MaskTextInputFormatter(mask: "###.###.###-##");
  }

  @override
  TextInputFormatter data() {
    return MaskTextInputFormatter(mask: "##/##/####");
  }
}
