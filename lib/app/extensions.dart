// extension on string
extension NonNullString on String? {
  String orEmpty() {
    if (this == null) {
      return "";
    } else {
      return this!;
    }
  }
}


// extension on int
extension NonNullInt on int?{
  int orZero(){
    if(this == null){
      return 0;
    }else{
      return this!;
    }
  }
}