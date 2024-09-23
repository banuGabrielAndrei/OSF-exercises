@isTest
private class AccountProcessorTest {

    @isTest
    private static void accntContactsTest() {
        List<Account> accounts = new List<Account>();
        for (Integer i = 0; i < 200; ++i) {
            accounts.add(new Account(name = 'Test Accnt ' + i));
        }
        insert accounts;
        List<Contact> contacts = new List<Contact>();
        List<Id> ids = new List<Id>();
        for (Account accnt: accounts) {
            contacts.add(new Contact(FirstName = accnt.name, LastName = 'Test', AccountId = accnt.id));
            ids.add(accnt.id);
        }
        insert contacts;

        Test.startTest();
        AccountProcessor.countContacts(ids);
        Test.stopTest();

        List<Account> accnts = [SELECT Id, Number_of_Contacts__c FROM Account];
        for (Account accnt: accnts) {
            System.Assert.areEqual(1, accnt.Number_of_Contacts__c, 'ERROR: At least 1 Account record with incorrect');
        }
    }
}