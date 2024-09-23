public with sharing class LeadProcessor implements Database.Batchable<SObject>{
    
   public  Database.QueryLocator start(Database.BatchableContext dbc) {
     return Database.getQueryLocator([SELECT Id, Name FROM Lead]);
   }
   
   public void execute(Database.BatchableContext dbc, List<Lead> leads) {
      for (Lead ld : leads) {
         ld.LeadSource='Dreamforce';
      }
      update leads;
   }

   public void finish(Database.BatchableContext dbc) {
        System.debug('All good');
   }
}