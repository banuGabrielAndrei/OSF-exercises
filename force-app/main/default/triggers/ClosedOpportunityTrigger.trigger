trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {
    List <Task> Listtask = new List<Task>();
    for (Opportunity opp : Trigger.new){
        if(opp.StageName == 'Closed Won'){
            Task tsk = new Task(whatID = Opp.ID, 
                        Ownerid = Opp.OwnerId, Subject ='Follow Up Test Task');
            Listtask.add(tsk);
        }
    }
    insert Listtask;
}