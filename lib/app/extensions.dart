// extension on string
import '../data/mapper/mapper.dart';

extension NonNullString on String? {
  String orEmpty() {
    if (this == null) {
      return empty;
    } else {
      return this!;
    }
  }
}


// extension on int
extension NonNullInt on int?{
  int orZero(){
    if(this == null){
      return zero;
    }else{
      return this!;
    }
  }
}