class AppUtil{
  static String _nameRegex = r'^[A-Za-z\s]+$';
  static String _emailRegex =
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
  static String _passwordRegex =
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[/@$#\.][^\s]).{8,16}$';

  static String? validateName(String name)
  {
    if(name.isEmpty){
      return "Enter Your name";
    }
    else if(!RegExp(_nameRegex).hasMatch(name))
      {
        return "Invalid Name";
      }
    else {
      return null;
    }
  }

  static String? validateEmail(String email)
  {
    if(email.isEmpty)
      {
        return "Enter email";

      }
    else if(RegExp(_emailRegex).hasMatch(email))
      {
        return "Invalid Email";
      }

    else {
      return null;
      }

  }

  static String? validateContact(String contact)
  {
    if(contact.isEmpty)
      {
        return "Enter contact";
      }
    else if(contact.length!=10)
      {
        return "Invalid contact";
      }
    else {
      return null;
    }

  }

  static String? validatePassword(String password)
  {
    if(password.isEmpty)
      {
        return "enter password";
      }
   /* else if(!RegExp(_passwordRegex).hasMatch(password))
      {
        return "Invalid Password";
      } */
    else {
      return null;
    }
  }

  static String? validateConfirmPasswod(String p1,String p2) {
    if (p1.isEmpty) {
      return "Passsword field can not be empty";
    }
    else if (p1 != p2) {
      return "password do not match";
    }
    else {
      return null;
    }
  }


}