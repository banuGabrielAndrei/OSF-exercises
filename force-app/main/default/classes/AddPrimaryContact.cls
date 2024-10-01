public with sharing class AddPrimaryContact implements Queueable{
    private Contact contact;
    private String state;

    public AddPrimaryContact(Contact contact, String state) {
        this.contact = contact;
        this.state = state;
    }

    public void execute(QueueableContext context) {
        List<Account> acounts = [SELECT Id FROM Account 
                                WHERE BillingState = :state LIMIT 200];
        List<Contact> contacts = new List<Contact>();
        for (Account accnt : acounts) {
            Contact contactClone = contact.clone();
            contactClone.AccountId = accnt.Id;
            contacts.add(contactClone);
        }
        insert contacts;
    }
}