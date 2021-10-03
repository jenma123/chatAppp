import 'package:contacts_service/contacts_service.dart';
import 'package:watsappclone/domain/entities/contact_entity.dart';

abstract class LocalDataSource{
  Future<List<ContactEntity>> getDeviceNumbers();
}

class LocalDataSourceImpl implements LocalDataSource{
  @override
  Future<List<ContactEntity>> getDeviceNumbers()async {
    List<ContactEntity> contacts=[];
    final getContactsData= await ContactsService.getContacts();

    for (var myContact in getContactsData) {
      for (var phoneData in myContact.phones!) {
        contacts.add(ContactEntity(
          phoneNumber: (phoneData.value).toString() ,
          label: (myContact.displayName).toString(), status: '', uid: '',
        ));
      }
    }
    return contacts;
  }

}