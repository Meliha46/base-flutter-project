class StudentValidationMixin{
  String? validateFirstName(String? value) {
    if (value == null) {
      return "boş geçilemez";
    }
    if (value.length<2){
      return 'İsim en az iki karakter olmalıdır';
    }
    return null;
  }
  String? validateLastName(String? value) {
    if (value == null) {
      return "boş geçilemez";
    }
    if (value.length<2){
      return 'Soyisism en az iki karakter olmalıdır';
    }
    return null;
  }
  String? validateGrade(String? value) {
    var grade=int.parse(value!);
    // ignore: unnecessary_null_comparison
    if (value == null) {
      return "boş geçilemez";
    }
    if (grade<0 || grade>100){
      return 'Alınan not 0 ile 100 arasında olmalıdır';
    }
    return null;
  }
}


