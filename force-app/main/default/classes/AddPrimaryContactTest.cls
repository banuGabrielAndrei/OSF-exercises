@isTest
private class AddPrimaryContactTest {

    @isTest
    private static void testQueueableClass() {
        List<Account> acounts = new List<Account>();
        for (Integer i = 0; i < 600; ++i) {
            Account accnt = new Account(Name = 'Test');
            if (i < 300) {
                accnt.BillingState = 'NY';
            } else {
                accnt.BillingState = 'CA';
            }
            acounts.add(accnt);
        }
        insert acounts;
        Contact contact = new Contact(FirstName = 'Andrew', LastName = 'Mason');
        insert contact;

        Test.startTest();
        Id jobId = System.enqueueJob(new AddPrimaryContact(contact, 'CA'));
        Test.stopTest();

        List<Contact> contacts = [SELECT Id FROM Contact WHERE Contact.Account.BillingState = 'CA'];
        System.Assert.areEqual(200, contacts.size(), 'ERROR: Incorrect number of Contact records found');
    }
}