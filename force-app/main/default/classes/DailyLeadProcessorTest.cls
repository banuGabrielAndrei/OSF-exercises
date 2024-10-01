@isTest
private class DailyLeadProcessorTest {
    private static String cronExpression = '0 0 0 ? * * *';
    
    @isTest
    private static void testSchedulableClass() {
        List<Lead> leads = new List<Lead>();
        for (Integer i = 0; i < 300; i++) {
            if (i < 250) {
                leads.add(new Lead(LastName = 'Test', Company = 'OSF'));
            } else {
                leads.add(new Lead(LastName = 'Test', Company = 'OSF', 
                                                    LeadSource = 'Other'));
            }
        }
        insert leads;
        Test.startTest();
            String jobId = System.schedule('DailyLeadProcessorTest', 
                                    cronExpression, new DailyLeadProcessor());
        Test.stopTest();

        List<Lead> updatedLeads = [SELECT Id, Leadsource FROM Lead
                                    WHERE LeadSource = 'Dreamforce'];
        System.Assert.areEqual(200, updatedLeads.size());

        List<CronTrigger> jobs = [SELECT Id, TimesTriggered, NextFireTime 
                                    FROM CronTrigger WHERE Id =: jobId];
        System.debug('Next fire time ' + jobs[0].NextFireTime);
    }  
}
