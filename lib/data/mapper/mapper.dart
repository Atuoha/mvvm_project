import 'package:mvvm_project/app/extensions.dart';
import 'package:mvvm_project/data/responses/responses.dart';
import 'package:mvvm_project/domain/models/authentication.dart';
import 'package:mvvm_project/domain/models/customer.dart';

import '../../domain/models/contact.dart';

const empty = "";
const zero = 0;

extension CustomerResponseMapper on CustomerResponse? {
  Customer toDomain() {
    return Customer(
      this?.id.orEmpty() ?? empty,
      this?.name.orEmpty() ?? empty,
      this?.numOfNotifications.orZero() ?? zero,
    );
  }
}

extension ContactResponseMapper on ContactResponse? {
  Contact toDomain() {
    return Contact(
      this?.phone.orEmpty() ?? empty,
      this?.email.orEmpty() ?? empty,
      this?.link.orEmpty() ?? empty,
    );
  }
}

extension AuthenticateResponseMapper on AuthenticateResponse? {
  Authentication toDomain() {
    return Authentication(
      this?.contact?.toDomain(),
      this?.customer?.toDomain(),
    );
  }
}
