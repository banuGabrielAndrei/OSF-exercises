public with sharing class DailyLeadProcessor implements Schedulable{
    

    public void execute(SchedulableContext ctx) {
        List<Lead> leads = [SELECT Id, Leadsource FROM Lead
                            WHERE Leadsource= null LIMIT 200];
        for (Lead lead: leads) {
            lead.LeadSource='Dreamforce';
        }
        update leads;
    }
}