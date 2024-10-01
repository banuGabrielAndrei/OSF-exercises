@isTest
private class AccountManagerTest {

    @isTest
    static void testGetAccount() {
        Account accnt = new Account(Name = 'TestAccount');
        insert accnt;
        Contact conToInsert = new Contact(LastName = 'Test', AccountId = accnt.Id);
        insert conToInsert;
        RestRequest request = new RestRequest();
        request.requestUri =
            'https://mydomain.my.salesforce.com/services/apexrest/Accounts/' + accnt.Id + '/contacts';
        request.httpMethod = 'GET';
        RestContext.request = request;
        Account thisAccount = AccountManager.getAccount();
        // Verify results
        System.Assert.isTrue(thisAccount != null);
        System.Assert.areEqual('TestAccount', thisAccount.Name);
    }
}