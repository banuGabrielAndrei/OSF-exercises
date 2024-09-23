@isTest
private class LeadProcessorTest {

    @isTest
    public static void testBatchClass() {
        List<Lead> leads = new List<Lead>();
        for (Integer i = 0; i < 200; ++i) {
            leads.add(new Lead(LastName='Andrei', Company='OSF'));
        }
        insert leads;

        Test.startTest();
        LeadProcessor lp = new LeadProcessor();
        Database.executeBatch(lp, 200);
        Test.stopTest();

        List<Lead> updatedLeads = [SELECT Id FROM Lead WHERE LeadSOurce='Dreamforce'];
        System.assertEquals(200, updatedLeads.size(), 'Error: At least 1 Lead record not updated correctly');
    }
}