public with sharing class AccountProcessor {
    
    @future
    public static void countContacts(List<Id> accntIds) {
        List<Account> accnts = [SELECT Id, (SELECT Id FROM Contacts) 
                                FROM Account WHERE Id IN :accntIds];
        for (Account accnt : accnts) {
            accnt.Number_of_Contacts__c = accnt.Contacts.size();
        }
        update accnts;
    }
}