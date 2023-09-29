
class Validator {
  static String? validateName({required String? name}){
    if (name == null){
      return null;
    }
    if (name.isEmpty) {
      return 'Name is empty';
    }
    return null;
  }

  static String? validateEmail({required String? email}){
    if (email == null) {
      return null;
    }
    RegExp emailRegExp = RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");

    if (email.isEmpty) {
      return 'Email empty';
    } else if (!emailRegExp.hasMatch(email)) {
      return 'Incorrect email format';
    }

    return null;
  }

  static String? validatePassword({required String? password}) {
    if (password == null) {
      return null;
    }

    if (password.isEmpty) {
      return 'Mdp empty';
    } else if (password.length < 4) {
      return 'Mdp plus de 4 charactere ';
    }

    return null;
  }

}